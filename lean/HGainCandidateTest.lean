import HGainCandidate

open HGainCandidate ArchiveLedgerSumBridge

example (N : ℕ) : ArchiveSummation.weightedIdeal Finset.univ cellHeight
    (fun i => (N : ℝ) * ArchiveSumBridge.density (cellPrimes i) *
      (1 / (cellA i : ℝ) - 1 / (cellB i : ℝ))) =
    (N : ℝ) * (ledgerGain : ℝ) := indexed_hgain N

-- Two equal values contribute twice; this is a positional sum, not a set.
example : (∑ i : Fin ([3, 3] : List ℚ).length, ([3, 3] : List ℚ)[i]) = 6 := by
  norm_num [Fin.sum_univ_succ]

example : (∑ i : Fin ([] : List ℚ).length, ([] : List ℚ)[i]) = 0 := by simp

#print axioms HGainCandidate.indexed_hgain
