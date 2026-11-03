#!/usr/bin/env python3
"""Fail-closed staging of the isolated extension candidate's local closure."""
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
    'ExtensionBoundaryData': ['ExtensionSeedCandidate'],
    **{f'ExtensionBoundaryShard{i:02}': ['ExtensionBoundaryData'] for i in range(20)},
    'ExtensionBoundaryAssembly': [f'ExtensionBoundaryShard{i:02}' for i in range(20)],
}

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
        for dep in found:
            if not (dep.startswith('Mathlib.') or dep == 'Erdos302Lower.Defs' or dep in seen):
                raise ValueError(f'{name}: missing/unordered import {dep}')
        if re.search(r'\b(?:sorry|admit|native_decide)\b', text):
            raise ValueError(f'{name}: forbidden token')
        seen.add(name)
    reached = set()
    def visit(name):
        if name in reached: return
        reached.add(name)
        for dep in MODULES[name]:
            if dep in MODULES: visit(dep)
    visit('ExtensionBoundaryAssembly')
    if reached != set(MODULES): raise ValueError('disconnected module inventory')

def stage(root, dest):
    validate(root)
    dest.mkdir(parents=True, exist_ok=True)
    if any(dest.glob('*.lean')): raise ValueError('staging directory is not empty')
    for name in MODULES:
        shutil.copyfile(root / 'lean' / (name + '.lean'), dest / (name + '.lean'))
    if {p.stem for p in dest.glob('*.lean')} != set(MODULES):
        raise ValueError('staged inventory mismatch')
    print('PASS closure:', ' '.join(MODULES))

if __name__ == '__main__':
    try:
        if len(sys.argv) != 2: raise ValueError('usage: closure.py DEST')
        stage(ROOT, Path(sys.argv[1]))
    except (ValueError, OSError) as e:
        raise SystemExit(f'FAIL: {e}')
