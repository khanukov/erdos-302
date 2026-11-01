import Mathlib.Combinatorics.Enumerative.InclusionExclusion
import Mathlib.Tactic

/-!
Partial inclusion–exclusion specialization. This file is unverified: it has not
been compiled. The remaining work is to identify the left-hand side with the
coprime filter and each intersection cardinal with the interval multiple count.
-/

namespace RoughIEPartial

open scoped BigOperators

/-- Multiples of `p` in the interval, viewed as a finite type. -/
def intervalMultiples (L U p : ℕ) : Finset {n : ℕ // n ∈ Finset.Ioc L U} :=
  Finset.univ.filter fun n => p ∣ n.val

/-- Direct specialization of mathlib's inclusion–exclusion theorem. -/
theorem interval_inclusion_exclusion (L U : ℕ) (S : Finset ℕ) :
    ((S.inf fun p => (intervalMultiples L U p)ᶜ).card : ℤ) =
      ∑ T ∈ S.powerset, (-1 : ℤ) ^ T.card * (T.inf (intervalMultiples L U)).card := by
  classical
  exact Finset.inclusion_exclusion_card_inf_compl S (intervalMultiples L U)

#print axioms interval_inclusion_exclusion

end RoughIEPartial
