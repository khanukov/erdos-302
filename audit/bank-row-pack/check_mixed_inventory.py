#!/usr/bin/env python3
"""Fail closed on the exact ordered local source/import inventory for this job."""
from pathlib import Path
import re

root = Path(__file__).resolve().parents[2]
expected = {
    'UpperBridge': ['Erdos302Lower.Defs', 'Mathlib.Tactic'],
    'UpperBank': ['UpperBridge'], 'Extended': ['UpperBank'],
    'Weighted': ['Extended'], 'Scaling': ['Mathlib.Data.Finset.Card', 'Mathlib.Tactic'],
    'PackRule': ['Weighted', 'Scaling'], 'Dag': ['PackRule'],
    'BankRowPack': ['Dag'], 'BankRowPackTests': ['BankRowPack'],
    'BankRowPackArchive1090': ['BankRowPack'], 'MixedDag': ['Dag'],
    'MixedDagTests': ['MixedDag'], 'CaseRules': ['Mathlib.Data.Finset.Card', 'Mathlib.Tactic'],
    'CaseDual': ['CaseRules'], 'CaseTree': ['CaseDual'],
    'MixedCaseTrimCandidate': ['MixedDag', 'CaseTree'],
    'MixedCaseTrimCandidateTest': ['MixedCaseTrimCandidate'],
}
seen = {'Erdos302Lower.Defs'}
for name, imports in expected.items():
    text = (root / 'lean' / (name + '.lean')).read_text()
    if re.search(r'\b(?:sorry|admit|native_decide)\b', text):
        raise SystemExit(f'{name}: forbidden proof token')
    actual = []
    for line in text.splitlines():
        if re.match(r'^\s*import\b', line):
            m = re.fullmatch(r'import ([A-Za-z0-9_.]+)', line)
            if not m:
                raise SystemExit(f'unsupported import syntax in {name}: {line}')
            actual.append(m.group(1))
    if actual != imports:
        raise SystemExit(f'{name}: imports {actual!r}, expected {imports!r}')
    for dep in imports:
        if not dep.startswith('Mathlib.') and dep not in seen:
            raise SystemExit(f'{name}: unbuilt or unknown import {dep}')
    seen.add(name)
workflow = (root / '.github/workflows/bank-row-pack-candidate.yml').read_text()
match = re.search(r'for f in ([A-Za-z0-9_ ]+); do', workflow)
if not match or match.group(1).split() != list(expected):
    raise SystemExit('workflow compilation list differs from exact ordered inventory')
copies = re.findall(r'cp lean/\{([^}]+)\}\.lean \"\$p/\"', workflow)
copied = [item for group in copies for item in group.split(',')]
if copied != list(expected):
    raise SystemExit(f'workflow copy list differs from inventory: {copied!r}')
for name in expected:
    if not (root / 'lean' / (name + '.lean')).is_file():
        raise SystemExit(f'missing {name}')
print('exact ordered local import inventory OK:', len(expected), 'modules plus pinned Defs')
