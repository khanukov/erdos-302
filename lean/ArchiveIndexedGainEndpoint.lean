import ArchiveIndexedEndpoint
import HGainCandidate

/-! Specialization discharges gain and error, not the cover hypothesis. -/
namespace ArchiveLedgerSumBridge

theorem indexed_endpoint_no_error_no_gain (N : ℕ) (f : ℝ)
    (ha : ∀ i : Index, 0 < cellA i)
    (hb : ∀ i : Index, 0 < cellB i)
    (hLU : ∀ i : Index, N / cellB i ≤ N / cellA i)
    (hprime : ∀ i : Index, ∀ p ∈ cellPrimes i, Nat.Prime p)
    (hrho : ∀ i : Index, 0 ≤ ArchiveSumBridge.density (cellPrimes i) ∧
      ArchiveSumBridge.density (cellPrimes i) ≤ 1)
    (hbudget : ∀ i : Index, (2 : ℝ) ^ (cellPrimes i).card ≤
      (2 : ℝ) ^ cellExponent i)
    (hcover : f + ArchiveSummation.weightedCount Finset.univ cellHeight
      (fun i => (ArchiveSummation.cellCount N (cellA i) (cellB i)
        (fun q => Nat.Coprime q (∏ p ∈ cellPrimes i, p)) : ℝ)) ≤ N) :
    f ≤ (ArchiveLedger.targetC : ℝ) * (N : ℝ) + 55064831540 := by
  exact indexed_endpoint_no_error N f ha hb hLU hprime hrho hbudget
    (HGainCandidate.indexed_hgain N) hcover

#print axioms indexed_endpoint_no_error_no_gain
end ArchiveLedgerSumBridge
