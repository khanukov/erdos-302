import SmoothExistence
import RoughCoprime
import CellEquivalence
import Summation

/-! Candidate: NOT Lean checked.  No archive cell-count equality is assumed.
Prefix and suffix are disjoint sets; they need not be ordered for this lemma.
The archive must independently establish that its indexed prime lists give these
sets and satisfy the stated hypotheses. -/
namespace SuffixBijectionCandidate
open Finset

/-- Every positive prefix-rough number has a unique full-rough times
suffix-smooth decomposition. The inverse is extraction of the suffix part,
using `decomposition_exists`; uniqueness makes the choice canonical. -/
theorem split_exists_unique (P S : Finset ℕ) (m : ℕ)
    (hdis : Disjoint P S) (hm : SmoothPartition.Rough P m) :
    ∃ q t : ℕ, SmoothPartition.Rough (P ∪ S) q ∧
      0 < t ∧ SmoothRenewal.Smooth S t ∧ m = q * t ∧
      ∀ q' t', SmoothPartition.Rough (P ∪ S) q' →
        0 < t' → SmoothRenewal.Smooth S t' → m = q' * t' →
        q' = q ∧ t' = t := by
  classical
  obtain ⟨q, t, hq, ht, hs, heq⟩ := SmoothPartition.decomposition_exists S m hm.1
  have hqP : SmoothPartition.Rough P q := by
    refine ⟨hq.1, ?_⟩
    intro p hp hpP hd
    apply hm.2 p hp hpP
    rw [heq]
    exact dvd_mul_of_dvd_left hd t
  have hqAll : SmoothPartition.Rough (P ∪ S) q := by
    refine ⟨hq.1, ?_⟩
    intro p hp hpAll hd
    rcases Finset.mem_union.mp hpAll with hpP | hpS
    · exact hqP.2 p hp hpP hd
    · exact hq.2 p hp hpS hd
  refine ⟨q, t, hqAll, ht, hs, heq, ?_⟩
  intro q' t' hq' ht' hs' heq'
  have hq'S : SmoothPartition.Rough S q' := by
    refine ⟨hq'.1, ?_⟩
    intro p hp hpS hd
    exact hq'.2 p hp (Finset.mem_union_right P hpS) hd
  exact SmoothPartition.decomposition_unique hq'S hq ht' ht hs' hs
    (heq'.symm.trans heq)

/-- The forward product is prefix-rough, relying on disjointness of the
prime sets (and not on an assumed global counting identity). -/
theorem product_prefix_rough (P S : Finset ℕ) (q t : ℕ)
    (hdis : Disjoint P S) (hq : SmoothPartition.Rough (P ∪ S) q)
    (ht : 0 < t) (hs : SmoothRenewal.Smooth S t) :
    SmoothPartition.Rough P (q * t) := by
  refine ⟨Nat.mul_pos hq.1 ht, ?_⟩
  intro p hp hpP hd
  rcases hp.dvd_mul.mp hd with hdq | hdt
  · exact hq.2 p hp (Finset.mem_union_left S hpP) hdq
  · have hpS := hs p hp hdt
    exact (Finset.disjoint_left.mp hdis) hpP hpS

/-- The local occurrence multiplicity. Each distinct suffix-smooth factor t
is counted, not collapsed to a Boolean. -/
noncomputable def multiplicity (S : Finset ℕ) (N a b q : ℕ) : ℕ := by
  classical
  exact ((Icc 1 (N / q)).filter (fun t =>
    SmoothRenewal.Smooth S t ∧ a ≤ N / (q * t) ∧ N / (q * t) < b)).card

/-- The final-rough indices for which multiplicity is summed. -/
noncomputable def indices (P S : Finset ℕ) (N : ℕ) : Finset ℕ := by
  classical
  exact (Icc 1 N).filter (SmoothPartition.Rough (P ∪ S))

/-- Precise *unproved* target. `cellCount` uses the actual earlier-product
coprimality predicate. No equality is an input to this proposition. -/
noncomputable def CellCountIdentity (P S : Finset ℕ) (N a b : ℕ) : Prop := by
  classical
  exact ArchiveSummation.cellCount N a b
      (fun m => Nat.Coprime m (∏ p ∈ P, p)) =
    ∑ q ∈ indices P S N, multiplicity S N a b q

/-- Explicit inverse on positive inputs, choosing the suffix decomposition.
Only the suffix split is chosen; the prefix-rough proof supplies full roughness. -/
noncomputable def suffixSplit (S : Finset ℕ) (m : ℕ) (hm : 0 < m) : ℕ × ℕ := by
  classical
  let h := SmoothPartition.decomposition_exists S m hm
  exact (Classical.choose h, Classical.choose (Classical.choose_spec h))

#print axioms split_exists_unique
end SuffixBijectionCandidate
