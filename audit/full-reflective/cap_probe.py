#!/usr/bin/env python3
"""Compare fresh identical commands under two RLIMIT_AS caps; not a proof gate."""
import argparse
import hashlib
import json
import sys
import os
from pathlib import Path
import resource
import signal
import subprocess
import threading
import time


def read(path):
    try:
        return Path(path).read_text().strip()
    except OSError:
        return None


def cgroup_dir():
    # GitHub's Linux hosts normally expose unified cgroup v2 at this mount.
    for line in Path('/proc/self/cgroup').read_text().splitlines():
        if line.startswith('0::'):
            return Path('/sys/fs/cgroup') / line[3:].lstrip('/')
    return None


def snapshot(cg):
    if cg is None:
        return {}
    return {name: read(cg / name) for name in
            ('memory.current', 'memory.peak', 'memory.max', 'memory.swap.current',
             'memory.events', 'memory.events.local', 'memory.stat')}


def inventory(roots, optional_roots=()):
    """Hash reachable files; explicitly record absent optional search roots."""
    entries = {}
    missing = []
    def visit(path, ancestors):
        stat = path.stat()
        if path.is_dir():
            identity = (stat.st_dev, stat.st_ino)
            if identity in ancestors:
                raise ValueError(f'input directory cycle: {path}')
            for child in sorted(path.iterdir()):
                if child.name != '.git':
                    visit(child, ancestors | {identity})
        elif path.is_file():
            digest = hashlib.sha256()
            with path.open('rb') as source:
                for block in iter(lambda: source.read(1024 * 1024), b''):
                    digest.update(block)
            entries[str(path.absolute())] = {'resolved_path': str(path.resolve(strict=True)),
                                             'sha256': digest.hexdigest(), 'size': stat.st_size}
        else:
            raise ValueError(f'unsupported input: {path}')
    for root in roots:
        visit(root, set())
    for root in optional_roots:
        try:
            root.stat()
        except FileNotFoundError:
            # Do not turn a dangling symlink into an accepted missing root.
            for part in (root, *root.parents):
                if part.is_symlink():
                    part.resolve(strict=True)
            missing.append(str(root.absolute()))
            continue
        visit(root, set())
    return {'files': dict(sorted(entries.items())), 'missing_roots': sorted(set(missing))}


def write_inventory(out, name, roots, optional_roots=()):
    data = inventory(roots, optional_roots)
    (out / name).write_text(json.dumps(data, indent=2) + '\n')
    return data


def run(cap_kib, command, output, timeout, input_roots=(), optional_roots=()):
    out = output / str(cap_kib)
    out.mkdir(parents=True, exist_ok=True)
    cg = cgroup_dir()
    before = snapshot(cg)
    samples = []
    stop = threading.Event()
    def sample():
        while not stop.wait(0.5):
            samples.append({'monotonic': time.monotonic(),
                            'memory.current': read(cg / 'memory.current') if cg else None})
    def limit():
        os.setsid()
        resource.setrlimit(resource.RLIMIT_AS, (cap_kib * 1024, cap_kib * 1024))
    inputs_before = write_inventory(out, 'inputs-before.json', input_roots, optional_roots)
    started = time.monotonic()
    with (out / 'stdout.log').open('w') as stdout, (out / 'stderr.log').open('w') as stderr:
        proc = subprocess.Popen(command, stdout=stdout, stderr=stderr, preexec_fn=limit)
        thread = threading.Thread(target=sample, daemon=True)
        thread.start()
        timed_out = False
        try:
            while True:
                pid, status, usage = os.wait4(proc.pid, os.WNOHANG)
                if pid:
                    break
                if time.monotonic() - started >= timeout:
                    timed_out = True
                    try:
                        os.killpg(proc.pid, signal.SIGKILL)
                    except ProcessLookupError:
                        pass
                    _, status, usage = os.wait4(proc.pid, 0)
                    break
                time.sleep(0.02)
            code = os.waitstatus_to_exitcode(status)
            proc.returncode = code
        finally:
            stop.set()
            thread.join()
    elapsed = time.monotonic() - started
    inputs_after = write_inventory(out, 'inputs-after.json', input_roots, optional_roots)
    report = {'cap_kib': cap_kib, 'cap_kind': 'per-process RLIMIT_AS',
              'command': command, 'returncode': code, 'timed_out': timed_out,
              'elapsed_seconds': elapsed, 'max_rss_kib': usage.ru_maxrss,
              'inputs_unchanged': inputs_before == inputs_after,
              'input_roots': [str(p) for p in input_roots],
              'allow_missing_input_roots': [str(p) for p in optional_roots],
              'cgroup_path': str(cg) if cg else None, 'cgroup_before': before,
              'cgroup_after': snapshot(cg), 'cgroup_samples': samples,
              'note': 'cgroup metrics are shared aggregate/lifetime values; wait4 max RSS is the direct command and reaped children, not a concurrent process-tree sum. Input manifests cover declared roots, not arbitrary system or dynamically opened files.'}
    (out / 'report.json').write_text(json.dumps(report, indent=2) + '\n')
    return report


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--timeout', type=int, default=900)
    parser.add_argument('--input', type=Path, action='append', required=True,
                        help='input file or directory to hash before and after each run; repeatable')
    parser.add_argument('--allow-missing-input', type=Path, action='append', default=[],
                        help='search root which may be absent; presence and contents are still inventoried')
    parser.add_argument('command', nargs=argparse.REMAINDER)
    args = parser.parse_args()
    command = args.command
    if command and command[0] == '--':
        command = command[1:]
    if not command or args.timeout <= 0:
        parser.error('a command and positive timeout are required')
    args.output.mkdir(parents=True, exist_ok=True)
    roots = [p.absolute() for p in args.input]
    optional_roots = [p.absolute() for p in args.allow_missing_input]
    output = args.output.resolve()
    for root in roots + optional_roots:
        resolved = root.resolve(strict=root in roots)
        if resolved == output or resolved in output.parents:
            parser.error('output must be outside input roots')
    reports = []
    for cap in (8388608, 25165824):
        print(f'Running {command!r} with RLIMIT_AS={cap} KiB', flush=True)
        reports.append(run(cap, command, output, args.timeout, roots, optional_roots))
    first = json.loads((output / str(8388608) / 'inputs-before.json').read_text())
    second = json.loads((output / str(25165824) / 'inputs-before.json').read_text())
    identical = first == second and all(r['inputs_unchanged'] for r in reports)
    for r in reports:
        r['inputs_identical_across_runs'] = identical
        (output / str(r['cap_kib']) / 'report.json').write_text(json.dumps(r, indent=2) + '\n')
    (output / 'comparison.json').write_text(json.dumps(reports, indent=2) + '\n')
    for r in reports:
        print(f"{r['cap_kib']} KiB: returncode={r['returncode']} timed_out={r['timed_out']} elapsed={r['elapsed_seconds']:.2f}s")
    print('Diagnostic only: neither outcome changes the proof gate.')
    if not identical:
        print('Input identity mismatch: comparison invalid', file=sys.stderr)
        return 1
    return 0


if __name__ == '__main__':
    sys.exit(main())
