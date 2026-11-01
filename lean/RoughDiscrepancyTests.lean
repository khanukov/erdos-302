import RoughDiscrepancy

open scoped BigOperators

-- The density identity is exact even for the empty set, a set containing zero,
-- and a set of non-primes. In particular, it assumes no nonzero denominators.
example : (∏ p ∈ (∅ : Finset ℕ), (1 - (1 : ℝ) / p)) =
    ∑ T ∈ (∅ : Finset ℕ).powerset, (-1 : ℝ) ^ T.card / (∏ p ∈ T, (p : ℝ)) :=
  RoughDiscrepancy.density_expansion ∅

example : (∏ p ∈ ({0, 4} : Finset ℕ), (1 - (1 : ℝ) / p)) =
    ∑ T ∈ ({0, 4} : Finset ℕ).powerset, (-1 : ℝ) ^ T.card / (∏ p ∈ T, (p : ℝ)) :=
  RoughDiscrepancy.density_expansion {0, 4}

example : (∏ p ∈ ({2, 3} : Finset ℕ), (1 - (1 : ℝ) / p)) =
    ∑ T ∈ ({2, 3} : Finset ℕ).powerset, (-1 : ℝ) ^ T.card / (∏ p ∈ T, (p : ℝ)) :=
  RoughDiscrepancy.density_expansion {2, 3}

#print axioms RoughDiscrepancy.density_expansion

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
