import Mathlib.Data.Finset.Card
import Mathlib.Tactic

namespace ArchiveScaling

/-- Definitionally the same predicate as `UpperBridge.OrderedEdge`. -/
def Edge (U : Finset ℕ) (a b c : ℕ) : Prop :=
  a ∈ U ∧ b ∈ U ∧ c ∈ U ∧ 0 < a ∧ a < b ∧ b < c ∧ b*c = a*(b+c)

def Cover (U S : Finset ℕ) : Prop :=
  ∀ a b c, Edge U a b c → a ∈ S ∨ b ∈ S ∨ c ∈ S

def Bound (U : Finset ℕ) (r : ℕ) : Prop :=
  ∀ S : Finset ℕ, Cover U S → r ≤ S.card

def scale (m d x : ℕ) : ℕ := x*m/d

def image (U : Finset ℕ) (m d : ℕ) : Finset ℕ :=
  U.image (scale m d)

/-- Exactness is required for each source vertex, not just for edges. -/
theorem scale_exact {m d x : ℕ} (h : d ∣ x*m) :
    d * scale m d x = m*x := by
  unfold scale
  simpa [Nat.mul_comm] using (Nat.div_mul_cancel h)

theorem scale_pos {m d x : ℕ} (hm : 0 < m) (hx : 0 < x)
    (h : d ∣ x*m) : 0 < scale m d x := by
  have e := scale_exact h
  have p : 0 < m*x := Nat.mul_pos hm hx
  by_contra hn
  have : scale m d x = 0 := by omega
  simp [this] at e
  omega

theorem scale_lt_iff {m d x y : ℕ} (hm : 0 < m) (hd : 0 < d)
    (hx : d ∣ x*m) (hy : d ∣ y*m) :
    scale m d x < scale m d y ↔ x < y := by
  have ex := scale_exact hx
  have ey := scale_exact hy
  constructor <;> intro h <;> nlinarith

theorem scale_inj_on {U : Finset ℕ} {m d : ℕ} (hm : 0 < m) (hd : 0 < d)
    (hex : ∀ x ∈ U, d ∣ x*m) :
    Set.InjOn (scale m d) (↑U : Set ℕ) := by
  intro x hx y hy he
  have ex := scale_exact (hex x hx)
  have ey := scale_exact (hex y hy)
  nlinarith

/-- Polynomial edge equation in both directions; cancellation uses positive
    integer squares and never divides a possibly inexact product. -/
theorem scale_equation_iff {m d a b c : ℕ} (hm : 0 < m) (hd : 0 < d)
    (ha : d ∣ a*m) (hb : d ∣ b*m) (hc : d ∣ c*m) :
    scale m d b * scale m d c =
        scale m d a * (scale m d b + scale m d c) ↔
      b*c = a*(b+c) := by
  have ea := scale_exact ha
  have eb := scale_exact hb
  have ec := scale_exact hc
  have lhs : (d*d) * (scale m d b * scale m d c) = (m*m) * (b*c) := by
    calc
      (d*d) * (scale m d b * scale m d c) = (d*scale m d b)*(d*scale m d c) := by ring
      _ = (m*b)*(m*c) := by rw [eb, ec]
      _ = (m*m)*(b*c) := by ring
  have rhs : (d*d) * (scale m d a * (scale m d b + scale m d c)) = (m*m) * (a*(b+c)) := by
    calc
      (d*d) * (scale m d a * (scale m d b + scale m d c)) =
          (d*scale m d a)*(d*scale m d b+d*scale m d c) := by ring
      _ = (m*a)*(m*b+m*c) := by rw [ea, eb, ec]
      _ = (m*m)*(a*(b+c)) := by ring
  constructor
  · intro h
    apply (mul_left_cancel₀ (ne_of_gt (Nat.mul_pos hm hm)))
    calc
      (m*m)*(b*c) = (d*d)*(scale m d b * scale m d c) := lhs.symm
      _ = (d*d)*(scale m d a * (scale m d b + scale m d c)) := congrArg _ h
      _ = (m*m)*(a*(b+c)) := rhs
  · intro h
    apply (mul_left_cancel₀ (ne_of_gt (Nat.mul_pos hd hd)))
    calc
      (d*d)*(scale m d b * scale m d c) = (m*m)*(b*c) := lhs
      _ = (m*m)*(a*(b+c)) := congrArg _ h
      _ = (d*d)*(scale m d a * (scale m d b + scale m d c)) := rhs.symm

