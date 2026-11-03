import JointIndependenceCandidate

/-! Proposed closed N=6 literal instance. UNCOMPILED: see audit/JOINT_SIX_CANDIDATE.md. -/
namespace JointSixCandidate
open Finset JointIndependenceCandidate LiteralFactorMatchingCandidate
open scoped Classical

set_option maxRecDepth 100000
set_option maxHeartbeats 0

/-- Actual 4705-occurrence sum, not a transcribed list of numbers. -/
theorem literal_weight : (∑ i : Fin 4705, height i * mult 6 i 1) = 1 := by
  classical
  norm_num [height, mult, SuffixBijectionCandidate.multiplicity,
    SmoothRenewal.Smooth, S, P, Q, a, b, idx,
    ArchiveLedgerSumBridge.entry, ArchiveLedgerSumBridge.cellA,
    ArchiveLedgerSumBridge.cellB, ArchiveLedgerSumBridge.cellPrimes,
    ArchiveLedgerSumBridge.entries, ArchiveLedgerSumBridge.entriesFrom,
    ArchiveLedger.ledger, ArchiveLedger.primes]

/-- The edge {2,3,6} lies in the actual smooth vertex set. -/
theorem edge_in_vertices : ({2,3,6} : Finset ℕ) ⊆ SmoothRenewal.vertices Q 6 := by
  classical
  intro x hx
  simp only [Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl <;>
    simp only [SmoothRenewal.vertices, Finset.mem_filter, Finset.mem_Icc] <;>
    constructor <;> try omega <;>
    (intro p hp hd
     have hp6 : p ≤ 6 := Nat.le_of_dvd (by omega) hd
     have hp2 := hp.two_le
     interval_cases p <;> norm_num [Q, ArchiveLedger.primes] at *)

theorem concrete_edge : SmoothRenewal.Edge ({2,3,6} : Finset ℕ) := by
  exact ⟨2, 3, 6, by decide, by decide, by decide, by decide, rfl⟩

/-- Independent sets miss at least one vertex of that edge. -/
theorem independent_bound (B : Finset ℕ)
    (hBS : B ⊆ SmoothRenewal.vertices Q 6)
    (hB : Independent SmoothRenewal.Edge B) :
    B.card + 1 ≤ (SmoothRenewal.vertices Q 6).card := by
  have hne : B ≠ SmoothRenewal.vertices Q 6 := by
    intro h
    apply hB _ concrete_edge
    simpa [h] using edge_in_vertices
  have hlt : B.card < (SmoothRenewal.vertices Q 6).card :=
    Finset.card_lt_card (Finset.ssubset_iff_subset_ne.mpr ⟨hBS, hne⟩)
  omega

/-- Closed q=1 joint bound, with the full literal weight. -/
theorem joint_six (B : Finset ℕ)
    (hBS : B ⊆ SmoothRenewal.vertices Q (6 / 1))
    (hB : Independent SmoothRenewal.Edge B) :
    B.card + (∑ i : Fin 4705, height i * mult 6 i 1) ≤
      (SmoothRenewal.vertices Q (6 / 1)).card := by
  rw [literal_weight]
  simpa using independent_bound B hBS hB

#print axioms literal_weight
#print axioms edge_in_vertices
#print axioms concrete_edge
#print axioms independent_bound
#print axioms joint_six
end JointSixCandidate
