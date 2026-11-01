import RoughDiscrepancy

open scoped BigOperators

-- Empty set and zero-length interval.
example : |(((Finset.Ioc 3 3).filter fun n => Nat.Coprime n
    (∏ p ∈ (∅ : Finset ℕ), p)).card : ℝ) -
    ((3 : ℝ) - 3) * (∏ p ∈ (∅ : Finset ℕ), (1 - (1 : ℝ) / p))| ≤
    (2 : ℝ) ^ (∅ : Finset ℕ).card := by
  exact RoughDiscrepancy.card_coprime_Ioc_discrepancy 3 3 ∅ (by decide) (by simp)

-- Two distinct primes and a nonempty interval.
example : |(((Finset.Ioc 2 12).filter fun n => Nat.Coprime n
    (∏ p ∈ ({2, 3} : Finset ℕ), p)).card : ℝ) -
    ((12 : ℝ) - 2) * (∏ p ∈ ({2, 3} : Finset ℕ), (1 - (1 : ℝ) / p))| ≤
    (2 : ℝ) ^ ({2, 3} : Finset ℕ).card := by
  apply RoughDiscrepancy.card_coprime_Ioc_discrepancy 2 12 {2, 3} (by decide)
  intro p hp
  simp only [Finset.mem_insert, Finset.mem_singleton] at hp
  rcases hp with rfl | rfl <;> decide

#print axioms RoughDiscrepancy.card_coprime_Ioc_discrepancy
