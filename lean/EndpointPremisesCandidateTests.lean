import EndpointPremisesCandidate

open ArchiveLedgerSumBridge EndpointPremisesCandidate

example (i : Index) : 0 < cellA i ∧ cellA i < cellB i ∧ 0 < cellB i :=
  ⟨indexed_a_pos i, indexed_a_lt_b i, indexed_b_pos i⟩

example (i : Index) : 0 / cellB i ≤ 0 / cellA i := indexed_quotient_order 0 i
example (N : ℕ) (i : Index) : N / cellB i ≤ N / cellA i := indexed_quotient_order N i
example (i : Index) : ∀ p ∈ cellPrimes i, Nat.Prime p := indexed_prime i
example (i : Index) : 0 ≤ ArchiveSumBridge.density (cellPrimes i) ∧
    ArchiveSumBridge.density (cellPrimes i) ≤ 1 := indexed_density_bounds i
example (i : Index) : (2 : ℝ) ^ (cellPrimes i).card ≤ (2 : ℝ) ^ cellExponent i :=
  indexed_budget i

-- Check that the finite predicates reject malformed sample inputs.
example : ¬ (0 < (0 : ℕ) ∧ (0 : ℕ) < 4) := by decide
example : ¬ (0 < (4 : ℕ) ∧ (4 : ℕ) < 4) := by decide
example : ¬ Nat.Prime 1 := by decide
example : ¬ Nat.Prime 9 := by decide

example (N : ℕ) (f : ℝ)
    (hcover : f + ArchiveSummation.weightedCount Finset.univ cellHeight
      (fun i => (ArchiveSummation.cellCount N (cellA i) (cellB i)
        (fun q => Nat.Coprime q (∏ p ∈ cellPrimes i, p)) : ℝ)) ≤ N) :
    f ≤ (ArchiveLedger.targetC : ℝ) * (N : ℝ) + 55064831540 :=
  endpoint_of_cover N f hcover

#print axioms EndpointPremisesCandidate.endpoint_of_cover
