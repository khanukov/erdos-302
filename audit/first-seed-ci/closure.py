#!/usr/bin/env python3
"""Stage the exact tail-demand source closure; reject unrecognized imports."""
import re
import shutil
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
MODULES = {
    'Erdos302Lower.Defs': ('lean/Erdos302Lower/Defs.lean', ['Mathlib.Data.Rat.Defs', 'Mathlib.Data.Finset.Basic']),
    'UpperBridge': ('lean/UpperBridge.lean', ['Erdos302Lower.Defs', 'Mathlib.Tactic']),
    'UpperBank': ('lean/UpperBank.lean', ['UpperBridge']),
    'Extended': ('lean/Extended.lean', ['UpperBank']),
    'Weighted': ('lean/Weighted.lean', ['Extended']),
    'Scaling': ('lean/Scaling.lean', ['Mathlib.Data.Finset.Card', 'Mathlib.Tactic']),
    'PackRule': ('lean/PackRule.lean', ['Weighted', 'Scaling']),
    'Dag': ('lean/Dag.lean', ['PackRule']),
    'UpperRenewal': ('lean/UpperRenewal.lean', ['UpperBridge']),
    'Projection': ('lean/Projection.lean', ['UpperRenewal']),
    'BankProfile': ('lean/BankProfile.lean', ['Dag', 'Projection']),
    'ArchiveSmallPrefix': ('lean/ArchiveSmallPrefix.lean', ['BankProfile']),
    'Renewal': ('lean/Renewal.lean', ['Mathlib.Data.Nat.Factorization.Basic', 'Mathlib.Data.Nat.Prime.Basic', 'Mathlib.Order.Interval.Finset.Nat', 'Mathlib.Tactic']),
    'SmoothRenewal': ('lean/SmoothRenewal.lean', ['Renewal']),
    'ArchiveFirstSeedCandidate': ('lean/ArchiveFirstSeedCandidate.lean', ['ArchiveSmallPrefix', 'SmoothRenewal']),
    'ArchiveFirstSeedContract': ('tests/ArchiveFirstSeedContract.lean', ['ArchiveFirstSeedCandidate']),
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
    visit('ArchiveFirstSeedContract')
    if reached != set(MODULES):
        raise ValueError(f'disconnected source inventory: {set(MODULES) - reached}')

def stage(root, dest):
    validate(root)
    dest.mkdir(parents=True, exist_ok=True)
    for name, (path, _) in MODULES.items():
        target = dest.joinpath(*name.split('.')).with_suffix('.lean')
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(root / path, target)
    actual = {p.relative_to(dest).as_posix() for p in dest.rglob('*.lean')}
    expected = {name.replace('.', '/') + '.lean' for name in MODULES}
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
