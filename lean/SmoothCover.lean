import SmoothExistence

/-! The bounded positive rough indices give an exact finite partition of [1,N]. -/
namespace SmoothPartition
open Finset

/-- Positive rough indices bounded by N. -/
noncomputable def roughIndices (Q : Finset ℕ) (N : ℕ) : Finset ℕ := by
  classical
  exact (Icc 1 N).filter (Rough Q)

/-- Existence supplies the cover; positivity bounds both factors by the product. -/
theorem blocks_cover (Q : Finset ℕ) (N : ℕ) :
    (roughIndices Q N).biUnion (block Q N) = Icc 1 N := by
  classical
  ext n
  constructor
  · intro hn
    obtain ⟨a, _, hnblock⟩ := Finset.mem_biUnion.mp hn
    exact block_subset Q N a hnblock
  · intro hn
    have hn_bounds := Finset.mem_Icc.mp hn
    have hnpos : 0 < n := by omega
    obtain ⟨a, x, ha, hx, hs, heq⟩ := decomposition_exists Q n hnpos
    have haN : a ≤ N := by nlinarith [ha.1, hx, hn_bounds.2]
    have hxN : x ≤ N := by nlinarith [ha.1, hx, hn_bounds.2]
    have haIndex : a ∈ roughIndices Q N := by
      apply Finset.mem_filter.mpr
      exact ⟨Finset.mem_Icc.mpr ⟨by omega, haN⟩, ha⟩
    have hxVertex : x ∈ SmoothRenewal.vertices Q N := by
      apply Finset.mem_filter.mpr
      exact ⟨Finset.mem_Icc.mpr ⟨by omega, hxN⟩, hs⟩
    apply Finset.mem_biUnion.mpr
    refine ⟨a, haIndex, Finset.mem_inter.mpr ⟨?_, hn⟩⟩
    exact Finset.mem_image.mpr ⟨x, hxVertex, heq.symm⟩

/-- Blocks indexed by distinct members of the finite index set are disjoint. -/
theorem indexed_blocks_disjoint {Q : Finset ℕ} {N a b : ℕ}
    (ha : a ∈ roughIndices Q N) (hb : b ∈ roughIndices Q N) (hne : a ≠ b) :
    Disjoint (block Q N a) (block Q N b) := by
  classical
  exact blocks_disjoint (Finset.mem_filter.mp ha).2 (Finset.mem_filter.mp hb).2 hne

#print axioms blocks_cover
#print axioms indexed_blocks_disjoint
end SmoothPartition
