#!/usr/bin/env python3
"""Reproduce a bounded literal-table pilot from digest-checked archive bytes.

The prefix is computed from reported cells, not seed/max witnesses. The Lean
checker independently refers to ArchiveLedger.ledger, not generated cell data.
"""
import argparse
from pathlib import Path
import reconstruct_report_profiles as archive

ROOT = Path(__file__).resolve().parents[1]
OUTPUT = ROOT / 'lean/ArchiveRecurrencePilot.lean'
LIMIT = 80

def render(path):
    report, _ = archive.read_archive(path)
    levels = report['levels']
    if len(levels) != 20:
        raise ValueError('wrong level count')
    for lev in levels[:2]:
        archive.validate_numbers(lev)
        if type(lev['prime']) is not int or type(lev['cells']) is not list:
            raise ValueError('invalid prime or cells')
        for c in lev['cells']:
            if type(c) is not list or len(c) != 3 or not all(archive.uint(v) for v in c):
                raise ValueError('invalid cell')
            a,b,h = c
            if not (1 <= a < b <= archive.X + 1 and h > 0):
                raise ValueError('invalid cell bounds')
    if [x['prime'] for x in levels[:2]] != [3,2]:
        raise ValueError('wrong primes')
    parent = [0] * (LIMIT+1)
    for lev in levels[:2]:
        current = [0] * (LIMIT+1)
        for n in range(1, LIMIT+1):
            correction = sum(h for a,b,h in lev['cells'] if a <= n < b)
            current[n] = parent[n] + current[n // lev['prime']] + correction
        if lev is levels[0]:
            first = current
        parent = current
    if any(first):
        raise ValueError('first profile not zero')
    values = ', '.join(map(str, parent))
    return '''import ArchiveLedger

/-! Bounded data-only candidate. The profile literals were reconstructed from
archive correction cells, not independently proved graph demands. The checker
uses the actual ArchiveLedger.ledger cells; no recurrence hypothesis occurs.
External archive correspondence is checked by Python, not by Lean. -/
namespace ArchiveRecurrencePilot
open ArchiveLedger

set_option maxRecDepth 100000
set_option maxHeartbeats 8000000

def parent : List Nat := List.replicate 81 0

def current : List Nat := [VALUES]

def level : ArchiveLedger.Level := ArchiveLedger.ledger.getD 1 ⟨0, []⟩
def correction (n : Nat) : Nat :=
  (level.cells.map fun c => if c.a ≤ n ∧ n < c.b then c.height else 0).sum

def equation (n : Nat) : Prop :=
  current.getD n 0 = parent.getD n 0 + current.getD (n / level.prime) 0 + correction n

/-- Includes all indices used by quotient lookups, excluding default padding. -/
theorem input_shape : parent.length = 81 ∧ current.length = 81 ∧
    level.prime = 2 ∧ current.getD 0 0 = 0 ∧ parent.getD 0 0 = 0 := by
  decide +kernel

/-- All 80 positive inputs in the shard, including gaps and cell boundaries. -/
theorem recurrence : ∀ n ∈ Finset.Icc 1 80, equation n := by
  decide +kernel

#print axioms input_shape
#print axioms recurrence
end ArchiveRecurrencePilot
'''.replace('VALUES', values)

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--check', action='store_true')
    ap.add_argument('--archive', type=Path, default=ROOT/'input/erdos302_boundary_certificates_publication.zip')
    args = ap.parse_args()
    text = render(args.archive)
    if args.check:
        if not OUTPUT.exists() or OUTPUT.read_text() != text:
            raise SystemExit('generated Lean artifact differs')
        print('complete Lean artifact matches digest-checked archive')
    else:
        OUTPUT.write_text(text)
        print('wrote', OUTPUT)

if __name__ == '__main__':
    main()
