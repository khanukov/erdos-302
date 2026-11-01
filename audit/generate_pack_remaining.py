#!/usr/bin/env python3
"""Generate bounded, kernel-checked node 1094 row and objective shards.

The parser only supplies candidate numerals; every assertion is checked by Lean.
Generated modules form a linear chain so preceding olean files are reused.
"""
import argparse
import ast
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--output', required=True, type=Path)
    parser.add_argument('--rows', type=int, default=436)
    parser.add_argument('--shard-size', type=int, default=8)
    args = parser.parse_args()
    if not 1 <= args.rows <= 436 or not 1 <= args.shard_size <= 32:
        parser.error('rows must be 1..436 and shard-size 1..32')
    source = (ROOT / 'lean/Pack1094.lean').read_text()
    data = ast.literal_eval(source.split(':= [', 1)[1].split('\n]', 1)[0].join(['[', ']']))
    if len(data) != 436:
        raise ValueError('expected exactly 436 input rows')
    args.output.mkdir(parents=True, exist_ok=True)
    total = 0
    previous = 'Pack1094'
    for start in range(0, args.rows, args.shard_size):
        end = min(start + args.shard_size, args.rows)
        name = f'PackRemaining{start:03d}'
        lines = [f'import {previous}', '', 'open Finset UpperBridge', 'open scoped BigOperators', 'namespace ArchivePack1094', 'set_option maxRecDepth 65536', 'set_option maxHeartbeats 0', '']
        if start == 0:
            lines += ['theorem remaining_sum_0 : (∑ i ∈ Finset.range 0, w i * r i) = 0 := by decide', '']
        for i in range(start, end):
            total += data[i][4] * data[i][5]
            lines += [f'theorem remaining_row_{i} : T {i} ⊆ support := by decide',
                      f'theorem remaining_sum_{i+1} : (∑ i ∈ Finset.range {i+1}, w i * r i) = {total} := by',
                      f'  rw [Finset.sum_range_succ, remaining_sum_{i}] <;> decide', '']
        lines += ['end ArchivePack1094', '']
        (args.output / f'{name}.lean').write_text('\n'.join(lines))
        previous = name
    if args.rows < 436:
        (args.output / 'PackRemainingPilot.lean').write_text(
            f'import {previous}\n#print axioms ArchivePack1094.remaining_row_{args.rows - 1}\n'
            f'#print axioms ArchivePack1094.remaining_sum_{args.rows}\n')
    if args.rows == 436:
        lines = [f'import {previous}', '', 'open Finset UpperBridge', 'open scoped BigOperators', 'namespace ArchivePack1094', 'set_option maxRecDepth 65536', 'set_option maxHeartbeats 0', '',
                 'theorem remaining_rows : ∀ i ∈ indices, T i ⊆ support := by',
                 '  intro i hi', '  simp only [indices, Finset.mem_range] at hi', '  interval_cases i']
        lines += [f'  · exact remaining_row_{i}' for i in range(436)]
        lines += ['', 'theorem remaining_objective : (∑ i ∈ indices, w i * r i) = 216342 := by',
                  '  exact remaining_sum_436', '',
                  'theorem remaining_round : 1000 * (217 - 1) < ∑ i ∈ indices, w i * r i := by',
                  '  rw [remaining_objective]', '  decide', '',
                  '#print axioms remaining_rows', '#print axioms remaining_objective', '#print axioms remaining_round', 'end ArchivePack1094', '']
        (args.output / 'PackRemainingAll.lean').write_text('\n'.join(lines))


if __name__ == '__main__':
    main()
