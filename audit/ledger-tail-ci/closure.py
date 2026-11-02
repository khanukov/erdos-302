#!/usr/bin/env python3
"""Stage the exact tail-demand source closure; reject unrecognized imports."""
import re
import shutil
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
MODULES = {
    'Renewal': ('lean/Renewal.lean', ['Mathlib.Data.Nat.Factorization.Basic', 'Mathlib.Data.Nat.Prime.Basic', 'Mathlib.Order.Interval.Finset.Nat', 'Mathlib.Tactic']),
    'SmoothRenewal': ('lean/SmoothRenewal.lean', ['Renewal']),
    'DemandRenewalChain': ('lean/DemandRenewalChain.lean', ['SmoothRenewal']),
    'LedgerChecker': ('audit/ledger-candidate/lean/LedgerChecker.lean', ['Mathlib.Data.Rat.Defs', 'Mathlib.Tactic']),
    'LedgerTailDemand': ('lean/LedgerTailDemand.lean', ['DemandRenewalChain', 'LedgerChecker']),
    'LedgerTailDemandTests': ('lean/LedgerTailDemandTests.lean', ['LedgerTailDemand']),
}
ORDER = list(MODULES)

def validate(root):
    seen = set()
    for name, (path, imports) in MODULES.items():
        text = (root / path).read_text()
        # Imports must be plain, one-module lines, before any other source text.
        lines = text.splitlines()
        found = []
        for line in lines:
            if re.match(r'^\s*(?:public\s+|meta\s+)?import\b', line):
                match = re.fullmatch(r'import ([A-Za-z][A-Za-z0-9_.]*)', line)
                if not match:
                    raise ValueError(f'{path}: unsupported import syntax: {line}')
                found.append(match.group(1))
        if found != imports:
            raise ValueError(f'{path}: imports {found!r}, expected {imports!r}')
        for dep in found:
            if not dep.startswith('Mathlib.') and dep not in seen:
                raise ValueError(f'{name}: missing or unordered dependency {dep}')
        seen.add(name)
    # The roots and graph are explicit; no source can be silently resolved via an ambient olean.
    reached = set()
    def visit(name):
        if name in reached:
            return
        reached.add(name)
        for dep in MODULES[name][1]:
            if not dep.startswith('Mathlib.'):
                visit(dep)
    visit('LedgerTailDemandTests')
    if reached != set(MODULES):
        raise ValueError(f'disconnected source inventory: {set(MODULES) - reached}')

def stage(root, dest):
    validate(root)
    dest.mkdir(parents=True, exist_ok=True)
    for name, (path, _) in MODULES.items():
        shutil.copyfile(root / path, dest / (name + '.lean'))
    actual = {p.name for p in dest.glob('*.lean')}
    expected = {name + '.lean' for name in MODULES}
    if actual != expected:
        raise ValueError(f'staged source inventory mismatch: {actual ^ expected}')
    print('PASS closure:', ', '.join(ORDER))

if __name__ == '__main__':
    if len(sys.argv) != 2:
        raise SystemExit('usage: closure.py DESTINATION')
    try:
        stage(ROOT, Path(sys.argv[1]))
    except (ValueError, OSError) as exc:
        raise SystemExit(f'FAIL: {exc}')
