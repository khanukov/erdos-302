import RenewalMultiplicityCandidate

/-! Candidate tests; hosted compilation is required before claiming success. -/
open Finset RenewalMultiplicityCandidate

example : expansion (fun _ => 3) (fun _ n => if 0 < n then 1 else 0) 1 3 = 2 := by decide
example : expansion (fun _ => 3) (fun _ n => if 0 < n then 1 else 0) 2 3 = 5 := by decide
example : expansion (fun _ => 3) (fun _ n => if 0 < n then 1 else 0) 20 0 = 0 := by decide
example : expansion (fun _ => 3) (fun _ n => if 0 < n then 1 else 0) 0 5 = 0 := by decide

-- Two cells overlap at the same block; one has two occurrences there.
private def cells : Finset ℕ := {0, 1}
private def blocks : Finset ℕ := {1}
private def height (_ : ℕ) : ℕ := 1
private def mult (i q : ℕ) : ℕ := if q = 1 then (if i = 0 then 2 else 1) else 0
private def count (i : ℕ) : ℕ := if i = 0 then 2 else 1

example : (∑ i ∈ cells, height i * mult i 1) = 3 := by decide
example : ∀ i ∈ cells, count i = ∑ q ∈ blocks, mult i q := by decide
-- Both separate bounds hold, but their sum cannot fit demand 2.
example : mult 0 1 ≤ 2 ∧ mult 1 1 ≤ 2 := by decide
example : ¬ ((∑ i ∈ cells, height i * mult i 1) ≤ 2) := by decide
example : ¬ (2 = ∑ q ∈ blocks, mult 1 q) := by decide

-- Exercise the cover itself with genuinely nonzero overlapping allocations.
-- Graph demand and roughness are explicit assumptions, not fabricated certificates.
example (Q A : Finset ℕ)
    (hA : A ⊆ Icc 1 3)
    (hf : ∀ x y z, SmoothRenewal.Triple x y z → x ∈ A → y ∈ A → z ∈ A → False)
    (hr : ∀ q ∈ blocks, SmoothPartition.Rough Q q)
    (hd : ∀ q ∈ blocks, RenewalNext.Demand SmoothRenewal.Edge
      (SmoothRenewal.vertices Q (3 / q)) 3) :
    A.card + 3 ≤ 3 := by
  have h := occurrence_cover cells blocks Q A 3 height mult count (fun _ => 3)
    hA hf hr hd (by decide) (by decide)
  have hv : (∑ i ∈ cells, height i * count i) = 3 := by decide
  simpa only [hv] using h

-- The real-valued bridge retains the same nonzero overlapping allocation.
example (Q A : Finset ℕ)
    (hA : A ⊆ Icc 1 3)
    (hf : ∀ x y z, SmoothRenewal.Triple x y z → x ∈ A → y ∈ A → z ∈ A → False)
    (hr : ∀ q ∈ blocks, SmoothPartition.Rough Q q)
    (hd : ∀ q ∈ blocks, RenewalNext.Demand SmoothRenewal.Edge
      (SmoothRenewal.vertices Q (3 / q)) 3) :
    (A.card : ℝ) + ArchiveSummation.weightedCount cells
      (fun i => (height i : ℝ)) (fun i => (count i : ℝ)) ≤ (3 : ℝ) := by
  exact occurrence_hcover cells blocks Q A 3 height mult count (fun _ => 3)
    hA hf hr hd (by decide) (by decide)
