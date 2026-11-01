import ReciprocalBridge
import Extended

/-! The semantic active support of a finite vertex set.  This file does not
assert that a generated archive support or a numerical profile equals it. -/
namespace UpperBridge

/-- Exactly the vertices of `U` occurring in an ordered edge of `U`. -/
noncomputable def activeSupport (U : Finset ℕ) : Finset ℕ := by
  classical
  exact U.filter (fun x => ∃ a ∈ U, ∃ b ∈ U, ∃ c ∈ U,
    OrderedEdge U a b c ∧ (x = a ∨ x = b ∨ x = c))

theorem activeSupport_subset (U : Finset ℕ) : activeSupport U ⊆ U := by
  classical
  intro x hx
  exact (Finset.mem_filter.mp hx).1

/-- Every vertex in every ordered edge occurs in the finite active support. -/
theorem orderedEdge_mem_activeSupport {U : Finset ℕ} {a b c : ℕ}
    (he : OrderedEdge U a b c) :
    a ∈ activeSupport U ∧ b ∈ activeSupport U ∧ c ∈ activeSupport U := by
  classical
  have ha : a ∈ U := he.1
  have hb : b ∈ U := he.2.1
  have hc : c ∈ U := he.2.2.1
  refine ⟨Finset.mem_filter.mpr ⟨ha, ?_⟩,
    Finset.mem_filter.mpr ⟨hb, ?_⟩, Finset.mem_filter.mpr ⟨hc, ?_⟩⟩
  · exact ⟨a, ha, b, hb, c, hc, he, Or.inl rfl⟩
  · exact ⟨a, ha, b, hb, c, hc, he, Or.inr (Or.inl rfl)⟩
  · exact ⟨a, ha, b, hb, c, hc, he, Or.inr (Or.inr rfl)⟩

/-- Restricting to exact edge support neither gains nor loses ordered covers. -/
theorem activeSupport_cover_iff {U S : Finset ℕ} :
    OrderedCover (activeSupport U) S ↔ OrderedCover U S :=
  Extended.trim_cover (activeSupport_subset U) (fun _ _ _ he =>
    orderedEdge_mem_activeSupport he)

/-- A full-vertex upstream lower bound implies the corresponding ordered-cover
bound on the exact active support. The full lower bound is a genuine independent
premise, not the active-support conclusion or a profile computation. -/
theorem activeSupport_bound_of_upstream {U : Finset ℕ} {r : ℕ}
    (hpos : ∀ x ∈ U, 0 < x)
    (hlower : ∀ S : Finset ℕ, Erdos302CoverRowsFC.NoUnitFractionCover U S →
      r ≤ S.card) :
    Extended.Bound (activeSupport U) r := by
  intro S hs
  apply hlower S
  exact orderedCover_to_upstream hpos (activeSupport_cover_iff.mp hs)

#print axioms activeSupport_subset
#print axioms orderedEdge_mem_activeSupport
#print axioms activeSupport_cover_iff
#print axioms activeSupport_bound_of_upstream
end UpperBridge
