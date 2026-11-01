#!/usr/bin/env python3
"""Fail if any materialized package differs from the tracked manifest."""
import json
from pathlib import Path
import subprocess
import sys

root = Path(sys.argv[1]).resolve()
manifest = json.loads((root / 'lake-manifest.json').read_text())
packages = manifest['packages']
assert len(packages) == 10, 'unexpected package count'
expected = {'formal_conjectures': '69a8f0781aa26ca8b46d615df5ed80f698467ae4',
            'mathlib': 'a3a10db0e9d66acbebf76c5e6a135066525ac900'}
for p in packages:
    name, rev = p['name'], p['rev']
    if len(rev) != 40 or any(c not in '0123456789abcdef' for c in rev):
        raise RuntimeError(f'bad lock revision {name}: {rev}')
    if name in expected and expected[name] != rev:
        raise RuntimeError(f'unexpected lock revision: {name}')
    path = root / '.lake/packages' / name
    got = subprocess.check_output(['git', '-C', str(path), 'rev-parse', 'HEAD'], text=True).strip()
    if got != rev:
        raise RuntimeError(f'{name}: expected {rev}, got {got}')
    print(name, got)
if not set(expected) <= {p['name'] for p in packages}:
    raise RuntimeError('required package missing')
