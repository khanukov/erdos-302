#!/usr/bin/env python3
"""Compile the exact upstream files and bridge with the same Lean/Lake environment."""
import json
import hashlib
import os
from pathlib import Path
import subprocess
import sys
from check_axioms import check

project = Path(sys.argv[1]).resolve()
manifest_bytes = (project / 'lake-manifest.json').read_bytes()
if hashlib.sha256(manifest_bytes).hexdigest() != '61dfd356c0ee4956a664a53a9c6f8c0f81cbd450031ac370e5a6e6f4bc1870ed':
    raise RuntimeError('manifest changed during Lake setup')
manifest = json.loads(manifest_bytes)
for pkg in manifest['packages']:
    actual = subprocess.check_output(['git', '-C', str(project / '.lake/packages' / pkg['name']), 'rev-parse', 'HEAD'], text=True).strip()
    if actual != pkg['rev']:
        raise RuntimeError(f"wrong package revision: {pkg['name']} {actual} != {pkg['rev']}")
version = subprocess.check_output(['lean', '--version'], text=True)
if '4.33.0-rc1' not in version:
    raise RuntimeError('wrong Lean version: ' + version)
lp = subprocess.check_output(['lake', 'env', 'printenv', 'LEAN_PATH'], cwd=project, text=True).strip()
out = project / 'fresh-oleans'
out.mkdir(exist_ok=False)
env = dict(os.environ, LEAN_PATH=str(out) + os.pathsep + lp)
modules = [
    ('Erdos302CertificateCoreFC', ['Erdos302Certificate.certificate_tree_forces_card']),
    ('Erdos302CoverRowsFC', ['Erdos302CoverRowsFC.certificate_tree_cover_lower_bound']),
    ('UpperBridge', ['UpperBridge.reciprocal_iff_product', 'UpperBridge.finite_card_bound']),
    ('ReciprocalBridge', ['UpperBridge.reciprocal_lt_denominators', 'UpperBridge.reciprocal_ordered_edge', 'UpperBridge.orderedCover_to_upstream']),
]
for mod, names in modules:
    result = subprocess.run(['lean', '-j', '1', '-o', str(out / (mod + '.olean')), mod + '.lean'], cwd=project, env=env, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    print(result.stdout, end='', flush=True)
    if result.returncode or not (out / (mod + '.olean')).is_file():
        raise RuntimeError('compilation failed: ' + mod)
    check(result.stdout, names)
result = subprocess.run(['lean', '-j', '1', 'ReciprocalBridgeTest.lean'], cwd=project, env=env, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
print(result.stdout, end='', flush=True)
if result.returncode or 'error:' in result.stdout:
    raise RuntimeError('regression tests failed')
print('PASS: upstream closure and reciprocal bridge rebuilt in one Lean environment')
