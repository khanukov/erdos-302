"""Generate a bounded Lean checker from independently replayed operand tables.

This is a computational candidate, not an archive-to-Lean provenance proof.
The kernel must still check every generated row; no equality is assumed.
"""
from array import array
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[2]
LIMIT = 128

def emit(parent, old, seed, table, limit):
    arrays = (parent, old, seed, table)
    if limit < 1 or any(len(x) != limit + 1 for x in arrays):
        raise ValueError('operand dimensions')
    if any(type(v) is not int or v < 0 for a in arrays for v in a):
        raise ValueError('operand value')
    defs = '\n'.join(
        f'def {name} (n : ℕ) : ℕ := ([{",".join(map(str, values))}] : List ℕ).getD n 0'
        for name, values in zip(('parent', 'old', 'seed', 'table'), arrays))
    return f'''import ArchiveRenewalJointCandidate
open ArchiveRenewalJointCandidate
namespace GeneratedBounded
open RenewalNext
set_option maxRecDepth 100000
set_option maxHeartbeats 0
{defs}
def level : ArchiveLedger.Level := ArchiveLedger.ledger.getD 1 ⟨0, []⟩
theorem rows : ∀ n ∈ Finset.Icc 1 {limit},
    table n = max (max (max (parent n + table (n / 2)) (table (n-1))) (old n)) (seed n) ∧
    cellCorrection level n = table n - (parent n + table (n / 2)) := by
  decide +kernel
theorem prime : level.prime = 2 := by decide +kernel
theorem update_eq : ∀ n, n ≤ {limit} → update 2 parent old seed n = table n := by
  intro n
  induction n using Nat.strong_induction_on with
  | h n ih =>
    intro hn
    by_cases hz : n = 0
    · subst n
      simp [update_zero, table]
    · have hp : 0 < n := Nat.pos_of_ne_zero hz
      have hd : n / 2 < n := Nat.div_lt_self hp (by decide)
      have hm : n - 1 < n := by omega
      have hrow := (rows n (Finset.mem_Icc.mpr ⟨hp, hn⟩)).1
      rw [update_pos 2 parent old seed hp (by decide),
        ih (n / 2) hd (by omega), ih (n - 1) hm (by omega)]
      exact hrow.symm
theorem finite_check : FiniteCorrectionCheck level {limit} parent old seed := by
  intro n hn hle
  have hrow := (rows n (Finset.mem_Icc.mpr ⟨hn, hle⟩)).2
  rw [prime, update_eq n hle, update_eq (n / 2) (by omega)]
  exact hrow
#print axioms rows
#print axioms update_eq
#print axioms finite_check
end GeneratedBounded
'''

def main(destination):
    sys.path.insert(0, str(ROOT / 'independent_bank'))
    from seed_reconstruction import load_inputs, verify, extensions, ranks, seeds, renew_level, table_hash, PRIMES
    bank, intervals, rows, report = load_inputs(ROOT / 'input/erdos302_boundary_certificates_publication.zip')
    witnesses = verify(bank, intervals)
    ext = extensions(rows, witnesses)
    if len(witnesses) != 4106 or len(ext) != 515:
        raise ValueError('witness counts')
    rank = ranks(500000)
    old = parent = array('I', [0]) * 500001
    for j in range(2):
        seed = seeds(witnesses + ext, rank, j, 500000)
        old, new, cells = renew_level(old, parent, seed, PRIMES[j], list(reversed(intervals['intervals']))[j])
        expected = report['levels'][j]
        if (expected['prime'] != PRIMES[j] or expected['cells'] != cells or
                expected['table_sha256'] != table_hash(new)):
            raise ValueError(f'full replay mismatch at level {j}')
        if j == 1:
            if PRIMES[j] != 2 or len(cells) != 52:
                raise ValueError('unexpected prime-2 correction inventory')
            Path(destination).write_text(emit(list(parent[:LIMIT+1]), list(old[:LIMIT+1]),
                                              list(seed[:LIMIT+1]), list(new[:LIMIT+1]), LIMIT))
        parent = new
    print(f'PASS independent full level replay, 52 cells; generated Lean rows through {LIMIT}')

if __name__ == '__main__':
    if len(sys.argv) != 2:
        raise SystemExit('usage: generated_bounded.py OUTPUT.lean')
    main(sys.argv[1])
