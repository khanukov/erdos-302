import UpperBridge

/- Candidate only: no archive correspondence is asserted. -/
namespace InactiveRetention

def Edge (U : Finset ℕ) (a b c : ℕ) : Prop :=
  a ∈ U ∧ b ∈ U ∧ c ∈ U ∧ b < c ∧ b * c = a * (b + c)

instance (U : Finset ℕ) (a b c : ℕ) : Decidable (Edge U a b c) := by
  unfold Edge
  infer_instance

def Retained (U V : Finset ℕ) : Prop :=
  ∀ a b c, Edge U a b c → a ∈ V ∧ b ∈ V ∧ c ∈ V

/-- Three scans, indexed only by an inactive endpoint and one universe vertex.
    Every recovered triple is checked again against the exact equation. -/
def Bad (U : Finset ℕ) (x y : ℕ) : Prop :=
  Edge U x y (x * y / (y - x)) ∨
  Edge U (x * y / (x + y)) x y ∨
  Edge U (y * x / (y + x)) y x

instance (U : Finset ℕ) (x y : ℕ) : Decidable (Bad U x y) := by
  unfold Bad Edge
  infer_instance

def check (U V : Finset ℕ) : Bool :=
  decide (∀ x ∈ U \ V, ∀ y ∈ U, ¬ Bad U x y)

theorem recovery_a {a b c : ℕ} (ha : 0 < a) (hc : 0 < c)
    (hbc : b < c) (h : b * c = a * (b + c)) :
    a * b / (b - a) = c := by
  have hab : a < b := by nlinarith
  have hp : 0 < b - a := Nat.sub_pos_of_lt hab
  have heq : a * b = c * (b - a) := by
    have hs : b - a + a = b := Nat.sub_add_cancel (Nat.le_of_lt hab)
    nlinarith
  rw [heq]
  exact Nat.mul_div_cancel c hp

theorem recovery_bc {a b c : ℕ} (hb : 0 < b)
    (h : b * c = a * (b + c)) : b * c / (b + c) = a := by
  rw [h]
  exact Nat.mul_div_cancel a (by omega)

/-- Equivalence is for positive universes; no edge-list completeness premise. -/
theorem check_iff_retained (U V : Finset ℕ)
    (positive : ∀ x ∈ U, 0 < x) : check U V = true ↔ Retained U V := by
  simp only [check, decide_eq_true_eq]
  constructor
  · intro noBad a b c e
    rcases e with ⟨ha, hb, hc, hlt, heq⟩
    have edge : Edge U a b c := ⟨ha, hb, hc, hlt, heq⟩
    have ra := recovery_a (positive a ha) (positive c hc) hlt heq
    have rb := recovery_bc (positive b hb) heq
    constructor
    · by_contra h
      have bad : Bad U a b := Or.inl (by rw [ra]; exact edge)
      exact noBad a (Finset.mem_sdiff.mpr ⟨ha, h⟩) b hb bad
    constructor
    · by_contra h
      have bad : Bad U b c := Or.inr (Or.inl (by rw [rb]; exact edge))
      exact noBad b (Finset.mem_sdiff.mpr ⟨hb, h⟩) c hc bad
    · by_contra h
      have bad : Bad U c b := Or.inr (Or.inr (by rw [rb]; exact edge))
      exact noBad c (Finset.mem_sdiff.mpr ⟨hc, h⟩) b hb bad
  · intro retained x hx y hy bad
    have hxU : x ∈ U := (Finset.mem_sdiff.mp hx).1
    have hxV : x ∉ V := (Finset.mem_sdiff.mp hx).2
    rcases bad with e | e | e
    · exact hxV (retained _ _ _ e).1
    · exact hxV (retained _ _ _ e).2.1
    · exact hxV (retained _ _ _ e).2.2

/-- Rational triples with distinct right denominators, in either order. -/
def RationalRetained (U V : Finset ℕ) : Prop :=
  ∀ a b c, a ∈ U → b ∈ U → c ∈ U → b ≠ c →
    (1 : ℚ) / a = (1 : ℚ) / b + (1 : ℚ) / c →
    a ∈ V ∧ b ∈ V ∧ c ∈ V

/-- The checker's ordered edge is the existing bridge's ordered edge on a
    positive universe. -/
theorem edge_iff_ordered {U : Finset ℕ} {a b c : ℕ}
    (positive : ∀ x ∈ U, 0 < x) : Edge U a b c ↔ UpperBridge.OrderedEdge U a b c := by
  constructor
  · rintro ⟨ha, hb, hc, hbc, heq⟩
    have ha0 := positive a ha
    have hc0 := positive c hc
    have hab : a < b := by nlinarith
    exact ⟨ha, hb, hc, ha0, hab, hbc, heq⟩
  · rintro ⟨ha, hb, hc, _, _, hbc, heq⟩
    exact ⟨ha, hb, hc, hbc, heq⟩

