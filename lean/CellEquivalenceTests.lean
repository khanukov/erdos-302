import CellEquivalence

open ArchiveSummation

-- Upper endpoint q = N/a is included, with quotient equal to a.
example : 5 ≤ 20 / 4 ∧ 20 / 4 < 11 := by
  apply (quotient_cell_iff 20 5 11 4 (by decide) (by decide) (by decide)).2
  norm_num

-- Lower endpoint q = N/b is excluded.
example : ¬ (5 ≤ 20 / 1 ∧ 20 / 1 < 11) := by
  intro h
  have h' := (quotient_cell_iff 20 5 11 1 (by decide) (by decide) (by decide)).1 h
  norm_num at h'

-- Just beyond the upper endpoint is excluded.
example : ¬ (5 ≤ 20 / 5 ∧ 20 / 5 < 11) := by
  intro h
  have h' := (quotient_cell_iff 20 5 11 5 (by decide) (by decide) (by decide)).1 h
  norm_num at h'

-- Reversed and coincident quotient endpoints have empty cells.
example (N q : ℕ) (hq : 0 < q) : ¬ (7 ≤ N / q ∧ N / q < 3) := by
  intro h
  have h' := (quotient_cell_iff N 7 3 q (by decide) (by decide) hq).1 h
  have h'' := (quotient_cell_iff N 7 3 q (by decide) (by decide) hq).2 h'
  omega

example (N q : ℕ) (hq : 0 < q) : ¬ (5 ≤ N / q ∧ N / q < 5) := by
  intro h
  have h' := (quotient_cell_iff N 5 5 q (by decide) (by decide) hq).1 h
  omega

-- Zero numerator still works for positive parameters.
example : (1 ≤ 0 / 2 ∧ 0 / 2 < 3) ↔ (0 / 3 < 2 ∧ 2 ≤ 0 / 1) :=
  quotient_cell_iff 0 1 3 2 (by decide) (by decide) (by decide)

-- Zero a or b can break the equivalence; q = 0 happens to give two false sides.
example : ¬ ((0 ≤ 1 / 1 ∧ 1 / 1 < 2) ↔ (1 / 2 < 1 ∧ 1 ≤ 1 / 0)) := by decide
example : ¬ ((1 ≤ 1 / 1 ∧ 1 / 1 < 0) ↔ (1 / 0 < 1 ∧ 1 ≤ 1 / 1)) := by decide
example : ((1 ≤ 1 / 0 ∧ 1 / 0 < 2) ↔ (1 / 2 < 0 ∧ 0 ≤ 1 / 1)) := by decide

#print axioms ArchiveSummation.quotient_cell_iff
