#!/usr/bin/env python3
"""Bounded same-project Node 1209 compilation; never imports CI artifacts."""
import concurrent.futures
import hashlib
import importlib.util
import os
from pathlib import Path
import re
import signal
import subprocess
import sys
import time

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('check_axioms', ROOT / 'audit/mathlib-bridge-ci/check_axioms.py')
checker = importlib.util.module_from_spec(spec)
spec.loader.exec_module(checker)


class Job:
    def __init__(self, name, command, names, output=None):
        self.name, self.command, self.names, self.output = name, command, names, output


def source_snapshot(directory):
    """Inventory and hash the local source files used by these phases."""
    return {str(p.relative_to(directory)): hashlib.sha256(p.read_bytes()).hexdigest()
            for p in sorted(directory.rglob('*.lean'))
            if '.lake' not in p.relative_to(directory).parts}


def run_jobs(jobs, logdir, workers, timeout, memory_mb, source_guard=None):
    if workers < 1 or workers > 2 or timeout <= 0 or memory_mb < 1 or memory_mb > 32768:
        raise ValueError('invalid resource limits')
    if len({j.name for j in jobs}) != len(jobs):
        raise ValueError('duplicate job')
    logdir.mkdir(parents=True, exist_ok=True)
    def run(job):
        started = time.monotonic()
        log = logdir / (job.name + '.log')
        if job.output is not None and Path(job.output).exists():
            raise RuntimeError('pre-existing output: ' + str(job.output))
        if source_guard:
            source_guard()
        with log.open('wb') as out:
            p = subprocess.Popen(['prlimit', '--as=' + str(memory_mb * 1024 * 1024), '--', *job.command], stdout=out, stderr=subprocess.STDOUT, start_new_session=True)
            try:
                rc = p.wait(timeout=timeout)
            except subprocess.TimeoutExpired:
                os.killpg(p.pid, signal.SIGKILL)
                p.wait()
                raise RuntimeError(job.name + ': timeout')
            finally:
                # Also terminate descendants left by a compiler which exited early.
                try:
                    os.killpg(p.pid, signal.SIGKILL)
                except ProcessLookupError:
                    pass
        if rc:
            raise RuntimeError(f'{job.name}: compiler exited {rc}; see {log}')
        if job.output is not None and not Path(job.output).is_file():
            raise RuntimeError(job.name + ': compiler did not produce output')
        if source_guard:
            source_guard()
        if job.names:
            try:
                checker.check(log.read_text(), job.names)
            except ValueError as exc:
                raise RuntimeError(f'{job.name}: {exc}') from exc
        print(f'{job.name}: {time.monotonic()-started:.1f}s', flush=True)
    with concurrent.futures.ThreadPoolExecutor(max_workers=workers) as pool:
        futures = [pool.submit(run, job) for job in jobs]
        errors = []
        for f in concurrent.futures.as_completed(futures):
            try:
                f.result()
            except Exception as exc:
                errors.append(str(exc))
        if errors:
            raise RuntimeError('; '.join(errors))


def compile_job(name, names):
    return Job(name, ['lean', '-o', name + '.olean', name + '.lean'], names, name + '.olean')


def main():
    if len(sys.argv) != 3 or sys.argv[1] not in ('rows', 'capacity'):
        raise SystemExit('usage: node1209_parallel.py rows|capacity LOGDIR')
    phase, logdir = sys.argv[1], Path(sys.argv[2])
    jobs = []
    if phase == 'rows':
        for b in range(64):
            n = f'Node1209Rows{b:03d}'
            names = [f'{n}.{kind}{i}' for i in range(b*8, min(b*8+8, 510)) for kind in ('check', 'bound')]
            jobs.append(compile_job(n, names))
    else:
        total = 0
        for b in range(91):
            n = f'Node1209Capacity{b:03d}'
            vertices = re.findall(r'^theorem vertex(\d+) :', Path(n + '.lean').read_text(), re.M)
            if len(vertices) != (10 if b < 90 else 1) or len(set(vertices)) != len(vertices):
                raise ValueError('unexpected vertex count for ' + n)
            total += len(vertices)
            jobs.append(compile_job(n, [n+'.capacity'] + [n+'.vertex'+v for v in vertices]))
        if total != 901:
            raise ValueError('unexpected total vertex count')
    started = time.monotonic()
    directory = Path.cwd()
    expected_sources = source_snapshot(directory)
    def guard():
        if source_snapshot(directory) != expected_sources:
            raise RuntimeError('local Lean source inventory or content changed')
    run_jobs(jobs, logdir, workers=1, timeout=1200, memory_mb=32768, source_guard=guard)
    guard()
    print(f'{phase}: {len(jobs)} modules in {time.monotonic()-started:.1f}s wall', flush=True)


if __name__ == '__main__':
    main()
