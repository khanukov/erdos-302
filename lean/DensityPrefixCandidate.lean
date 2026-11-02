import ArchiveLedgerSumBridge

/-! Candidate for hosted checking only.  This proves a finite, literal-prefix
correspondence rather than assuming a match between the two aggregate gains.
It does not prove the fold-to-sum correspondence or the archive-byte provenance.
-/
namespace DensityPrefixCandidate
open ArchiveLedgerSumBridge

-- Computable equality is needed by the finite membership checks below.
deriving instance DecidableEq for ArchiveLedgerSumBridge.Entry

def update (d : ℚ) (p : ℕ) : ℚ := d * ((p - 1 : ℕ) : ℚ) / p

def factor (p : ℕ) : ℚ := 1 - 1 / (p : ℚ)

def primePrefix (k : ℕ) : List ℕ := ArchiveLedger.primes.take k

def prefixProduct (k : ℕ) : ℚ := ∏ p ∈ (primePrefix k).toFinset, factor p

def prefixFold (k : ℕ) : ℚ := (primePrefix k).foldl update 1

/-- Finite kernel-reduction check, including the special order 3,2. -/
theorem primes_nodup : ArchiveLedger.primes.Nodup := by decide

theorem all_prefixes_nodup (k : ℕ) : (primePrefix k).Nodup := by
  exact primes_nodup.take

/-- The literal 20-level ledger yields 21 possible preceding prefixes.  This is
independent of cell equality: duplicate cells are kept as list occurrences. -/
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem entry_prefixes :
    ∀ e ∈ entries, e.prior ∈ (List.range 21).map primePrefix := by
  decide +kernel

/-- The actual rational density update agrees with the Finset product for
all 21 literal prefixes.  No generic equality is supplied as a hypothesis. -/
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem rational_prefixes :
    ∀ k ∈ Finset.range 21, prefixFold k = prefixProduct k := by
  decide +kernel

/-- Cast the actual rational product into the real-valued analytic density. -/
theorem real_prefix (k : ℕ) (hk : k ∈ Finset.range 21) :
    ((prefixFold k : ℚ) : ℝ) = ArchiveSumBridge.density (primePrefix k).toFinset := by
  rw [rational_prefixes k hk]
  simp only [prefixProduct, factor, ArchiveSumBridge.density, Rat.cast_prod,
    Rat.cast_sub, Rat.cast_one, Rat.cast_div, Rat.cast_natCast]

/-- Each actual indexed cell inherits a matching preceding-prefix density.
This is local only; summing the weighted occurrences remains a separate step. -/
theorem indexed_density (i : Index) :
    ∃ k ∈ Finset.range 21,
      (entry i).prior = primePrefix k ∧
      ((prefixFold k : ℚ) : ℝ) = ArchiveSumBridge.density (cellPrimes i) := by
  have he : entry i ∈ entries := List.get_mem entries i
  have hp := entry_prefixes (entry i) he
  obtain ⟨k, hk, hkp⟩ := List.mem_map.mp hp
  have hk' : k ∈ Finset.range 21 := by simpa using hk
  refine ⟨k, hk', hkp.symm, ?_⟩
  simpa [cellPrimes, hkp] using real_prefix k hk'

/-- Direct correspondence in the type needed by a prefix-fold instantiation. -/
theorem indexed_density_direct (i : Index) :
    (((entry i).prior.foldl update 1 : ℚ) : ℝ) =
      ArchiveSumBridge.density (cellPrimes i) := by
  obtain ⟨k, _, hp, hd⟩ := indexed_density i
  simpa [hp, prefixFold] using hd

#print axioms indexed_density_direct
#print axioms primes_nodup
#print axioms all_prefixes_nodup
#print axioms entry_prefixes
#print axioms rational_prefixes
#print axioms real_prefix
#print axioms indexed_density
end DensityPrefixCandidate
