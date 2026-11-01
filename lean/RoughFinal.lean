import RoughIntersection

/-!
Candidate final inclusion–exclusion identity. This file has not been compiled;
it requires kernel checking on hosted Lean CI.
-/
namespace RoughIEPartial

open scoped BigOperators

/-- Coprimality with the product is avoidance of every prime in the finset. -/
theorem coprime_prime_product_iff (S : Finset ℕ) (n : ℕ)
    (hprime : ∀ p ∈ S, Nat.Prime p) :
    Nat.Coprime n (∏ p ∈ S, p) ↔ ∀ p ∈ S, ¬ p ∣ n := by
  rw [Nat.coprime_prod_right_iff]
  constructor
  · intro h p hp
    exact (hprime p hp).coprime_iff_not_dvd.mp (h p hp).symm
  · intro h p hp
    exact ((hprime p hp).coprime_iff_not_dvd.mpr (h p hp)).symm

/-- Membership in the complement intersection means avoiding all the primes. -/
theorem mem_interval_complement_intersection (L U : ℕ) (S : Finset ℕ)
    (x : {n : ℕ // n ∈ Finset.Ioc L U}) :
    x ∈ S.inf (fun p => (intervalMultiples L U p)ᶜ) ↔
      ∀ p ∈ S, ¬ p ∣ x.val := by
  classical
  induction S using Finset.induction_on with
  | empty => simp
  | @insert p S hp ih =>
      simp [Finset.inf_insert, intervalMultiples, ih]

/-- The subtype complement intersection counts the ordinary coprime filter. -/
theorem complement_card_eq_coprime_filter (L U : ℕ) (S : Finset ℕ)
    (hprime : ∀ p ∈ S, Nat.Prime p) :
    (S.inf fun p => (intervalMultiples L U p)ᶜ).card =
      ((Finset.Ioc L U).filter fun n => Nat.Coprime n (∏ p ∈ S, p)).card := by
  classical
  refine Finset.card_bij (fun x _ => x.val) ?_ ?_ ?_
  · intro x hx
    apply Finset.mem_filter.mpr
    exact ⟨x.property, (coprime_prime_product_iff S x.val hprime).mpr
      ((mem_interval_complement_intersection L U S x).mp hx)⟩
  · intro x hx y hy hxy
    exact Subtype.ext hxy
  · intro n hn
    have hn' := Finset.mem_filter.mp hn
    refine ⟨⟨n, hn'.1⟩, ?_, rfl⟩
    apply (mem_interval_complement_intersection L U S ⟨n, hn'.1⟩).mpr
    exact (coprime_prime_product_iff S n hprime).mp hn'.2

/-- Inclusion–exclusion for integers coprime to a finite product of distinct primes. -/
theorem card_coprime_Ioc_eq_inclusion_exclusion (L U : ℕ) (S : Finset ℕ)
    (hLU : L ≤ U) (hprime : ∀ p ∈ S, Nat.Prime p) :
    (((Finset.Ioc L U).filter fun n => Nat.Coprime n (∏ p ∈ S, p)).card : ℤ) =
      ∑ T ∈ S.powerset, (-1 : ℤ) ^ T.card *
        (((U / (∏ p ∈ T, p) : ℕ) : ℤ) -
          ((L / (∏ p ∈ T, p) : ℕ) : ℤ)) := by
  classical
  rw [← complement_card_eq_coprime_filter L U S hprime,
    interval_inclusion_exclusion]
  apply Finset.sum_congr rfl
  intro T hT
  have hTprime : ∀ p ∈ T, Nat.Prime p := by
    intro p hp
    exact hprime p ((Finset.mem_powerset.mp hT) hp)
  rw [intersection_card_eq_div L U T hLU hTprime]

#print axioms coprime_prime_product_iff
#print axioms complement_card_eq_coprime_filter
#print axioms card_coprime_Ioc_eq_inclusion_exclusion

end RoughIEPartial
