#!/usr/bin/env python3
"""Transcribe canonical exporter JSON into Lean literals; NOT a proof of fidelity."""
import argparse
import json
from fractions import Fraction
from pathlib import Path

def render(data):
    levels = data['levels']
    parts = ['-- Generated from ledger.json; Python transcription is outside Lean trust.\nimport LedgerChecker\n\nnamespace ArchiveLedger\n']
    for i, level in enumerate(levels):
        chunks = [level['cells'][j:j+128] for j in range(0, len(level['cells']), 128)]
        for j, chunk in enumerate(chunks):
            cells = ',\n'.join(f'  ⟨{a}, {b}, {h}⟩' for a,b,h in chunk)
            parts.append(f'def cells{i}_chunk{j} : List Cell := [\n{cells}\n]\n')
        expr = ' ++ '.join(f'cells{i}_chunk{j}' for j in range(len(chunks))) or '[]'
        parts.append(f'def cells{i} : List Cell := {expr}\n')
    parts.append('def ledger : List Level := [\n' + ',\n'.join(f'  ⟨{x["prime"]}, cells{i}⟩' for i,x in enumerate(levels)) + '\n]\n')
    parts.append('''-- Candidate only: the rational computations are separated by level.
-- Every proposed equality is checked by kernel reduction, not trusted Python.
set_option maxRecDepth 100000
set_option maxHeartbeats 0
''')
    for i, level in enumerate(levels):
        mass = sum((h * (Fraction(1, a) - Fraction(1, b))
                    for a, b, h in level['cells']), Fraction(0))
        parts.append(f'theorem mass{i} : levelMass ⟨{level["prime"]}, cells{i}⟩ = '
                     f'(({mass.numerator} : ℚ) / {mass.denominator}) := by decide +kernel\n')
    mass_names = ', '.join(f'mass{i}' for i in range(len(levels)))
    parts.append('''
theorem archive_valid : Valid ledger := by
  unfold Valid Arithmetic
  refine ⟨?_, ?_, ?_, ?_, ?_⟩
  · decide +kernel
  · decide +kernel
  · decide +kernel
  · simp only [coefficient, totals, ledger, List.foldl_cons, List.foldl_nil, step, ''' + mass_names + '''] <;> decide +kernel
  · decide +kernel

theorem archive_check : check ledger = true := by
  exact decide_eq_true archive_valid

theorem archive_arithmetic : Arithmetic ledger := check_sound archive_check

#print axioms archive_check
#print axioms archive_valid
#print axioms archive_arithmetic
end ArchiveLedger
''')
    return ''.join(parts)

def main():
    ap=argparse.ArgumentParser(); ap.add_argument('json'); ap.add_argument('output'); args=ap.parse_args()
    Path(args.output).write_text(render(json.loads(Path(args.json).read_text())), encoding='utf-8')
if __name__ == '__main__': main()
