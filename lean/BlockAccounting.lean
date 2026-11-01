import Summation

/-! Generic finite block accounting. This does not construct the smooth/rough
blocks, establish their local cover bounds, or prove the archive recurrence. -/
namespace BlockAccounting
open Finset

/-- Pairwise-disjoint blocks cannot charge the same complement point twice.
Neither the blocks nor the leftover complement need cover the interval. -/
theorem global_block_accounting {ι : Type*} [DecidableEq ι]
    {N : ℕ} {A : Finset ℕ} {s : Finset ι}
    {blocks : ι → Finset ℕ} {weight count : ι → ℕ}
    (hA : A ⊆ Icc 1 N)
    (hblocks : ∀ i ∈ s, blocks i ⊆ Icc 1 N)
    (hdisjoint : ∀ i ∈ s, ∀ j ∈ s, i ≠ j → Disjoint (blocks i) (blocks j))
    (hdemand : ∀ i ∈ s, weight i * count i ≤ (blocks i ∩ (Icc 1 N \ A)).card) :
    A.card + ∑ i ∈ s, weight i * count i ≤ N := by
  classical
  let C := Icc 1 N \ A
  have hpairs : ∀ i ∈ s, ∀ j ∈ s, i ≠ j →
      Disjoint (blocks i ∩ C) (blocks j ∩ C) := by
    intro i hi j hj hij
    rw [Finset.disjoint_left]
    intro x hxi hxj
    exact (Finset.disjoint_left.mp (hdisjoint i hi j hj hij))
      (Finset.mem_inter.mp hxi).1 (Finset.mem_inter.mp hxj).1
  have hsub : s.biUnion (fun i => blocks i ∩ C) ⊆ C := by
    intro x hx
    obtain ⟨i, hi, hx⟩ := Finset.mem_biUnion.mp hx
    exact (Finset.mem_inter.mp hx).2
  have hsum : (∑ i ∈ s, weight i * count i) ≤ C.card := by
    calc
      _ ≤ ∑ i ∈ s, (blocks i ∩ C).card := Finset.sum_le_sum hdemand
      _ = (s.biUnion (fun i => blocks i ∩ C)).card := (Finset.card_biUnion hpairs).symm
      _ ≤ C.card := Finset.card_le_card hsub
  have hsplit : C.card + A.card = (Icc 1 N).card :=
    Finset.card_sdiff_add_card_eq_card hA
  have hcard : (Icc 1 N).card = N := by simp <;> omega
  omega

/-- The same result in the real-valued ledger used by `ArchiveSummation`.
Weights and counts here are casts of the natural local quantities. -/
theorem global_block_accounting_real {ι : Type*} [DecidableEq ι]
    {N : ℕ} {A : Finset ℕ} {s : Finset ι}
    {blocks : ι → Finset ℕ} {weight count : ι → ℕ}
    (hA : A ⊆ Icc 1 N)
    (hblocks : ∀ i ∈ s, blocks i ⊆ Icc 1 N)
    (hdisjoint : ∀ i ∈ s, ∀ j ∈ s, i ≠ j → Disjoint (blocks i) (blocks j))
    (hdemand : ∀ i ∈ s, weight i * count i ≤ (blocks i ∩ (Icc 1 N \ A)).card) :
    (A.card : ℝ) + ArchiveSummation.weightedCount s
      (fun i => (weight i : ℝ)) (fun i => (count i : ℝ)) ≤ (N : ℝ) := by
  have h := global_block_accounting hA hblocks hdisjoint hdemand
  unfold ArchiveSummation.weightedCount
  exact_mod_cast h

#print axioms global_block_accounting
#print axioms global_block_accounting_real
end BlockAccounting
