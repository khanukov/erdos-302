#!/usr/bin/env python3
"""Independent, fixed axiom-report inventory for the node 1190 workflow."""
import importlib.util
import re
import sys
from pathlib import Path

CHECKER = Path(__file__).resolve().parents[1] / 'audit/mathlib-bridge-ci/check_axioms.py'
spec = importlib.util.spec_from_file_location('check_axioms', CHECKER)
if spec is None or spec.loader is None:
    raise RuntimeError(f'cannot load axiom checker: {CHECKER}')
checker = importlib.util.module_from_spec(spec)
spec.loader.exec_module(checker)


def required(filename):
    match = re.fullmatch(r'Node1190(Refs|Capacity)(\d{3})\.lean', filename)
    if match:
        kind, number = match.groups()
        start = int(number) * 10
        limit = 530 if kind == 'Refs' else 899
        if start >= limit:
            raise ValueError(f'unknown shard: {filename}')
        names = ([f'{prefix}{i:03}' for i in range(start, min(start + 10, limit))
                  for prefix in ('ref', 'row', 'weight')] if kind == 'Refs' else
                 [f'capacity{i:03}' for i in range(start, min(start + 10, limit))])
    elif filename == 'Node1190Objective.lean':
        names = ['lengths', 'objective_exact', 'objective_bound']
    elif filename == 'Node1190Assembly.lean':
        names = ['leaf_with_index_bridges', 'all_ref_positions', 'ref_fin',
                 'all_row_positions', 'hrefs_proved', 'rows_proved',
                 'support_coverage', 'capacity_proved', 'all_weight_positions',
                 'weights_proved', 'leaf_proved', 'singleton_check', 'Shard336_337']
    else:
        raise ValueError(f'unknown file: {filename}')
    return ['Node1190Dual.' + name for name in names]


def check_log(filename, text):
    checker.check(text, required(filename))


def main():
    if len(sys.argv) != 3:
        raise SystemExit('usage: node1190_axiom_inventory.py FILENAME LOG')
    try:
        check_log(sys.argv[1], Path(sys.argv[2]).read_text())
    except ValueError as error:
        raise SystemExit(f'FAIL: {error}')
    print(f'PASS: {len(required(sys.argv[1]))} required axiom reports')


if __name__ == '__main__':
    main()
