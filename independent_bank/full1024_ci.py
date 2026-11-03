#!/usr/bin/env python3
"""Same-run bounded compilation and axiom gates for the complete 1024 prefix.

The caller builds the common project dependencies in a clean directory first.
Only the 64 independent check modules are compiled concurrently; the aggregate
is compiled after every shard and axiom gate has succeeded. Imported olean files
and Mathlib cache remain trusted; this is not a fresh-environment replay.
The runner, compiler, external packages and isolation from concurrent writers
are trusted. Repeated inventories detect persistent changes, not transient
change-and-restore races; they do not make compiler inputs immutable.
"""
import hashlib
import importlib.util
import json
import os
import re
from pathlib import Path
import subprocess
import signal
import tempfile
import time
import sys

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('axioms', ROOT / 'audit/mathlib-bridge-ci/check_axioms.py')
axioms = importlib.util.module_from_spec(spec)
spec.loader.exec_module(axioms)


def check_search_path(project):
    project = Path(project).resolve()
    # Do not treat Lake's dependencies and build outputs as project sources.
    modules = set()
    for directory, dirs, files in os.walk(project):
        dirs[:] = [d for d in dirs if not d.startswith('.')]
        for name in files:
            if name.endswith('.lean'):
                modules.add((Path(directory) / name).relative_to(project).with_suffix('.olean'))
    # Only the pinned lower dependency is built by Lake; every other local
    # module is compiled directly into the project root by this workflow.
    staged_root = project / '.lake/build/lib/lean'
    allowed = {staged_root / 'Erdos302Lower/Defs.olean'}
    for entry in os.environ.get('LEAN_PATH', '').split(os.pathsep):
        root = Path(entry or '.').resolve()
        if root == project:
            continue
        for module in modules:
            candidate = root / module
            if candidate.exists() and candidate not in allowed:
                raise ValueError(f'Lean search path shadow: {candidate}')


def run(project, logs, lean='lean', timeout=900):
    signals = (signal.SIGTERM, signal.SIGINT)
    previous = {s: signal.getsignal(s) for s in signals}
    def cancel(signum, frame):
        for s in signals:
            signal.signal(s, signal.SIG_IGN)
        raise SystemExit(128 + signum)
    try:
        for s in signals:
            signal.signal(s, cancel)
        return _run(project, logs, lean, timeout)
    except BaseException:
        (Path(logs).resolve() / 'full1024-evidence.json').unlink(missing_ok=True)
        raise
    finally:
        for s, handler in previous.items():
            signal.signal(s, handler)


