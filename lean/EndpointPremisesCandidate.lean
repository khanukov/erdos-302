import ArchiveIndexedEndpoint
import HGainCandidate

/-! Hosted-check candidate. The checks concern generated ledger literals, not
archive-byte provenance or the independent global block/renewal cover. -/
namespace EndpointPremisesCandidate
open ArchiveLedgerSumBridge DensityPrefixCandidate

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem literal_cell_bounds :
    ∀ e ∈ entries, 0 < e.cell.a ∧ e.cell.a < e.cell.b := by
  decide +kernel

theorem indexed_a_pos (i : Index) : 0 < cellA i :=
  (literal_cell_bounds (entry i) (List.get_mem entries i)).1

theorem indexed_a_lt_b (i : Index) : cellA i < cellB i :=
  (literal_cell_bounds (entry i) (List.get_mem entries i)).2

theorem indexed_b_pos (i : Index) : 0 < cellB i :=
  lt_trans (indexed_a_pos i) (indexed_a_lt_b i)

theorem indexed_quotient_order (N : ℕ) (i : Index) :
    N / cellB i ≤ N / cellA i :=
  Nat.div_le_div_left (Nat.le_of_lt (indexed_a_lt_b i)) (indexed_a_pos i)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem literal_prefix_inputs :
    ∀ k ∈ Finset.range 21,
      (∀ p ∈ primePrefix k, Nat.Prime p) ∧
      (primePrefix k).toFinset.card ≤ (primePrefix k).length + 1 ∧
      0 ≤ prefixFold k ∧ prefixFold k ≤ 1 := by
  decide +kernel

theorem indexed_prime (i : Index) : ∀ p ∈ cellPrimes i, Nat.Prime p := by
  obtain ⟨k, hk, hp, _⟩ := indexed_density i
  intro p h
  have hp' : p ∈ primePrefix k := by
    simpa [cellPrimes, hp] using h
  exact (literal_prefix_inputs k hk).1 p hp'

theorem indexed_density_bounds (i : Index) :
    0 ≤ ArchiveSumBridge.density (cellPrimes i) ∧
      ArchiveSumBridge.density (cellPrimes i) ≤ 1 := by
  obtain ⟨k, hk, _, hd⟩ := indexed_density i
  have h := (literal_prefix_inputs k hk).2.2
  constructor
  · rw [← hd]
    exact_mod_cast h.1
  · rw [← hd]
    exact_mod_cast h.2

theorem indexed_budget (i : Index) :
    (2 : ℝ) ^ (cellPrimes i).card ≤ (2 : ℝ) ^ cellExponent i := by
  obtain ⟨k, hk, hp, _⟩ := indexed_density i
  have h := (literal_prefix_inputs k hk).2.1
  apply pow_le_pow_right₀ (by norm_num : (1 : ℝ) ≤ 2)
  simpa [cellPrimes, cellExponent, hp] using h

/-- All analytic inputs are derived from literal data. The sole hypothesis is
still the independent weighted global cover; this is not an unconditional bound. -/
theorem endpoint_of_cover (N : ℕ) (f : ℝ)
    (hcover : f + ArchiveSummation.weightedCount Finset.univ cellHeight
      (fun i => (ArchiveSummation.cellCount N (cellA i) (cellB i)
        (fun q => Nat.Coprime q (∏ p ∈ cellPrimes i, p)) : ℝ)) ≤ N) :
    f ≤ (ArchiveLedger.targetC : ℝ) * (N : ℝ) + 55064831540 := by
  exact indexed_endpoint_no_error N f indexed_a_pos indexed_b_pos
    (indexed_quotient_order N) indexed_prime indexed_density_bounds indexed_budget
    (HGainCandidate.indexed_hgain N) hcover

#print axioms literal_cell_bounds
#print axioms literal_prefix_inputs
#print axioms indexed_a_pos
#print axioms indexed_a_lt_b
#print axioms indexed_b_pos
#print axioms indexed_quotient_order
#print axioms indexed_prime
#print axioms indexed_density_bounds
#print axioms indexed_budget
#print axioms endpoint_of_cover
end EndpointPremisesCandidate
