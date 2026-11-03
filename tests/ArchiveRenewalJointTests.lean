import ArchiveRenewalJointCandidate

open ArchiveRenewalJointCandidate

-- Real level-one literal data: first cell begins at six, and ends at 24.
example : cellCorrection ⟨2, ArchiveLedger.cells1⟩ 5 = 0 := by decide +kernel
example : cellCorrection ⟨2, ArchiveLedger.cells1⟩ 6 = 1 := by decide +kernel
example : cellCorrection ⟨2, ArchiveLedger.cells1⟩ 24 = 0 := by decide +kernel

-- Multiplicity is intentional, including coincident occurrences.
example : cellCorrection ⟨2, [⟨1, 4, 2⟩, ⟨1, 4, 2⟩]⟩ 3 = 4 := by decide
example : cellCorrection ⟨2, [⟨1, 4, 2⟩]⟩ 4 = 0 := by decide

-- The max identity does not require the finite correction check.
example (parent old seed : ℕ → ℕ) :
    profile 2 10 parent old seed 1 =
      max (max (max (parent 1 + profile 2 10 parent old seed (1 / 2))
        (profile 2 10 parent old seed (1 - 1))) (old 1)) (seed 1) := by
  exact profile_max_update 2 10 parent old seed (by decide) (by decide) (by decide)


/- The pinned bank/extension replay gives these operands at level index 1
   through 24 (including the right endpoint). They are independent inputs, not defined from cellCorrection.
   Their source correspondence and demand validity remain external. -/
namespace RealBounded
open RenewalNext
set_option maxRecDepth 100000
set_option maxHeartbeats 8000000

def parent (_ : ℕ) : ℕ := 0
def old (n : ℕ) : ℕ := ([0,0,0,0,0,0,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2] : List ℕ).getD n 0
def seed (n : ℕ) : ℕ := ([0,0,0,0,0,0,1,0,0,0,0,0,2,0,0,0,0,0,1,0,0,0,0,0,1] : List ℕ).getD n 0
def table (n : ℕ) : ℕ := ([0,0,0,0,0,0,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2] : List ℕ).getD n 0
def level : ArchiveLedger.Level := ArchiveLedger.ledger.getD 1 ⟨0, []⟩

theorem rows : ∀ n ∈ Finset.Icc 1 24,
    table n = max (max (max (parent n + table (n / 2)) (table (n-1))) (old n)) (seed n) ∧
    cellCorrection level n = table n - (parent n + table (n / 2)) := by
  decide +kernel

theorem prime : level.prime = 2 := by decide +kernel

theorem update_eq : ∀ n, n ≤ 24 → update 2 parent old seed n = table n := by
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

theorem finite_check : FiniteCorrectionCheck level 24 parent old seed := by
  intro n hn hle
  have hrow := (rows n (Finset.mem_Icc.mpr ⟨hn, hle⟩)).2
  rw [prime, update_eq n hle, update_eq (n / 2) (by omega)]
  exact hrow

theorem complete_cell : ∀ n ∈ Finset.Ico 6 24,
    cellCorrection level n = 1 := by
  decide +kernel

theorem right_endpoint : cellCorrection level 24 = 0 := by
  decide +kernel

#print axioms complete_cell
#print axioms right_endpoint
#print axioms rows
#print axioms update_eq
#print axioms finite_check
end RealBounded
