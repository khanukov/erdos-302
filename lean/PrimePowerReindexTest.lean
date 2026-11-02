import PrimePowerReindex

-- Candidate compile-time tests, including k = 0 and a nontrivial power.
example : ∃! x : ℕ × ℕ, 0 < x.1 ∧ ¬ 2 ∣ x.1 ∧ Nat.Coprime x.1 15 ∧
    x.1 * 2 ^ x.2 ≤ 100 ∧ 56 = x.1 * 2 ^ x.2 := by
  apply PrimePowerReindex.bounded_decomposition (by decide) (by decide) (by decide)
  decide

example : ∃! x : ℕ × ℕ, 0 < x.1 ∧ ¬ 2 ∣ x.1 ∧ Nat.Coprime x.1 3 ∧
    x.1 * 2 ^ x.2 ≤ 5 ∧ 5 = x.1 * 2 ^ x.2 := by
  apply PrimePowerReindex.bounded_decomposition (by decide) (by decide) (by decide)
  decide

example : ¬ (0 < (0 : ℕ)) := by decide
example : ¬ (56 ≤ 55) := by decide

#print axioms PrimePowerReindex.bounded_decomposition
