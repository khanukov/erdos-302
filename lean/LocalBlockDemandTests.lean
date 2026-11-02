import LocalBlockDemand

open Finset SmoothPartition SmoothRenewal RenewalNext

-- The local result accepts the actual prefix demand, not a global inequality.
example (Q A : Finset ℕ) (N a r : ℕ) (ha : 0 < a)
    (hfree : ∀ x y z, Triple x y z → x ∈ A → y ∈ A → z ∈ A → False)
    (hd : Demand Edge (vertices Q (N / a)) r) :
    r ≤ (block Q N a ∩ (Icc 1 N \ A)).card := by
  exact local_block_demand ha hfree hd

-- No roughness or nonempty block is needed for the zero-demand edge case.
example (Q A : Finset ℕ) (N a : ℕ) (ha : 0 < a)
    (hfree : ∀ x y z, Triple x y z → x ∈ A → y ∈ A → z ∈ A → False) :
    0 ≤ (block Q N a ∩ (Icc 1 N \ A)).card := by
  apply local_block_demand ha hfree
  intro C hc
  exact Nat.zero_le _

-- A family of true local prefix demands feeds the global accounting lemma.
example (Q A s : Finset ℕ) (N : ℕ) (r : ℕ → ℕ)
    (hA : A ⊆ Icc 1 N)
    (hfree : ∀ x y z, Triple x y z → x ∈ A → y ∈ A → z ∈ A → False)
    (hrough : ∀ a ∈ s, Rough Q a)
    (hd : ∀ a ∈ s, Demand Edge (vertices Q (N / a)) (r a)) :
    A.card + ∑ a ∈ s, r a ≤ N := by
  exact global_from_prefix_demands hA hfree hrough hd

#print axioms SmoothPartition.local_block_demand
#print axioms SmoothPartition.global_from_prefix_demands
