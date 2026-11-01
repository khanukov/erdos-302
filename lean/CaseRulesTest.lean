import CaseRules

open Finset BankCase

-- Regression: residual is genuinely negative, not Nat subtraction.
example : Residual ({1, 2, 3} : Finset ℕ) {1} 1 = -1 := by
  have h : (({1, 2, 3} : Finset ℕ) \ {1}) = {2, 3} := by decide
  unfold Residual
  rw [h]
  norm_num

-- A negative budget rejects even when the integer budget is below zero.
example (C : Finset ℕ) (h : State {1, 2} {1, 2} ∅ C)
    (small : (C.card : ℤ) ≤ (1 : ℤ) - 1) : False := by
  apply budget_reject h small
  norm_num

-- A row with two free vertices and residual 3 is impossible.
example (C : Finset ℕ) (h : State {1, 2} ∅ ∅ C)
    (row : Row {1, 2} 3 C) : False := by
  apply row_reject h row
  norm_num [Remaining, Free]

-- Tight row forces both vertices, including after updating the branch state.
example (C : Finset ℕ) (h : State {1, 2} ∅ ∅ C)
    (row : Row {1, 2} 2 C) : State {1, 2} {1, 2} ∅ C := by
  have hf := force_sound h row (by norm_num [Remaining, Free])
  simpa [Free] using hf

-- The two split branches receive distinct states.
example (C : Finset ℕ) (h : State {1, 2} ∅ ∅ C)
    (hz : State {1, 2} ∅ {1} C → False)
    (ho : State {1, 2} {1} ∅ C → False) : False := by
  exact split_sound 1 h hz ho

#print axioms BankCase.row_reject
#print axioms BankCase.remaining_le_selected
