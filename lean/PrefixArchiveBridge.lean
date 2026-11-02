import LocalBlockDemand
import SumBridge

/-! Conditional finite bridge. Cells are indexed by `Fin 20` together with an
arbitrary correction-cell type. The hypotheses `hcount` and `hallocate` are
archive/profile obligations, not consequences of numerical ledger arithmetic. -/
namespace PrefixArchiveBridge
open Finset

noncomputable def contribution {ι : Type*} [DecidableEq ι]
    (cells : Finset ι) (h : ι → ℝ) (member : ι → ℕ → Prop)
    [DecidableRel member] (q : ℕ) : ℝ :=
  ∑ i ∈ cells, if member i q then h i else 0

/-- Sum cells without assuming they are disjoint: overlap is charged pointwise
against the certified demand at the same rough index. -/
theorem cells_le_prefix {ι : Type*} [DecidableEq ι]
    (cells : Finset ι) (s : Finset ℕ) (h : ι → ℝ)
    (member : ι → ℕ → Prop) [DecidableRel member] (r : ℕ → ℕ)
    (count : ι → ℝ)
    (hcount : ∀ i ∈ cells, count i = ((s.filter (member i)).card : ℝ))
    (hallocate : ∀ q ∈ s, contribution cells h member q ≤ (r q : ℝ)) :
    ArchiveSummation.weightedCount cells h count ≤ ∑ q ∈ s, (r q : ℝ) := by
  unfold ArchiveSummation.weightedCount
  calc
    (∑ i ∈ cells, h i * count i) =
        ∑ i ∈ cells, ∑ q ∈ s, if member i q then h i else 0 := by
      apply Finset.sum_congr rfl
      intro i hi
      rw [hcount i hi]
      rw [← Finset.sum_filter]
      simp
    _ = ∑ q ∈ s, contribution cells h member q := by
      simp only [contribution, Finset.sum_comm]
    _ ≤ ∑ q ∈ s, (r q : ℝ) := Finset.sum_le_sum hallocate

/-- Finite analytic upper bound from local graph demands. `ι` may be taken as
`Fin 20 ⊕ correction_index`; no assertion that supplied cells are archive data
or that their heights have certified demand has been hidden in the proof. -/
theorem upper_from_prefix {ι : Type*} [DecidableEq ι]
    (cells : Finset ι) (s Q A : Finset ℕ) (N : ℕ) (r : ℕ → ℕ)
    (h : ι → ℝ) (a b j : ι → ℕ) (S : ι → Finset ℕ)
    (member : ι → ℕ → Prop) [DecidableRel member]
    (hA : A ⊆ Icc 1 N)
    (hfree : ∀ x y z, SmoothRenewal.Triple x y z → x ∈ A → y ∈ A → z ∈ A → False)
    (hrough : ∀ q ∈ s, SmoothPartition.Rough Q q)
    (hd : ∀ q ∈ s, RenewalNext.Demand SmoothRenewal.Edge
      (SmoothRenewal.vertices Q (N / q)) (r q))
    (hh : ∀ i ∈ cells, 0 ≤ h i)
    (ha : ∀ i ∈ cells, 0 < a i) (hb : ∀ i ∈ cells, 0 < b i)
    (hLU : ∀ i ∈ cells, N / b i ≤ N / a i)
    (hprime : ∀ i ∈ cells, ∀ p ∈ S i, Nat.Prime p)
    (hrho : ∀ i ∈ cells, 0 ≤ ArchiveSumBridge.density (S i) ∧ ArchiveSumBridge.density (S i) ≤ 1)
    (hbudget : ∀ i ∈ cells, (2 : ℝ) ^ (S i).card ≤ (2 : ℝ) ^ (j i))
    (hcount : ∀ i ∈ cells,
      (ArchiveSummation.cellCount N (a i) (b i)
        (fun q => Nat.Coprime q (∏ p ∈ S i, p)) : ℝ) =
          ((s.filter (member i)).card : ℝ))
    (hallocate : ∀ q ∈ s, contribution cells h member q ≤ (r q : ℝ)) :
    (A.card : ℝ) ≤ (N : ℝ) - ArchiveSummation.weightedIdeal cells h
      (fun i => (N : ℝ) * ArchiveSumBridge.density (S i) *
        (1 / (a i : ℝ) - 1 / (b i : ℝ))) +
      ArchiveSummation.weightedError cells h (fun i => (2 : ℝ) ^ (j i)) := by
  have hglobal := SmoothPartition.global_from_prefix_demands hA hfree hrough hd
  have hglobal' : (A.card : ℝ) + ∑ q ∈ s, (r q : ℝ) ≤ N := by
    exact_mod_cast hglobal
  have hcell := cells_le_prefix cells s h member r _ hcount hallocate
  apply ArchiveSumBridge.global_upper_archive cells N (A.card : ℝ) h a b j S
    hh ha hb hLU hprime hrho hbudget
  linarith

#print axioms cells_le_prefix
#print axioms upper_from_prefix
end PrefixArchiveBridge
