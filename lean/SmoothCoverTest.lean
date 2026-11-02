import SmoothCover

open Finset SmoothPartition

-- The complete family covers the interval for arbitrary Q, including nonprimes.
example (Q : Finset ℕ) (N : ℕ) :
    (roughIndices Q N).biUnion (block Q N) = Icc 1 N :=
  blocks_cover Q N

-- The zero endpoint produces an empty partition.
example (Q : Finset ℕ) :
    (roughIndices Q 0).biUnion (block Q 0) = ∅ := by
  rw [blocks_cover]
  simp

-- A specific interior point is covered even when Q contains a nonprime.
example : 72 ∈ (roughIndices ({2, 4} : Finset ℕ) 100).biUnion
    (block {2, 4} 100) := by
  rw [blocks_cover]
  norm_num

-- Distinct members of the indexing family have disjoint blocks.
example (Q : Finset ℕ) (N a b : ℕ)
    (ha : a ∈ roughIndices Q N) (hb : b ∈ roughIndices Q N) (hne : a ≠ b) :
    Disjoint (block Q N a) (block Q N b) :=
  indexed_blocks_disjoint ha hb hne

#print axioms SmoothPartition.blocks_cover
#print axioms SmoothPartition.indexed_blocks_disjoint
