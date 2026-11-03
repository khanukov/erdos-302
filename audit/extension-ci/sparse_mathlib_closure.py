#!/usr/bin/env python3
"""Stage the exact local dependency closure of SparseBoundaryMathlib."""
import re
import shutil
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
MODULES = {
    'UpperBridge': ['Erdos302Lower.Defs', 'Mathlib.Tactic'],
    'UpperBank': ['UpperBridge'],
    'Extended': ['UpperBank'],
    'Weighted': ['Extended'],
    'Scaling': ['Mathlib.Data.Finset.Card', 'Mathlib.Tactic'],
    'PackRule': ['Weighted', 'Scaling'],
    'Dag': ['PackRule'],
    'UpperRenewal': ['UpperBridge'],
    'Projection': ['UpperRenewal'],
    'BankProfile': ['Dag', 'Projection'],
    'ExtensionSeedCandidate': ['BankProfile', 'PackRule'],
    'SparseTriple': ['Std'],
    'SparseBoundary': ['SparseTriple'],
    'SparseBoundaryMathlib': ['ExtensionSeedCandidate', 'SparseBoundary'],
}
EXTERNAL = {'Std', 'Erdos302Lower.Defs', 'Mathlib.Tactic', 'Mathlib.Data.Finset.Card'}

def validate(root):
    seen = set()
    for name, expected in MODULES.items():
        text = (root / 'lean' / (name + '.lean')).read_text()
        found = []
        for line in text.splitlines():
            if re.match(r'^\s*(?:public\s+|meta\s+)?import\b', line):
                match = re.fullmatch(r'import ([A-Za-z][A-Za-z0-9_.]*)', line)
                if not match:
                    raise ValueError(f'{name}: unsupported import {line}')
                found.append(match.group(1))
        if found != expected:
            raise ValueError(f'{name}: import mismatch {found!r}')
        if any(dep not in seen and dep not in EXTERNAL for dep in found):
            raise ValueError(f'{name}: missing or unordered dependency')
        if re.search(r'\b(?:sorry|admit|native_decide)\b', text):
            raise ValueError(f'{name}: forbidden token')
        seen.add(name)
    reached = set()
    def visit(name):
        if name in reached: return
        reached.add(name)
        for dep in MODULES[name]:
            if dep in MODULES: visit(dep)
    visit('SparseBoundaryMathlib')
    if reached != set(MODULES): raise ValueError('disconnected inventory')

def stage(root, dest):
    validate(root)
    dest.mkdir(parents=True, exist_ok=True)
    if any(dest.iterdir()): raise ValueError('staging directory is not empty')
    for name in MODULES:
        shutil.copyfile(root / 'lean' / (name + '.lean'), dest / (name + '.lean'))
    if {p.name for p in dest.iterdir()} != {name + '.lean' for name in MODULES}:
        raise ValueError('staged inventory mismatch')
    print('PASS exact closure:', ' '.join(MODULES))

if __name__ == '__main__':
    try:
        if len(sys.argv) != 2: raise ValueError('usage: sparse_mathlib_closure.py DEST')
        stage(ROOT, Path(sys.argv[1]))
    except (ValueError, OSError) as e:
        raise SystemExit(f'FAIL: {e}')
