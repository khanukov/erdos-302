import RoughFinal

open scoped BigOperators
open RoughIEPartial

-- No primes: every interval element is coprime to the empty product.
example : (((Finset.Ioc 2 10).filter fun n => Nat.Coprime n (∏ p ∈ (∅ : Finset ℕ), p)).card : ℤ) = 8 := by
  decide

-- Two distinct primes: 1, 5, 7, 11 are coprime to 6.
example : (((Finset.Ioc 0 12).filter fun n => Nat.Coprime n (∏ p ∈ ({2, 3} : Finset ℕ), p)).card : ℤ) = 4 := by
  decide

-- A singleton prime, and an interval with equal endpoints.
example : (((Finset.Ioc 0 10).filter fun n => Nat.Coprime n (∏ p ∈ ({2} : Finset ℕ), p)).card : ℤ) = 5 := by
  decide
example : (((Finset.Ioc 5 5).filter fun n => Nat.Coprime n (∏ p ∈ ({2} : Finset ℕ), p)).card : ℤ) = 0 := by
  decide

-- Exercise the final theorem, including the subset and ordering hypotheses.
example : (((Finset.Ioc 0 12).filter fun n => Nat.Coprime n (∏ p ∈ ({2, 3} : Finset ℕ), p)).card : ℤ) =
    ∑ T ∈ ({2, 3} : Finset ℕ).powerset, (-1 : ℤ) ^ T.card *
      (((12 / (∏ p ∈ T, p) : ℕ) : ℤ) - ((0 / (∏ p ∈ T, p) : ℕ) : ℤ)) := by
  apply card_coprime_Ioc_eq_inclusion_exclusion 0 12 {2, 3} (by omega)
  intro p hp
  simp only [Finset.mem_insert, Finset.mem_singleton] at hp
  rcases hp with rfl | rfl <;> norm_num

#print axioms card_coprime_Ioc_eq_inclusion_exclusion
