import Mathlib.Data.Rat.Defs
import Mathlib.Data.Finset.Basic

/-! The predicate below is copied literally from lower-lean/Erdos302Lower/Defs.lean
at public commit a60f43511ce0741ef6e80bdb9b620c5bf854f81c, without its
unrelated Erdos301 import. -/
namespace Erdos302Lower

/-- A finite set has no all-distinct two-tail unit-fraction relation. -/
def NoUnitFractionTriple (A : Finset ℕ) : Prop :=
  ∀ a ∈ A, ∀ b ∈ A, ∀ c ∈ A,
    a ≠ b → a ≠ c → b ≠ c →
      (1 : ℚ) / a ≠ (1 : ℚ) / b + (1 : ℚ) / c

end Erdos302Lower
