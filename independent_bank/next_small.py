#!/usr/bin/env python3
"""Translate a consecutive small-rule extension of the checked 0–5 prefix.

This is data-only transcription, not a proof of archive correspondence.
Unsupported nodes, including cases, are rejected rather than approximated.
"""
from pathlib import Path
import sys
import archive_prefix
import trim5

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / 'lean/ArchiveNextSmall.lean'

def render(bank, start, stop):
    if type(start) is not int or start != 6 or type(stop) is not int:
        raise ValueError('expected start 6 and integer stop')
    if type(bank) is not dict or type(bank.get('nodes')) is not list or not start < stop <= len(bank['nodes']):
        raise ValueError('invalid prefix range')
    if trim5.render(bank) != trim5.TARGET.read_text():
        raise ValueError('node 5 transcription mismatch')
    cases = []
    proofs = []
    for i in range(start, stop):
        node = bank['nodes'][i]
        # Reuse strict small-node schema and normalization checks.
        archive_prefix.render_prefix({'nodes': [node]}, 1)
        values = ', '.join(map(str, node['v']))
        cases.append(f"  | {i} => ⟨{{{values}}}, {node['r']}, .small⟩")
        proofs.append(f'theorem bound{i} : Extended.Bound (nodes {i}).support (nodes {i}).demand :=\n  ArchiveDag.small_sound (by unfold ArchiveDag.SmallCheck UpperBridge.OrderedEdge nodes; decide)')
    branches = '\n'.join(f'    · simpa [support, demand] using bound{i}' for i in range(start, stop))
    axioms = '\n'.join(f'#print axioms bound{i}' for i in range(start, stop))
    return f'''import ArchiveTrim5

/- Generated from pinned archive data; Python transcription is external to Lean. -/
namespace ArchiveNextSmall

def nodes : ℕ → ArchiveDag.Node
{chr(10).join(cases)}
  | _ => ⟨∅, 0, .small⟩

{chr(10).join(proofs)}

def support (i : ℕ) : Finset ℕ :=
  if i < 6 then ArchiveTrim5.support i else (nodes i).support

def demand (i : ℕ) : ℕ :=
  if i < 6 then ArchiveTrim5.nodeDemand i else (nodes i).demand

theorem sound : ∀ i < {stop}, Extended.Bound (support i) (demand i) := by
  intro i hi
  by_cases h : i < 6
  · simpa [support, demand, h] using ArchiveTrim5.sound i h
  · have hlo : 6 ≤ i := by omega
    interval_cases i
{branches}

{axioms}
#print axioms sound
end ArchiveNextSmall
'''

def main():
    result = render(archive_prefix.load_bank(), 6, 7)
    if sys.argv[1:] == ['--write']:
        TARGET.write_text(result)
    elif not sys.argv[1:]:
        if TARGET.read_text() != result:
            raise ValueError('generated source differs')
        print('node 6 transcription matches pinned bank')
    else:
        raise ValueError('usage: next_small.py [--write]')

if __name__ == '__main__': main()
