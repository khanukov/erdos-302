import SuffixBijectionCandidate

/-! Interface checks only; this file has not been Lean checked. -/
open SuffixBijectionCandidate

example (P S : Finset ℕ) (m : ℕ)
    (hdis : Disjoint P S) (hm : SmoothPartition.Rough P m) :
    ∃ q t : ℕ, SmoothPartition.Rough (P ∪ S) q ∧
      0 < t ∧ SmoothRenewal.Smooth S t ∧ m = q * t ∧
      ∀ q' t', SmoothPartition.Rough (P ∪ S) q' →
        0 < t' → SmoothRenewal.Smooth S t' → m = q' * t' →
        q' = q ∧ t' = t :=
  split_exists_unique P S m hdis hm

example (P S : Finset ℕ) (q t : ℕ) (hdis : Disjoint P S)
    (hq : SmoothPartition.Rough (P ∪ S) q) (ht : 0 < t)
    (hs : SmoothRenewal.Smooth S t) : SmoothPartition.Rough P (q*t) :=
  product_prefix_rough P S q t hdis hq ht hs
