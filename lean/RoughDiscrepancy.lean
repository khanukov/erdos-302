import RoughFinal
import RoughRounding

/-! Candidate discrepancy bound; requires hosted Lean CI checking. -/
namespace RoughDiscrepancy

open scoped BigOperators

/-- Exact finite density expansion, independent of primality. -/
theorem density_expansion (S : Finset ℕ) :
    (∏ p ∈ S, (1 - (1 : ℝ) / p)) =
      ∑ T ∈ S.powerset, (-1 : ℝ) ^ T.card / (∏ p ∈ T, (p : ℝ)) := by
  classical
  calc
    (∏ p ∈ S, (1 - (1 : ℝ) / p)) =
        ∑ T ∈ S.powerset, ∏ p ∈ T, (-((1 : ℝ) / p)) := by
          simpa only [sub_eq_add_neg] using
            (Finset.prod_one_add (f := fun p : ℕ => -((1 : ℝ) / p)) S)
    _ = ∑ T ∈ S.powerset, (-1 : ℝ) ^ T.card / (∏ p ∈ T, (p : ℝ)) := by
      apply Finset.sum_congr rfl
      intro T hT
      rw [Finset.prod_neg, Finset.prod_div_distrib]
      simp only [Finset.prod_const_one, one_div, div_eq_mul_inv, one_mul]

/-- Triangle inequality for a signed sum of errors bounded by one. -/
theorem signed_error_sum_bound (S : Finset ℕ) (e : Finset ℕ → ℝ)
    (he : ∀ T ∈ S.powerset, |e T| ≤ 1) :
    |∑ T ∈ S.powerset, (-1 : ℝ) ^ T.card * e T| ≤ (2 : ℝ) ^ S.card := by
  classical
  calc
    |∑ T ∈ S.powerset, (-1 : ℝ) ^ T.card * e T| ≤
        ∑ T ∈ S.powerset, |(-1 : ℝ) ^ T.card * e T| :=
      Finset.abs_sum_le_sum_abs _ _
    _ ≤ ∑ _T ∈ S.powerset, (1 : ℝ) := by
      apply Finset.sum_le_sum
      intro T hT
      simpa [abs_mul, abs_pow] using he T hT
    _ = (2 : ℝ) ^ S.card := by simp

/-- The rough count in (L,U] differs from its exact real density prediction by
at most one per subset of the finite prime set. -/
theorem card_coprime_Ioc_discrepancy (L U : ℕ) (S : Finset ℕ)
    (hLU : L ≤ U) (hprime : ∀ p ∈ S, Nat.Prime p) :
    |(((Finset.Ioc L U).filter fun n => Nat.Coprime n (∏ p ∈ S, p)).card : ℝ) -
      ((U : ℝ) - L) * (∏ p ∈ S, (1 - (1 : ℝ) / p))| ≤
      (2 : ℝ) ^ S.card := by
  classical
  let q : Finset ℕ → ℝ := fun T =>
    ((U / (∏ p ∈ T, p) : ℕ) : ℝ) - ((L / (∏ p ∈ T, p) : ℕ) : ℝ)
  let d : Finset ℕ → ℝ := fun T => ((U : ℝ) - L) / (∏ p ∈ T, (p : ℝ))
  have hcount :
      (((Finset.Ioc L U).filter fun n => Nat.Coprime n (∏ p ∈ S, p)).card : ℝ) =
      ∑ T ∈ S.powerset, (-1 : ℝ) ^ T.card * q T := by
    have h := RoughIEPartial.card_coprime_Ioc_eq_inclusion_exclusion L U S hLU hprime
    dsimp [q]
    exact_mod_cast h
  have hdensity : ((U : ℝ) - L) * (∏ p ∈ S, (1 - (1 : ℝ) / p)) =
      ∑ T ∈ S.powerset, (-1 : ℝ) ^ T.card * d T := by
    rw [density_expansion, Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro T hT
    dsimp [d]
    ring
  have herr : ∀ T ∈ S.powerset, |q T - d T| ≤ 1 := by
    intro T hT
    have hp : 0 < ∏ p ∈ T, p := by
      apply Finset.prod_pos
      intro p hp
      exact (hprime p ((Finset.mem_powerset.mp hT) hp)).pos
    have h := RoughRounding.interval_quotient_error L U (∏ p ∈ T, p) hp
    apply le_of_lt
    simpa [q, d, Nat.cast_prod] using h
  rw [hcount, hdensity, ← Finset.sum_sub_distrib]
  have hs := signed_error_sum_bound S (fun T => q T - d T) herr
  simpa only [mul_sub] using hs

#print axioms density_expansion
#print axioms signed_error_sum_bound
#print axioms card_coprime_Ioc_discrepancy
end RoughDiscrepancy