theorem edge_image {U : Finset ℕ} {m d a b c : ℕ} (hm : 0 < m) (hd : 0 < d)
    (hex : ∀ x ∈ U, d ∣ x*m) (h : Edge U a b c) :
    Edge (image U m d) (scale m d a) (scale m d b) (scale m d c) := by
  rcases h with ⟨ha, hb, hc, hp, hab, hbc, he⟩
  exact ⟨Finset.mem_image.mpr ⟨a, ha, rfl⟩,
    Finset.mem_image.mpr ⟨b, hb, rfl⟩,
    Finset.mem_image.mpr ⟨c, hc, rfl⟩,
    scale_pos hm hp (hex a ha),
    (scale_lt_iff hm hd (hex a ha) (hex b hb)).2 hab,
    (scale_lt_iff hm hd (hex b hb) (hex c hc)).2 hbc,
    (scale_equation_iff hm hd (hex a ha) (hex b hb) (hex c hc)).2 he⟩

/-- Every image edge has source preimages forming an edge (not merely a
    forward implication). -/
theorem edge_image_iff {U : Finset ℕ} {m d a b c : ℕ} (hm : 0 < m) (hd : 0 < d)
    (hex : ∀ x ∈ U, d ∣ x*m) (ha : a ∈ U) (hb : b ∈ U) (hc : c ∈ U) :
    Edge (image U m d) (scale m d a) (scale m d b) (scale m d c) ↔ Edge U a b c := by
  constructor
  · intro h
    rcases h with ⟨_, _, _, hp, hab, hbc, he⟩
    have ea := scale_exact (hex a ha)
    have ap : 0 < a := by nlinarith
    exact ⟨ha, hb, hc, ap,
      (scale_lt_iff hm hd (hex a ha) (hex b hb)).1 hab,
      (scale_lt_iff hm hd (hex b hb) (hex c hc)).1 hbc,
      (scale_equation_iff hm hd (hex a ha) (hex b hb) (hex c hc)).1 he⟩
  · exact edge_image hm hd hex

theorem edge_image_preimages {U : Finset ℕ} {m d A B C : ℕ} (hm : 0 < m) (hd : 0 < d)
    (hex : ∀ x ∈ U, d ∣ x*m) (h : Edge (image U m d) A B C) :
    ∃ a b c, Edge U a b c ∧ scale m d a = A ∧ scale m d b = B ∧ scale m d c = C := by
  obtain ⟨a, ha, rfl⟩ := Finset.mem_image.mp h.1
  obtain ⟨b, hb, rfl⟩ := Finset.mem_image.mp h.2.1
  obtain ⟨c, hc, rfl⟩ := Finset.mem_image.mp h.2.2.1
  exact ⟨a, b, c, (edge_image_iff hm hd hex ha hb hc).1 h, rfl, rfl, rfl⟩

/-- Pull back the cover by filtering the *finite source support*.  Injectivity
    only on that support is enough to compare cardinalities. -/
theorem bound_image {U : Finset ℕ} {m d r : ℕ} (hm : 0 < m) (hd : 0 < d)
    (hex : ∀ x ∈ U, d ∣ x*m) (hbound : Bound U r) : Bound (image U m d) r := by
  intro S hs
  let P := U.filter (fun x => scale m d x ∈ S)
  have hp : Cover U P := by
    intro a b c he
    have hi := hs _ _ _ (edge_image hm hd hex he)
    rcases hi with ha | hb | hc
    · exact Or.inl (Finset.mem_filter.mpr ⟨he.1, ha⟩)
    · exact Or.inr (Or.inl (Finset.mem_filter.mpr ⟨he.2.1, hb⟩))
    · exact Or.inr (Or.inr (Finset.mem_filter.mpr ⟨he.2.2.1, hc⟩))
  have hc : P.card ≤ S.card := by
    apply Finset.card_le_card_of_injOn (scale m d)
    · intro x hx
      exact (Finset.mem_filter.mp hx).2
    · intro x hx y hy hxy
      exact scale_inj_on hm hd hex (Finset.mem_filter.mp hx).1 (Finset.mem_filter.mp hy).1 hxy
  exact le_trans (hbound P hp) hc

#print axioms scale_equation_iff
#print axioms bound_image
end ArchiveScaling
