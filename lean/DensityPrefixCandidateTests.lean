import DensityPrefixCandidate
open DensityPrefixCandidate

-- Exercise the implicit take length, including beyond the literal list length.
example (k : ℕ) : (primePrefix k).Nodup := all_prefixes_nodup k
example : (primePrefix 100).Nodup := all_prefixes_nodup 100

-- Both ends of the finite rational-prefix range are covered by the theorem.
example : prefixFold 0 = prefixProduct 0 := rational_prefixes 0 (by decide)
example : prefixFold 20 = prefixProduct 20 := rational_prefixes 20 (by decide)

example : primePrefix 0 = [] := by decide
example : primePrefix 2 = [3, 2] := by decide
example : prefixFold 2 = (1 : ℚ) / 3 := by decide +kernel
example : prefixProduct 2 = (1 : ℚ) / 3 := by decide +kernel
example : ((prefixFold 2 : ℚ) : ℝ) =
    ArchiveSumBridge.density (primePrefix 2).toFinset := by
  apply real_prefix
  decide

-- Converting a repeated prefix to a Finset loses multiplicity.
example : ([3, 3] : List ℕ).foldl update 1 ≠
    ∏ p ∈ ([3, 3] : List ℕ).toFinset, factor p := by decide +kernel

-- Duplicate cells remain separate list occurrences.
example :
    ArchiveLedgerSumBridge.entriesFrom []
      [⟨3, [⟨6, 24, 1⟩, ⟨6, 24, 1⟩]⟩] =
      [⟨[], ⟨6, 24, 1⟩⟩, ⟨[], ⟨6, 24, 1⟩⟩] := by decide

example (i : ArchiveLedgerSumBridge.Index) :
    (((ArchiveLedgerSumBridge.entry i).prior.foldl update 1 : ℚ) : ℝ) =
      ArchiveSumBridge.density (ArchiveLedgerSumBridge.cellPrimes i) :=
  indexed_density_direct i

#print axioms indexed_density
#print axioms indexed_density_direct
