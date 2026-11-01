import Mathlib.Tactic

/-! Exact reindexing of positive floor-quotient cells. -/
namespace ArchiveSummation

/-- Both quotient endpoints are valid, even for empty or reversed cells. -/
theorem quotient_cell_iff (N a b q : ℕ)
    (ha : 0 < a) (hb : 0 < b) (hq : 0 < q) :
    (a ≤ N / q ∧ N / q < b) ↔ (N / b < q ∧ q ≤ N / a) := by
  have hswap (x : ℕ) (hx : 0 < x) : x ≤ N / q ↔ q ≤ N / x := by
    rw [Nat.le_div_iff_mul_le hq, Nat.le_div_iff_mul_le hx, Nat.mul_comm]
  have ha' := hswap a ha
  have hb' := hswap b hb
  omega

#print axioms quotient_cell_iff
end ArchiveSummation
