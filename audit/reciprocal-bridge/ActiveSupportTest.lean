import ActiveSupport

open UpperBridge

-- All three vertices of a genuine edge are retained.
example : 6 ∈ activeSupport ({6, 10, 15} : Finset ℕ) ∧
    10 ∈ activeSupport ({6, 10, 15} : Finset ℕ) ∧
    15 ∈ activeSupport ({6, 10, 15} : Finset ℕ) := by
  apply orderedEdge_mem_activeSupport
  norm_num [OrderedEdge]

-- A positive isolated vertex cannot be introduced by the support construction.
example : activeSupport ({1, 2} : Finset ℕ) = ∅ := by
  classical
  unfold activeSupport
  apply Finset.filter_eq_empty_iff.mpr
  intro x hx h
  obtain ⟨a, ha, b, hb, c, hc, he, _⟩ := h
  simp only [Finset.mem_insert, Finset.mem_singleton] at ha hb hc
  rcases ha with rfl | rfl <;> rcases hb with rfl | rfl <;>
    rcases hc with rfl | rfl <;> norm_num [OrderedEdge] at he

-- Nonzero bound on actual upstream covers, established directly from the
-- reciprocal triple, then transported to the semantic active support.
theorem example_upstream_lower : ∀ S : Finset ℕ,
    Erdos302CoverRowsFC.NoUnitFractionCover ({6, 10, 15} : Finset ℕ) S →
      1 ≤ S.card := by
  intro S h
  have hh := h 6 (by norm_num) 10 (by norm_num) 15 (by norm_num)
    (by norm_num) (by norm_num) (by norm_num) (by norm_num)
  rcases hh with h6 | h10 | h15
  · exact Finset.card_pos.mpr ⟨6, h6⟩
  · exact Finset.card_pos.mpr ⟨10, h10⟩
  · exact Finset.card_pos.mpr ⟨15, h15⟩

example : Extended.Bound (activeSupport ({6, 10, 15} : Finset ℕ)) 1 := by
  apply activeSupport_bound_of_upstream _ example_upstream_lower
  intro x hx
  simp only [Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl <;> norm_num

#print axioms example_upstream_lower
