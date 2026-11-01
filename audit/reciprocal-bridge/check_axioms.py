#!/usr/bin/env python3
"""Fail closed unless each requested Lean theorem has only standard axioms."""
import re
import sys
from pathlib import Path

ALLOWED = {'propext', 'Classical.choice', 'Quot.sound'}

def check(text, names):
    for name in names:
        pattern = rf"'{re.escape(name)}'\s+(?:does not depend on any axioms|depends on axioms:\s*\[([^\]]*)\])"
        matches = list(re.finditer(pattern, text))
        if len(matches) != 1:
            raise ValueError(f'missing or duplicate axiom report: {name}')
        axioms = set(re.findall(r'[A-Za-z_][A-Za-z_0-9.]*', matches[0].group(1) or ''))
        if not axioms <= ALLOWED:
            raise ValueError(f'forbidden axioms in {name}: {sorted(axioms - ALLOWED)}')
    if 'sorryAx' in text or 'ofReduceBool' in text or 'error:' in text:
        raise ValueError('forbidden axiom or Lean error in log')

if __name__ == '__main__':
    if len(sys.argv) < 3:
        raise SystemExit('usage: check_axioms.py LOG THEOREM...')
    try:
        check(Path(sys.argv[1]).read_text(), sys.argv[2:])
    except ValueError as error:
        print(f'FAIL: {error}', file=sys.stderr)
        raise SystemExit(1)
    print(f'PASS: {len(sys.argv)-2} allowed-axiom reports')
