import HGainCandidate

open HGainCandidate ArchiveLedgerSumBridge

example (N : ℕ) : ArchiveSummation.weightedIdeal Finset.univ cellHeight
    (fun i => (N : ℝ) * ArchiveSumBridge.density (cellPrimes i) *
      (1 / (cellA i : ℝ) - 1 / (cellB i : ℝ))) =
    (N : ℝ) * (ledgerGain : ℝ) := indexed_hgain N

-- Multiplication is associative propositionally, but not definitionally: the
-- pointwise proof must not `change` the nested RHS into a left-associated one.
example (n g h d : ℝ) : n * (g * (h * d)) = n * g * (h * d) := by
  fail_if_success change n * g * (h * d) = n * g * (h * d)
  ring

example : ArchiveSummation.weightedIdeal Finset.univ cellHeight
    (fun i => (0 : ℝ) * ArchiveSumBridge.density (cellPrimes i) *
      (1 / (cellA i : ℝ) - 1 / (cellB i : ℝ))) = 0 := by
  simpa using indexed_hgain 0

-- Two equal values contribute twice; this is a positional sum, not a set.
example : (∑ i : Fin ([3, 3] : List ℚ).length, ([3, 3] : List ℚ)[i]) = 6 := by
  norm_num [Fin.sum_univ_succ]

example : (∑ i : Fin ([] : List ℚ).length, ([] : List ℚ)[i]) = 0 := by simp

#print axioms HGainCandidate.indexed_hgain
