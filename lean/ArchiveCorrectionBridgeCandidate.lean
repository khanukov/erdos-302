import LiteralFactorMatchingCandidate
import RenewalConcreteOccurrence

/-! Candidate bridge, not a proof of the archive profile recurrence or of the
suffix-factor/occurrence correspondence. Cell indices are positions, so equal
cell values at distinct positions are retained. -/
namespace ArchiveCorrectionBridgeCandidate
open Finset RenewalOccurrenceIndex LiteralFactorMatchingCandidate
open scoped Classical

/-- A correction interval belongs to the level determined by its prior list. -/
def level (i : Fin 4705) : ℕ := (ArchiveLedgerSumBridge.entry (idx i)).prior.length

def hit (o : Occurrence) (i : Fin 4705) : ℕ :=
  if level i = o.level ∧ a i ≤ o.arg ∧ o.arg < b i then 1 else 0

/-- The literal step function, with one summand per ledger position. -/
noncomputable def correction (j x : ℕ) : ℕ :=
  ∑ i : Fin 4705, height i *
    (if level i = j ∧ a i ≤ x ∧ x < b i then 1 else 0)

theorem correction_at_occurrence (o : Occurrence) :
    correction o.level o.arg = ∑ i ∈ (Finset.univ : Finset (Fin 4705)), height i * hit o i := by
  rfl

theorem correction_zero (j : ℕ) : correction j 0 = 0 := by
  simp only [correction]
  apply Finset.sum_eq_zero
  intro i hi
  have h := a_pos i
  simp [show ¬ a i ≤ 0 by omega]

/-- The joint allocation follows if the actual suffix-factor multiplicity
matches the occurrence count for every cell. `u` must satisfy the recurrence
with this exact literal correction, not an arbitrary correction function. -/
theorem literal_allocation (N q levels : ℕ) (p : ℕ → ℕ)
    (u : ℕ → ℕ → ℕ) (r : ℕ)
    (hp : ∀ j, 1 < p j)
    (hbase : ∀ x, u 0 x = 0)
    (hu0 : ∀ j, u j 0 = 0)
    (hrec : ∀ j x, 0 < x → u (j + 1) x =
      u j x + u (j + 1) (x / p j) + correction j x)
    (hmatch : ∀ i : Fin 4705, mult N i q =
      RenewalConcreteOccurrence.multiplicity (occurrences p levels (N / q)) hit i)
    (hbound : u levels (N / q) ≤ r) :
    (∑ i : Fin 4705, height i * mult N i q) ≤ r := by
  have h := RenewalConcreteOccurrence.allocation (Finset.univ : Finset (Fin 4705))
    hit height p correction u levels (N / q) r hp hbase hu0 correction_zero hrec
    (by intro o ho; exact correction_at_occurrence o) hbound
  simpa only [← hmatch] using h

/-- Integration with the literal cover; graph demand and the exact factor
matching are still independent premises. -/
theorem literal_hcover_of_recurrence (N levels : ℕ) (A : Finset ℕ)
    (p : ℕ → ℕ) (u : ℕ → ℕ → ℕ) (r : ℕ → ℕ)
    (hA : A ⊆ Icc 1 N)
    (hfree : ∀ x y z, SmoothRenewal.Triple x y z → x ∈ A → y ∈ A → z ∈ A → False)
    (hd : ∀ q ∈ support N, RenewalNext.Demand SmoothRenewal.Edge
      (SmoothRenewal.vertices Q (N / q)) (r q))
    (hp : ∀ j, 1 < p j) (hbase : ∀ x, u 0 x = 0)
    (hu0 : ∀ j, u j 0 = 0)
    (hrec : ∀ j x, 0 < x → u (j + 1) x =
      u j x + u (j + 1) (x / p j) + correction j x)
    (hmatch : ∀ q ∈ support N, ∀ i : Fin 4705, mult N i q =
      RenewalConcreteOccurrence.multiplicity (occurrences p levels (N / q)) hit i)
    (hbound : ∀ q ∈ support N, u levels (N / q) ≤ r q) :
    (A.card : ℝ) + ArchiveSummation.weightedCount Finset.univ
      (fun i : Fin 4705 => (height i : ℝ)) (fun i => (count N i : ℝ)) ≤ N := by
  apply literal_hcover N A r hA hfree hd
  intro q hq
  exact literal_allocation N q levels p u (r q) hp hbase hu0 hrec (hmatch q hq) (hbound q hq)

#print axioms correction_at_occurrence
#print axioms correction_zero
#print axioms literal_allocation
#print axioms literal_hcover_of_recurrence
end ArchiveCorrectionBridgeCandidate
