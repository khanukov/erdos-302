import Erdos302Lower.Defs
import Mathlib.Tactic

namespace UpperBridge

theorem reciprocal_iff_product {a b c : ℕ} (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) :
    ((1 : ℚ) / a = (1 : ℚ) / b + (1 : ℚ) / c) ↔ b * c = a * (b + c) := by
  have haQ : (a : ℚ) ≠ 0 := by exact_mod_cast (Nat.ne_of_gt ha)
  have hbQ : (b : ℚ) ≠ 0 := by exact_mod_cast (Nat.ne_of_gt hb)
  have hcQ : (c : ℚ) ≠ 0 := by exact_mod_cast (Nat.ne_of_gt hc)
  have heq : ((1 : ℚ) / a = (1 : ℚ) / b + (1 : ℚ) / c) ↔
      (b : ℚ) * c = a * (b + c) := by
    field_simp
    constructor <;> intro h <;> nlinarith
  rw [heq]
  exact_mod_cast Iff.rfl

/-- Ordered, distinct positive natural-number edges in a finite vertex set. -/
def OrderedEdge (U : Finset ℕ) (a b c : ℕ) : Prop :=
  a ∈ U ∧ b ∈ U ∧ c ∈ U ∧ 0 < a ∧ a < b ∧ b < c ∧ b * c = a * (b + c)

/-- A set hits every ordered edge; it need not be contained in U. -/
def OrderedCover (U S : Finset ℕ) : Prop :=
  ∀ a b c, OrderedEdge U a b c → a ∈ S ∨ b ∈ S ∨ c ∈ S

theorem complement_cover {U A : Finset ℕ}
    (hfree : Erdos302Lower.NoUnitFractionTriple A) : OrderedCover U (U \ A) := by
  intro a b c ⟨ha, hb, hc, ha0, hab, hbc, heq⟩
  have hb0 : 0 < b := lt_trans ha0 hab
  have hc0 : 0 < c := lt_trans hb0 hbc
  have hrec := (reciprocal_iff_product ha0 hb0 hc0).2 heq
  by_contra h
  push Not at h
  have haA : a ∈ A := by simpa [ha] using h.1
  have hbA : b ∈ A := by simpa [hb] using h.2.1
  have hcA : c ∈ A := by simpa [hc] using h.2.2
  exact hfree a haA b hbA c hcA (ne_of_lt hab) (ne_of_lt (lt_trans hab hbc))
    (ne_of_lt hbc) hrec

/-- Any independently proved lower bound on ordered covers bounds deletions. -/
theorem deletion_bound {U A : Finset ℕ} {r : ℕ}
    (hfree : Erdos302Lower.NoUnitFractionTriple A)
    (hlower : ∀ S : Finset ℕ, OrderedCover U S → r ≤ S.card) :
    r ≤ (U \ A).card :=
  hlower (U \ A) (complement_cover hfree)

/-- The deletion lower bound becomes a finite upper bound when A lies in U. -/
theorem finite_card_bound {U A : Finset ℕ} {r : ℕ}
    (hsubset : A ⊆ U) (hfree : Erdos302Lower.NoUnitFractionTriple A)
    (hlower : ∀ S : Finset ℕ, OrderedCover U S → r ≤ S.card) :
    A.card + r ≤ U.card := by
  have h := deletion_bound hfree hlower
  have heq : (U \ A).card + A.card = U.card := Finset.card_sdiff_add_card_eq_card hsubset
  omega

example : OrderedEdge ({6, 10, 15} : Finset ℕ) 6 10 15 := by
  norm_num [OrderedEdge]

/-- A concrete kernel-checked instance: the triple forces at least one deletion. -/
theorem example_cover_lower : ∀ S : Finset ℕ,
    OrderedCover ({6, 10, 15} : Finset ℕ) S → 1 ≤ S.card := by
  intro S h
  have he : OrderedEdge ({6, 10, 15} : Finset ℕ) 6 10 15 := by
    norm_num [OrderedEdge]
  rcases h 6 10 15 he with h6 | h10 | h15
  · exact Finset.card_pos.mpr ⟨6, h6⟩
  · exact Finset.card_pos.mpr ⟨10, h10⟩
  · exact Finset.card_pos.mpr ⟨15, h15⟩

theorem example_upper {A : Finset ℕ}
    (hsubset : A ⊆ ({6, 10, 15} : Finset ℕ))
    (hfree : Erdos302Lower.NoUnitFractionTriple A) : A.card ≤ 2 := by
  have h := finite_card_bound hsubset hfree example_cover_lower
  norm_num at h
  omega

#print axioms example_upper

#print axioms finite_card_bound
#print axioms reciprocal_iff_product
#print axioms complement_cover
#print axioms deletion_bound

end UpperBridge
