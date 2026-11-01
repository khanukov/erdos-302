import RoughIEPartial
import RoughCount
import Mathlib.Data.Nat.GCD.BigOperators
import Mathlib.Data.Nat.Prime.Basic

/-!
Candidate bridge from inclusion-exclusion intersections to interval counts.
This file has not been kernel checked; the associated tests require hosted Lean CI.
-/
namespace RoughIEPartial

open scoped BigOperators

/-- A product of distinct primes divides `n` exactly when each factor does. -/
theorem prime_product_dvd_iff (T : Finset ℕ) (n : ℕ)
    (hprime : ∀ p ∈ T, Nat.Prime p) :
    (∏ p ∈ T, p) ∣ n ↔ ∀ p ∈ T, p ∣ n := by
  classical
  revert hprime
  induction T using Finset.induction_on with
  | empty => simp
  | @insert p T hp ih =>
      intro hprime
      have hT : ∀ q ∈ T, Nat.Prime q := by
        intro q hq
        exact hprime q (Finset.mem_insert_of_mem hq)
      have hpprime : Nat.Prime p := hprime p (Finset.mem_insert_self p T)
      have hcop : Nat.Coprime p (∏ q ∈ T, q) := by
        apply Nat.coprime_prod_right_iff.mpr
        intro q hq
        apply (Nat.coprime_primes hpprime (hT q hq)).mpr
        intro heq
        subst q
        exact hp hq
      rw [Finset.prod_insert hp]
      constructor
      · intro h q hq
        rcases Finset.mem_insert.mp hq with heq | hq
        · subst q
          exact dvd_trans (dvd_mul_right p _) h
        · exact (ih hT).mp (dvd_trans (dvd_mul_left _ p) h) q hq
      · intro h
        apply hcop.mul_dvd_of_dvd_of_dvd
        · exact h p (Finset.mem_insert_self p T)
        · apply (ih hT).mpr
          intro q hq
          exact h q (Finset.mem_insert_of_mem hq)

/-- Membership of the subtype intersection, including the empty intersection. -/
theorem mem_interval_intersection (L U : ℕ) (T : Finset ℕ)
    (x : {n : ℕ // n ∈ Finset.Ioc L U}) :
    x ∈ T.inf (intervalMultiples L U) ↔ ∀ p ∈ T, p ∣ x.val := by
  classical
  induction T using Finset.induction_on with
  | empty => simp
  | @insert p T hp ih =>
      simp [Finset.inf_insert, intervalMultiples, ih]

/-- The intersection cardinal equals the ordinary filtered interval cardinal. -/
theorem intersection_card_eq_filter (L U : ℕ) (T : Finset ℕ)
    (hprime : ∀ p ∈ T, Nat.Prime p) :
    (T.inf (intervalMultiples L U)).card =
      ((Finset.Ioc L U).filter fun n => (∏ p ∈ T, p) ∣ n).card := by
  classical
  refine Finset.card_bij (fun x _ => x.val) ?_ ?_ ?_
  · intro x hx
    apply Finset.mem_filter.mpr
    exact ⟨x.property, (prime_product_dvd_iff T x.val hprime).mpr
      ((mem_interval_intersection L U T x).mp hx)⟩
  · intro x hx y hy hxy
    exact Subtype.ext hxy
  · intro n hn
    have hn' := Finset.mem_filter.mp hn
    refine ⟨⟨n, hn'.1⟩, ?_, rfl⟩
    apply (mem_interval_intersection L U T ⟨n, hn'.1⟩).mpr
    exact (prime_product_dvd_iff T n hprime).mp hn'.2

/-- Interval intersection counts are differences of natural quotients, in ℤ. -/
theorem intersection_card_eq_div (L U : ℕ) (T : Finset ℕ)
    (hLU : L ≤ U) (hprime : ∀ p ∈ T, Nat.Prime p) :
    ((T.inf (intervalMultiples L U)).card : ℤ) =
      ((U / (∏ p ∈ T, p) : ℕ) : ℤ) -
        ((L / (∏ p ∈ T, p) : ℕ) : ℤ) := by
  rw [intersection_card_eq_filter L U T hprime]
  exact RoughCount.card_multiples_Ioc L U (∏ p ∈ T, p) hLU

#print axioms prime_product_dvd_iff
#print axioms intersection_card_eq_div

end RoughIEPartial
