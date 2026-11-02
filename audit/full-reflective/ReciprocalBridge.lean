import UpperBridge
import Erdos302CoverRowsFC

/-! Bridge ordered product edges to Kitamura's rational cover predicate.
The positivity hypothesis is essential: division by zero is total in `ℚ`.
-/

namespace UpperBridge

/-- For positive naturals, a reciprocal decomposition places the left
    denominator strictly below each denominator on the right. -/
theorem reciprocal_lt_denominators {a b c : ℕ}
    (ha : 0 < a) (hb : 0 < b) (hc : 0 < c)
    (h : (1 : ℚ) / a = (1 : ℚ) / b + (1 : ℚ) / c) :
    a < b ∧ a < c := by
  have hp := (reciprocal_iff_product ha hb hc).1 h
  constructor
  · by_contra hn
    have hba : b ≤ a := Nat.le_of_not_gt hn
    have hm : b * c ≤ a * c := Nat.mul_le_mul_right c hba
    have hab : 0 < a * b := Nat.mul_pos ha hb
    nlinarith
  · by_contra hn
    have hca : c ≤ a := Nat.le_of_not_gt hn
    have hm : b * c ≤ b * a := Nat.mul_le_mul_left b hca
    have hac : 0 < a * c := Nat.mul_pos ha hc
    nlinarith

/-- Either order of the distinct right-hand denominators yields an ordered edge. -/
theorem reciprocal_ordered_edge {U : Finset ℕ} {a b c : ℕ}
    (haU : a ∈ U) (hbU : b ∈ U) (hcU : c ∈ U)
    (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) (hbc : b ≠ c)
    (h : (1 : ℚ) / a = (1 : ℚ) / b + (1 : ℚ) / c) :
    OrderedEdge U a b c ∨ OrderedEdge U a c b := by
  have hlt := reciprocal_lt_denominators ha hb hc h
  have hp := (reciprocal_iff_product ha hb hc).1 h
  rcases lt_or_gt_of_ne hbc with hbc' | hcb'
  · exact Or.inl ⟨haU, hbU, hcU, ha, hlt.1, hbc', hp⟩
  · right
    refine ⟨haU, hcU, hbU, ha, hlt.2, hcb', ?_⟩
    simpa [Nat.mul_comm, Nat.add_comm] using hp

/-- On a positive vertex set, every ordered cover is an upstream cover.
The cover set itself need not be contained in the vertex set. -/
theorem orderedCover_to_upstream {U S : Finset ℕ}
    (hpos : ∀ x ∈ U, 0 < x) (hcover : OrderedCover U S) :
    Erdos302CoverRowsFC.NoUnitFractionCover U S := by
  intro a haU b hbU c hcU _ _ hbc h
  rcases reciprocal_ordered_edge haU hbU hcU (hpos a haU) (hpos b hbU)
      (hpos c hcU) hbc h with hedge | hedge
  · exact hcover a b c hedge
  · rcases hcover a c b hedge with ha | hc | hb
    · exact Or.inl ha
    · exact Or.inr (Or.inr hc)
    · exact Or.inr (Or.inl hb)

#print axioms reciprocal_lt_denominators
#print axioms reciprocal_ordered_edge
#print axioms orderedCover_to_upstream

end UpperBridge
