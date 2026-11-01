import RoughIntersection

open scoped BigOperators

-- Empty intersection is the full interval; its product is one.
example : (((∅ : Finset ℕ).inf (RoughIEPartial.intervalMultiples 2 10)).card : ℤ) = 8 := by
  rw [RoughIEPartial.intersection_card_eq_div 2 10 ∅ (by omega) (by simp)]
  norm_num

-- Two distinct primes: the intersection contains 6 and 12.
example : (((({2, 3} : Finset ℕ).inf (RoughIEPartial.intervalMultiples 0 12)).card : ℤ)) = 2 := by
  rw [RoughIEPartial.intersection_card_eq_div 0 12 {2, 3} (by omega) (by
    intro p hp
    simp only [Finset.mem_insert, Finset.mem_singleton] at hp
    rcases hp with rfl | rfl <;> norm_num)]
  norm_num

-- Reversed and empty intervals are not silently treated as ordered.
example : (((({2} : Finset ℕ).inf (RoughIEPartial.intervalMultiples 5 5)).card : ℤ)) = 0 := by
  rw [RoughIEPartial.intersection_card_eq_div 5 5 {2} (by omega) (by
    intro p hp
    simp only [Finset.mem_singleton] at hp
    subst p
    norm_num)]
  norm_num

#print axioms RoughIEPartial.intersection_card_eq_div
