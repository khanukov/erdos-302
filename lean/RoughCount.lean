import Mathlib.Data.Nat.Factorization.Basic
import Mathlib.Data.Finset.CastCard
import Mathlib.Tactic

namespace RoughCount

/-- Count multiples in `(L,U]` with integer subtraction. No positivity hypothesis
    on `d` is needed: Lean's natural division by zero is zero, and the interval
    contains no multiples of zero. -/
theorem card_multiples_Ioc (L U d : ℕ) (hLU : L ≤ U) :
    (((Finset.Ioc L U).filter fun n => d ∣ n).card : ℤ) =
      (U / d : ℤ) - (L / d : ℤ) := by
  have hsub : (Finset.Ioc 0 L).filter (fun n => d ∣ n) ⊆
      (Finset.Ioc 0 U).filter (fun n => d ∣ n) := by
    intro n hn
    simp only [Finset.mem_filter, Finset.mem_Ioc] at hn ⊢
    omega
  have hdiff : (Finset.Ioc L U).filter (fun n => d ∣ n) =
      (Finset.Ioc 0 U).filter (fun n => d ∣ n) \
        (Finset.Ioc 0 L).filter (fun n => d ∣ n) := by
    ext n
    simp only [Finset.mem_filter, Finset.mem_Ioc, Finset.mem_sdiff]
    omega
  rw [hdiff, Finset.cast_card_sdiff hsub,
    Nat.Ioc_filter_dvd_card_eq_div, Nat.Ioc_filter_dvd_card_eq_div]

#print axioms RoughCount.card_multiples_Ioc
end RoughCount
