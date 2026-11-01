import RoughCount

open RoughCount

example : (((Finset.Ioc 3 15).filter fun n => 4 ∣ n).card : ℤ) = 3 := by
  rw [card_multiples_Ioc 3 15 4 (by decide)]
  norm_num

example (L U : ℕ) (h : L ≤ U) :
    (((Finset.Ioc L U).filter fun n => 0 ∣ n).card : ℤ) = 0 := by
  simpa using card_multiples_Ioc L U 0 h

example (L d : ℕ) :
    (((Finset.Ioc L L).filter fun n => d ∣ n).card : ℤ) = 0 := by
  simpa using card_multiples_Ioc L L d (le_refl L)

-- Reversed endpoints demonstrate why the order assumption cannot be dropped.
example : (((Finset.Ioc 10 1).filter fun n => 1 ∣ n).card : ℤ) ≠
    (1 / 1 : ℤ) - (10 / 1 : ℤ) := by decide

#print axioms RoughCount.card_multiples_Ioc
