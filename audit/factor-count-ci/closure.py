#!/usr/bin/env python3
"""Validate and print the exact topologically ordered local import closure."""
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
ORDER = ["Renewal", "SmoothRenewal", "Summation", "BlockAccounting",
         "SmoothPartition", "SmoothExistence", "SmoothCover", "RoughCoprime",
         "CellEquivalence", "SuffixBijectionCandidate", "FactorCountCandidate",
         "FactorCountCandidateTests", "FactorCountAxioms"]
seen = set()
mathlib = set()

def visit(module):
    if module.startswith("Mathlib."):
        mathlib.add(module)
        return
    if module in seen:
        return
    path = ROOT / "lean" / (module.replace('.', '/') + '.lean')
    if not path.is_file():
        raise SystemExit(f"missing local import {module}")
    seen.add(module)
    for line in path.read_text().splitlines():
        match = re.match(r'^import\s+(.+)$', line)
        if match:
            for dependency in match.group(1).split():
                visit(dependency)

visit('FactorCountCandidateTests')
visit('FactorCountAxioms')
if seen != set(ORDER):
    raise SystemExit(f"closure drift: missing={sorted(seen-set(ORDER))}, extra={sorted(set(ORDER)-seen)}")
for i, module in enumerate(ORDER):
    text = (ROOT / 'lean' / (module.replace('.', '/') + '.lean')).read_text()
    for line in text.splitlines():
        match = re.match(r'^import\s+(.+)$', line)
        if match:
            for dep in match.group(1).split():
                if dep in ORDER and ORDER.index(dep) >= i:
                    raise SystemExit(f'bad build order: {module} imports {dep}')
print('Local modules:', ', '.join(ORDER))
print('Mathlib imports:', ', '.join(sorted(mathlib)))
