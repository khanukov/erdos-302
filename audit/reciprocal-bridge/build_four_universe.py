#!/usr/bin/env python3
"""Build the candidate closure against upstream oleans produced in this job."""
import importlib.util
import os
from pathlib import Path
import subprocess
import sys

root = Path.cwd()
helper, out = map(lambda s: Path(s).resolve(), sys.argv[1:])
spec = importlib.util.spec_from_file_location('chain', helper)
if not spec or not spec.loader:
    raise RuntimeError('cannot load chain helper')
mod = importlib.util.module_from_spec(spec)
spec.loader.exec_module(mod)
upstream = set(mod.audited_full_closure())
order = mod.closure('FourUniverseCandidate')
local = {'FourExternalCandidate', 'ActiveSupport', 'ReciprocalBridge', 'Extended',
         'UpperBank', 'UpperBridge', 'Erdos302Lower.Defs', 'FourEdgeShardsCandidate',
         'FourEdgeSoundnessCandidate', 'FourEdgeAssemblyCandidate', 'FourUniverseCandidate'}
if set(order) - upstream != local or not upstream <= set(order):
    raise RuntimeError(f'candidate closure mismatch: local={sorted(set(order)-upstream)}; missing upstream={sorted(upstream-set(order))}')
if not out.is_dir():
    raise RuntimeError('missing fresh upstream output')
env = os.environ.copy()
env['LEAN_PATH'] = str(out) + os.pathsep + env.get('LEAN_PATH', '')
for name in order:
    obj = out / (name.replace('.', '/') + '.olean')
    if name in upstream:
        if not obj.is_file() or not obj.stat().st_size:
            raise RuntimeError('missing freshly built upstream object: ' + name)
        continue
    if obj.exists():
        raise RuntimeError('unexpected preexisting local object: ' + name)
    obj.parent.mkdir(parents=True, exist_ok=True)
    print('BUILD FOUR', name, flush=True)
    subprocess.run(['lean', '-j', '1', '-o', str(obj), name.replace('.', '/') + '.lean'], env=env, check=True)
    if not obj.is_file() or not obj.stat().st_size:
        raise RuntimeError('missing object: ' + name)
print('candidate closure modules', len(order), flush=True)
