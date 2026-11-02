import ArchiveErrorMatchCandidate

/-! Specialization removes only the indexed error matching premise.
The separate gain and cover hypotheses remain. -/
namespace ArchiveLedgerSumBridge

theorem indexed_endpoint_no_error (N : ℕ) (f : ℝ)
    (ha : ∀ i : Index, 0 < cellA i)
    (hb : ∀ i : Index, 0 < cellB i)
    (hLU : ∀ i : Index, N / cellB i ≤ N / cellA i)
    (hprime : ∀ i : Index, ∀ p ∈ cellPrimes i, Nat.Prime p)
    (hrho : ∀ i : Index, 0 ≤ ArchiveSumBridge.density (cellPrimes i) ∧
      ArchiveSumBridge.density (cellPrimes i) ≤ 1)
    (hbudget : ∀ i : Index, (2 : ℝ) ^ (cellPrimes i).card ≤
      (2 : ℝ) ^ cellExponent i)
    (hgain : ArchiveSummation.weightedIdeal Finset.univ cellHeight
      (fun i => (N : ℝ) * ArchiveSumBridge.density (cellPrimes i) *
        (1 / (cellA i : ℝ) - 1 / (cellB i : ℝ))) = (N : ℝ) * (ledgerGain : ℝ))
    (hcover : f + ArchiveSummation.weightedCount Finset.univ cellHeight
      (fun i => (ArchiveSummation.cellCount N (cellA i) (cellB i)
        (fun q => Nat.Coprime q (∏ p ∈ cellPrimes i, p)) : ℝ)) ≤ N) :
    f ≤ (ArchiveLedger.targetC : ℝ) * (N : ℝ) + 55064831540 := by
  apply conditional_indexed_endpoint N f ha hb hLU hprime hrho hbudget hgain
  · exact ArchiveErrorMatchCandidate.indexed_error.trans ledger_error_real.symm
  · exact hcover

#print axioms indexed_endpoint_no_error
end ArchiveLedgerSumBridge
