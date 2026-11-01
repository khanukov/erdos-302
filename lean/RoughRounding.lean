import Mathlib.Data.Nat.Cast.Order.Field
import Mathlib.Tactic

/-!
Independent candidate for the rounding step in rough-count discrepancy.
This file is not kernel-checked until the hosted CI job succeeds.
-/
namespace RoughRounding

/-- A natural quotient is at most one below the real quotient. -/
theorem nat_div_cast_bounds (n d : ℕ) (hd : 0 < d) :
    ((n / d : ℕ) : ℝ) ≤ (n : ℝ) / d ∧
      (n : ℝ) / d < ((n / d : ℕ) : ℝ) + 1 := by
  have hdR : (0 : ℝ) < d := by exact_mod_cast hd
  have hmod : ((n % d : ℕ) : ℝ) < (d : ℝ) := by
    exact_mod_cast Nat.mod_lt n hd
  have hdecomp : ((n % d : ℕ) : ℝ) + (d : ℝ) * ((n / d : ℕ) : ℝ) = (n : ℝ) := by
    exact_mod_cast Nat.mod_add_div n d
  constructor
  · exact Nat.cast_div_le
  · apply (div_lt_iff₀ hdR).2
    nlinarith

/-- The integer-division interval discrepancy is strictly less than one in
absolute value.  It is valid for any endpoints; ordering is needed later when
this expression is identified with an actual interval count. -/
theorem interval_quotient_error (L U d : ℕ) (hd : 0 < d) :
    |(((U / d : ℕ) : ℝ) - ((L / d : ℕ) : ℝ)) -
      ((U : ℝ) - (L : ℝ)) / d| < 1 := by
  have hU := nat_div_cast_bounds U d hd
  have hL := nat_div_cast_bounds L d hd
  rw [sub_div]
  apply abs_lt.mpr
  constructor <;> linarith [hU.1, hU.2, hL.1, hL.2]

#print axioms RoughRounding.nat_div_cast_bounds
#print axioms RoughRounding.interval_quotient_error
end RoughRounding
