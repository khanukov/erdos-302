#!/usr/bin/env python3
"""Standalone literal rounding diagnostic, not a root-validity proof."""
from pathlib import Path
import sys
import node1209_pack_all

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / 'audit/node1209-root-literal/RootRoundingLiteral.lean'


def render(rows):
    if len(rows) != 510:
        raise ValueError('expected exactly 510 occurrence rows')
    pairs = []
    for i, row in enumerate(rows):
        if row['index'] != i or any(type(row[k]) is not int or row[k] < 0 for k in ('weight', 'demand')):
            raise ValueError('invalid occurrence data')
        pairs.append(f"({row['weight']}, {row['demand']})")
    lines = ['-- Generated diagnostic; no connection to the root bridge is claimed.',
             'import Init', 'namespace RootRoundingLiteral',
             'set_option maxRecDepth 65536', 'set_option maxHeartbeats 100000000',
             'def rows : List (Nat × Nat) := [']
    lines += ['  ' + ', '.join(pairs[i:i+8]) + (',' if i+8 < len(pairs) else '') for i in range(0, len(pairs), 8)]
    lines += [']', 'def objective : Nat := (rows.map (fun p => p.1 * p.2)).sum',
              'theorem length_checked : rows.length = 510 := by decide',
              'theorem objective_checked : objective = 257941 := by decide',
              'theorem rounding_checked : 1001 * (258 - 1) < objective := by decide',
              '#print axioms length_checked', '#print axioms objective_checked',
              '#print axioms rounding_checked', 'end RootRoundingLiteral', '']
    return '\n'.join(lines)


def main():
    data = node1209_pack_all.generate()
    content = render(data['rows'])
    if sys.argv[1:] == ['--write']:
        OUT.parent.mkdir(parents=True, exist_ok=True)
        OUT.write_text(content, encoding='utf-8')
    elif sys.argv[1:] == ['--check']:
        if OUT.read_text(encoding='utf-8') != content:
            raise ValueError('literal candidate differs from generated rows')
    else:
        raise SystemExit('use --write or --check')
    print('510 occurrence literals match generator; archive correspondence is not a Lean theorem')

if __name__ == '__main__':
    main()