def _run(project, logs, lean='lean', timeout=900):
    project, logs = Path(project).resolve(), Path(logs).resolve()
    logs.mkdir(parents=True, exist_ok=True)
    evidence_path = logs / 'full1024-evidence.json'
    evidence_path.unlink(missing_ok=True)
    check_search_path(project)
    active = {}
    # Freeze every local source and prebuilt local olean before launching any
    # compiler. Mathlib and the Lean toolchain remain trusted external inputs.
    def inventory():
        paths = set()
        for root in (project, project / '.lake/build/lib/lean'):
            for directory, dirs, files in os.walk(root):
                if Path(directory) == project:
                    dirs[:] = [d for d in dirs if d != '.lake']
                for name in files:
                    if name.endswith(('.lean', '.olean')):
                        paths.add(str((Path(directory) / name).relative_to(project)))
        return paths

    frozen = {name: hashlib.sha256((project / name).read_bytes()).hexdigest()
              for name in inventory()}

    def verify_inputs(manifest):
        # Only outputs of running compilers may appear before validation.
        pending = {str(item[3].relative_to(project)) for item in active.values()}
        names = inventory()
        added = names - frozen.keys() - pending
        missing = frozen.keys() - names
        if added or missing:
            raise ValueError(f'input inventory changed: added={sorted(added)} missing={sorted(missing)}')
        for name, expected in manifest.items():
            try:
                actual = hashlib.sha256((project / name).read_bytes()).hexdigest()
            except OSError as exc:
                raise ValueError(f'input changed or missing: {name}') from exc
            if actual != expected:
                raise ValueError(f'input changed: {name}')

    def input_manifest(module):
        manifest = {module + '.lean': frozen[module + '.lean']}
        seen = set()
        def visit(name):
            if name in seen:
                return
            seen.add(name)
            source_name = name.replace('.', '/') + '.lean'
            if source_name not in frozen:
                if name.split('.')[0] not in {'Mathlib', 'Lean', 'Std'}:
                    raise ValueError(f'unknown import without local source: {name}')
                return  # pinned external dependency, trusted as documented
            if name != module:
                manifest[source_name] = frozen[source_name]
                olean = name.replace('.', '/') + '.olean'
                if olean not in frozen and name == 'Erdos302Lower.Defs':
                    olean = '.lake/build/lib/lean/Erdos302Lower/Defs.olean'
                if olean not in frozen:
                    raise ValueError(f'missing local dependency output: {name}')
                manifest[olean] = frozen[olean]
            text = (project / source_name).read_text()
            for line in text.splitlines():
                m = re.match(r'^\s*(?:public\s+)?import\s+([\w.]+)\s*$', line)
                if m:
                    visit(m.group(1))
                elif re.match(r'^\s*(?:public\s+)?import\b', line):
                    raise ValueError(f'unsupported import syntax: {source_name}: {line}')
        visit(module)
        return manifest

    def start(module, names):
        source, output = project / (module + '.lean'), project / (module + '.olean')
        verify_inputs(frozen)
        manifest = input_manifest(module)
        verify_inputs(manifest)
        if not source.is_file() or output.exists():
            raise ValueError(f'missing source or pre-existing output: {module}')
        log = logs / (module + '.log')
        out = log.open('w')
        blocked = signal.pthread_sigmask(signal.SIG_BLOCK, {signal.SIGTERM, signal.SIGINT})
        try:
            out.write(f'Compiling {module}\n'); out.flush()
            # Exec a fresh interpreter rather than using preexec_fn in a
            # potentially threaded parent. It unblocks cancellation before
            # replacing itself with Lean; the PID and process group are stable.
            trampoline = ('import os, signal, sys; '
                          'signal.pthread_sigmask(signal.SIG_UNBLOCK, {signal.SIGINT, signal.SIGTERM}); '
                          'os.execvp(sys.argv[1], sys.argv[1:])')
            proc = subprocess.Popen([sys.executable, '-c', trampoline, lean, '-o', str(output), str(source)], cwd=project,
                                    stdout=out, stderr=subprocess.STDOUT, start_new_session=True)
            active[proc] = (module, names, source, output, log, out, manifest, time.monotonic())
        except BaseException:
            out.close()
            raise
        finally:
            signal.pthread_sigmask(signal.SIG_SETMASK, blocked)

    def stop_all():
        # Defer cancellation until every tracked group is killed and reaped.
        blocked = signal.pthread_sigmask(signal.SIG_BLOCK, {signal.SIGTERM, signal.SIGINT})
        try:
            for proc in active:
                try:
                    os.killpg(proc.pid, signal.SIGKILL)
                except ProcessLookupError:
                    pass
            for proc, (_, _, _, _, _, out, _, _) in active.items():
                proc.wait()
                out.close()
            active.clear()
        finally:
            signal.pthread_sigmask(signal.SIG_SETMASK, blocked)

    def collect_one_batch():
        while True:
            finished = [p for p in active if p.poll() is not None]
            if finished:
                break
            for p, item in active.items():
                if time.monotonic() - item[-1] >= timeout:
                    raise subprocess.TimeoutExpired(p.args, timeout)
            time.sleep(0.02)
        results = []
        # Check all observed failures before accepting successes or scheduling work.
        for proc in finished:
            if proc.returncode:
                raise subprocess.CalledProcessError(proc.returncode, proc.args)
        for proc in finished:
            module, names, source, output, log, out, manifest, _ = active[proc]
            # Do not trust output while a successful leader's children can write it.
            try:
                os.killpg(proc.pid, signal.SIGKILL)
            except ProcessLookupError:
                pass
            deadline = time.monotonic() + 5
            while True:
                live = False
                for stat in Path('/proc').glob('[0-9]*/stat'):
                    try:
                        fields = stat.read_text().rsplit(')', 1)[1].split()
                        if int(fields[2]) == proc.pid and fields[0] not in ('Z', 'X'):
                            live = True
                            break
                    except (FileNotFoundError, ProcessLookupError):
                        continue
                if not live:
                    break
                if time.monotonic() >= deadline:
                    raise RuntimeError(f'process group did not exit: {proc.pid}')
                time.sleep(.01)
            out.close()
            if not output.is_file() or not output.stat().st_size:
                raise ValueError(f'missing or empty output: {module}')
            verify_inputs(frozen)
            verify_inputs(manifest)
            axioms.check(log.read_text(), names)
            digest = hashlib.sha256(output.read_bytes()).hexdigest()
            frozen[str(output.relative_to(project))] = digest
            results.append({'module': module, 'source_sha256': manifest[module + '.lean'],
                            'input_manifest': manifest, 'olean_sha256': digest,
                            'axiom_reports': len(names)})
            del active[proc]
        return results

    try:
        records = []
        next_shard = 0
        while next_shard < 64 or active:
            while next_shard < 64 and len(active) < 2:
                # A peer may have failed while a completed result was validated.
                for proc in active:
                    if proc.poll() not in (None, 0):
                        raise subprocess.CalledProcessError(proc.returncode, proc.args)
                i = next_shard
                start(f'ActualPrefix1024Checks{i}',
                      [f'ActualPrefix1024.check{j}' for j in range(16*i, 16*i+16)])
                next_shard += 1
            records.extend(collect_one_batch())
        records.sort(key=lambda r: int(r['module'].removeprefix('ActualPrefix1024Checks')))
        if [r['module'] for r in records] != [f'ActualPrefix1024Checks{i}' for i in range(64)]:
            raise ValueError('shard coverage mismatch')
        start('ActualPrefix1024Sound',
              [f'ActualPrefix1024.segment{i}' for i in range(64)] +
              ['ActualPrefix1024.checked', 'ActualPrefix1024.sound'])
        final, = collect_one_batch()
    finally:
        stop_all()
    verify_inputs(frozen)
    evidence = {'github_sha': os.environ.get('GITHUB_SHA'), 'run_id': os.environ.get('GITHUB_RUN_ID'),
                'run_attempt': os.environ.get('GITHUB_RUN_ATTEMPT'),
                'checks': sum(r['axiom_reports'] for r in records),
                'segments': 64, 'shards': records, 'aggregate': final}
    fd, tmp = tempfile.mkstemp(prefix='.full1024-evidence-', dir=logs)
    try:
        with os.fdopen(fd, 'w') as out:
            json.dump(evidence, out, indent=2)
            out.write('\n')
        os.replace(tmp, evidence_path)
    finally:
        Path(tmp).unlink(missing_ok=True)
    print('PASS: 64 shards, 1024 checks, 64 segments, checked and sound')


if __name__ == '__main__':
    if len(sys.argv) == 3 and sys.argv[1] == '--check-search-path':
        check_search_path(sys.argv[2])
        raise SystemExit(0)
    if len(sys.argv) != 3:
        raise SystemExit('usage: full1024_ci.py PROJECT LOG_DIRECTORY')
    run(sys.argv[1], sys.argv[2])