theorem retained_iff_rational (U V : Finset ℕ)
    (positive : ∀ x ∈ U, 0 < x) : Retained U V ↔ RationalRetained U V := by
  constructor
  · intro retained a b c ha hb hc hbc hrec
    have heq := (UpperBridge.reciprocal_iff_product (positive a ha)
      (positive b hb) (positive c hc)).1 hrec
    rcases lt_or_gt_of_ne hbc with hlt | hlt
    · exact retained a b c ⟨ha, hb, hc, hlt, heq⟩
    · have e : Edge U a c b := ⟨ha, hc, hb, hlt, by simpa [Nat.mul_comm, Nat.add_comm] using heq⟩
      have h := retained a c b e
      exact ⟨h.1, h.2.2, h.2.1⟩
  · intro retained a b c e
    rcases e with ⟨ha, hb, hc, hlt, heq⟩
    exact retained a b c ha hb hc (ne_of_lt hlt)
      ((UpperBridge.reciprocal_iff_product (positive a ha)
        (positive b hb) (positive c hc)).2 heq)

theorem check_iff_rational_retained (U V : Finset ℕ)
    (positive : ∀ x ∈ U, 0 < x) : check U V = true ↔ RationalRetained U V :=
  (check_iff_retained U V positive).trans (retained_iff_rational U V positive)

theorem equal_denominator_counterexample :
    (1 : ℚ) / 1 = 1 / 2 + 1 / 2 ∧
      ¬ Edge ({1, 2} : Finset ℕ) 1 2 2 := by
  norm_num [Edge]

/-- A literal induced subgraph of node 1097, not its entire universe. -/
def sampleU : Finset ℕ := {1, 2, 3, 6}
def sampleV : Finset ℕ := {2, 3, 6}

theorem sample_check : check sampleU sampleV = true := by decide +kernel

theorem sample_positive : ∀ x ∈ sampleU, 0 < x := by decide +kernel

theorem sample_retained : Retained sampleU sampleV :=
  (check_iff_retained sampleU sampleV sample_positive).mp sample_check

/-- Removing an actual edge endpoint must make the checker fail. -/
theorem sample_mutation : check sampleU ({3, 6} : Finset ℕ) = false := by
  decide +kernel

theorem sample_mutation_b : check sampleU ({2, 6} : Finset ℕ) = false := by
  decide +kernel

theorem sample_mutation_c : check sampleU ({2, 3} : Finset ℕ) = false := by
  decide +kernel

/-- Truncation does not bypass the equation guard in either recovery scan. -/
theorem truncated_recovery_a : 3 * 5 / (5 - 3) = 7 ∧
    ¬ Edge ({3, 5, 7} : Finset ℕ) 3 5 (3 * 5 / (5 - 3)) := by
  decide +kernel

theorem truncated_recovery_bc : 2 * 5 / (2 + 5) = 1 ∧
    ¬ Edge ({1, 2, 5} : Finset ℕ) (2 * 5 / (2 + 5)) 2 5 := by
  decide +kernel

theorem zero_not_positive : ¬ (∀ x ∈ ({0, 1} : Finset ℕ), 0 < x) := by
  decide +kernel

theorem zero_reciprocal_counterexample :
    (1 : ℚ) / 0 = 1 / 0 + 1 / 0 := by norm_num

theorem sample_edge : Edge sampleU 2 3 6 := by decide +kernel

#print axioms InactiveRetention.recovery_a
#print axioms InactiveRetention.recovery_bc
#print axioms InactiveRetention.check_iff_retained
#print axioms InactiveRetention.sample_check
#print axioms InactiveRetention.sample_positive
#print axioms InactiveRetention.sample_retained
#print axioms InactiveRetention.sample_mutation
#print axioms InactiveRetention.sample_edge
#print axioms InactiveRetention.edge_iff_ordered
#print axioms InactiveRetention.retained_iff_rational
#print axioms InactiveRetention.check_iff_rational_retained
#print axioms InactiveRetention.equal_denominator_counterexample
#print axioms InactiveRetention.sample_mutation_b
#print axioms InactiveRetention.sample_mutation_c
#print axioms InactiveRetention.truncated_recovery_a
#print axioms InactiveRetention.truncated_recovery_bc
#print axioms InactiveRetention.zero_not_positive
#print axioms InactiveRetention.zero_reciprocal_counterexample
end InactiveRetention
