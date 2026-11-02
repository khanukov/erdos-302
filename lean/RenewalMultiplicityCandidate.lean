import RenewalUnroll
import LocalBlockDemand
import SumBridge

/-! Candidate only: not compiled or kernel checked.  The expansion keeps
power choices as distinct nested-sum occurrences, even for repeated divisors.
No prime factorisation or archive-data correspondence is assumed or proved. -/
namespace RenewalMultiplicityCandidate
open Finset

/-- All suffix power choices are occurrences: no conversion to a set. -/
def expansion (p : ℕ → ℕ) (d : ℕ → ℕ → ℕ) : ℕ → ℕ → ℕ
  | 0, _ => 0
  | j + 1, n => ∑ k ∈ range n,
      (expansion p d j (n / p j ^ k) + d j (n / p j ^ k))

/-- Finite arbitrary-level unrolling; instantiate `levels` with 20.
The divisors need only exceed one; they need not be prime or distinct.
All level-zero values and all zero-argument values are explicitly fixed. -/
theorem expansion_eq (p : ℕ → ℕ) (d u : ℕ → ℕ → ℕ)
    (hp : ∀ j, 1 < p j)
    (hbase : ∀ n, u 0 n = 0)
    (hu0 : ∀ j, u j 0 = 0)
    (hd0 : ∀ j, d j 0 = 0)
    (hrec : ∀ j n, 0 < n →
      u (j + 1) n = u j n + u (j + 1) (n / p j) + d j n)
    (levels n : ℕ) : u levels n = expansion p d levels n := by
  induction levels generalizing n with
  | zero => simp [expansion, hbase]
  | succ j ih =>
      have h := ArchiveRenewalUnroll.unroll (p j) (u j) (u (j + 1)) (d j)
        (hp j) (hu0 (j + 1)) (hu0 j) (hd0 j) (hrec j) n n (le_refl n)
      rw [h, expansion, Finset.sum_add_distrib]
      congr 1
      apply Finset.sum_congr rfl
      intro k hk
      exact ih _

/-- Weighted per-cell matching, allowing any number of occurrences at one
rough block. `matching` is local to each cell, not a global weighted bound. -/
theorem occurrence_cover {ι : Type*} [DecidableEq ι]
    (cells : Finset ι) (s Q A : Finset ℕ) (N : ℕ)
    (height : ι → ℕ) (mult : ι → ℕ → ℕ) (count : ι → ℕ)
    (r : ℕ → ℕ)
    (hA : A ⊆ Icc 1 N)
    (hfree : ∀ x y z, SmoothRenewal.Triple x y z → x ∈ A → y ∈ A → z ∈ A → False)
    (hrough : ∀ q ∈ s, SmoothPartition.Rough Q q)
    (hd : ∀ q ∈ s, RenewalNext.Demand SmoothRenewal.Edge
      (SmoothRenewal.vertices Q (N / q)) (r q))
    (matching : ∀ i ∈ cells, count i = ∑ q ∈ s, mult i q)
    (allocation : ∀ q ∈ s, (∑ i ∈ cells, height i * mult i q) ≤ r q) :
    A.card + ∑ i ∈ cells, height i * count i ≤ N := by
  have hg := SmoothPartition.global_from_prefix_demands hA hfree hrough hd
  have hc : (∑ i ∈ cells, height i * count i) ≤ ∑ q ∈ s, r q := by
    calc
      (∑ i ∈ cells, height i * count i) =
          ∑ i ∈ cells, ∑ q ∈ s, height i * mult i q := by
            apply Finset.sum_congr rfl
            intro i hi
            rw [matching i hi, Finset.mul_sum]
      _ = ∑ q ∈ s, ∑ i ∈ cells, height i * mult i q := Finset.sum_comm
      _ ≤ ∑ q ∈ s, r q := Finset.sum_le_sum allocation
  omega

/-- The exact real-valued `hcover` shape expected by SumBridge. -/
theorem occurrence_hcover {ι : Type*} [DecidableEq ι]
    (cells : Finset ι) (s Q A : Finset ℕ) (N : ℕ)
    (height : ι → ℕ) (mult : ι → ℕ → ℕ) (count : ι → ℕ)
    (r : ℕ → ℕ)
    (hA : A ⊆ Icc 1 N)
    (hfree : ∀ x y z, SmoothRenewal.Triple x y z → x ∈ A → y ∈ A → z ∈ A → False)
    (hrough : ∀ q ∈ s, SmoothPartition.Rough Q q)
    (hd : ∀ q ∈ s, RenewalNext.Demand SmoothRenewal.Edge
      (SmoothRenewal.vertices Q (N / q)) (r q))
    (matching : ∀ i ∈ cells, count i = ∑ q ∈ s, mult i q)
    (allocation : ∀ q ∈ s, (∑ i ∈ cells, height i * mult i q) ≤ r q) :
    (A.card : ℝ) + ArchiveSummation.weightedCount cells
      (fun i => (height i : ℝ)) (fun i => (count i : ℝ)) ≤ N := by
  have h := occurrence_cover cells s Q A N height mult count r
    hA hfree hrough hd matching allocation
  have h' : ((A.card + ∑ i ∈ cells, height i * count i : ℕ) : ℝ) ≤ (N : ℝ) := by
    exact_mod_cast h
  unfold ArchiveSummation.weightedCount
  simpa only [Nat.cast_add, Nat.cast_sum, Nat.cast_mul] using h'

#print axioms expansion_eq
#print axioms occurrence_cover
#print axioms occurrence_hcover
end RenewalMultiplicityCandidate
