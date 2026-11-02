#!/usr/bin/env python3
"""Compile the bridge's local closure in dependency order, reusing this run's chain."""
import importlib.util
import os
from pathlib import Path
import subprocess
import sys

helper, out = map(lambda s: Path(s).resolve(), sys.argv[1:])
spec = importlib.util.spec_from_file_location('chain', helper)
assert spec and spec.loader
mod = importlib.util.module_from_spec(spec)
spec.loader.exec_module(mod)
order = mod.closure('ProfileBridge')
if 'ProfileBridge' not in order or 'Erdos302ReflectiveChainTopFC' not in order:
    raise RuntimeError('incomplete closure')
env = os.environ.copy()
env['LEAN_PATH'] = str(out) + os.pathsep + env.get('LEAN_PATH', '')
for name in order:
    obj = out / (name.replace('.', '/') + '.olean')
    if obj.is_file() and obj.stat().st_size:
        continue
    obj.parent.mkdir(parents=True, exist_ok=True)
    print('BUILD BRIDGE', name, flush=True)
    subprocess.run(['lean', '-j', '1', '-o', str(obj), name.replace('.', '/') + '.lean'], env=env, check=True)
    if not obj.is_file() or not obj.stat().st_size:
        raise RuntimeError('missing olean ' + name)
print('bridge closure modules', len(order), flush=True)
