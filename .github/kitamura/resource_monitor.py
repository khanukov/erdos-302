#!/usr/bin/env python3
"""Best-effort Linux resource samples; no command lines or environment values."""
import json
import os
from pathlib import Path
import resource
import time


def read(path):
    try:
        return Path(path).read_text().strip()
    except OSError:
        return None


def sample():
    processes = []
    for path in Path('/proc').iterdir():
        if not path.name.isdigit():
            continue
        text = read(path / 'status')
        if not text:
            continue
        fields = dict(line.split(':', 1) for line in text.splitlines() if ':' in line)
        if fields.get('Name', '').strip() not in ('lean', 'lake'):
            continue
        keys = ('Name', 'PPid', 'Threads', 'VmSize', 'VmPeak', 'VmRSS', 'VmHWM')
        processes.append({'pid': int(path.name), **{k: fields[k].strip() for k in keys if k in fields},
                          'limits': read(path / 'limits')})
    cg = read('/proc/self/cgroup') or ''
    entries = [line.split(':', 2)[2] for line in cg.splitlines() if line.startswith('0::')]
    cgroup = Path('/sys/fs/cgroup') / entries[0].lstrip('/') if entries else None
    names = ('memory.current', 'memory.peak', 'memory.max', 'memory.events',
             'pids.current', 'pids.max', 'pids.events')
    return {'time': time.time(), 'processes': processes, 'cgroup_path': str(cgroup),
            'cgroup': {name: read(cgroup / name) for name in names} if cgroup else {},
            'monitor_rlimit_as': resource.getrlimit(resource.RLIMIT_AS),
            'threads_max': read('/proc/sys/kernel/threads-max'),
            'pid_max': read('/proc/sys/kernel/pid_max'),
            'meminfo': read('/proc/meminfo')}


if __name__ == '__main__':
    while True:
        try:
            print(json.dumps(sample()), flush=True)
        except Exception as exc:
            print(json.dumps({'monitor_error': str(exc)}), flush=True)
        time.sleep(1)
