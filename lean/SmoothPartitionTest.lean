import SmoothPartition

open Finset SmoothPartition

-- Two different rough indices cannot share a positive bounded smooth multiple.
example (Q : Finset ℕ) (N a b : ℕ) (ha : Rough Q a) (hb : Rough Q b)
    (hne : a ≠ b) : Disjoint (block Q N a) (block Q N b) :=
  blocks_disjoint ha hb hne

-- A rough part and a positive smooth part are individually determined.
example (Q : Finset ℕ) (a b x y : ℕ)
    (ha : Rough Q a) (hb : Rough Q b)
    (hx : 0 < x) (hy : 0 < y)
    (hsx : SmoothRenewal.Smooth Q x) (hsy : SmoothRenewal.Smooth Q y)
    (h : a * x = b * y) : a = b ∧ x = y :=
  decomposition_unique ha hb hx hy hsx hsy h

-- Nonempty explicit instance: the block with rough index 1 contains 1.
example : 1 ∈ block (∅ : Finset ℕ) 1 1 := by
  simp [block, SmoothRenewal.vertices, SmoothRenewal.Smooth]

-- Omitting the positive smooth-factor condition would make uniqueness false.
example : (1 : ℕ) * 0 = 2 * 0 ∧ (1 : ℕ) ≠ 2 := by norm_num

#print axioms SmoothPartition.decomposition_unique
#print axioms SmoothPartition.blocks_disjoint
