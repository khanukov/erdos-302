import DensityPrefixCandidate
open DensityPrefixCandidate

example : prefix 0 = [] := by decide
example : prefix 2 = [3, 2] := by decide
example : prefixFold 2 = (1 : ℚ) / 3 := by decide
example : prefixProduct 2 = (1 : ℚ) / 3 := by decide
example : ((prefixFold 2 : ℚ) : ℝ) =
    ArchiveSumBridge.density (prefix 2).toFinset := by
  apply real_prefix
  decide

-- Converting a repeated prefix to a Finset loses multiplicity.
example : ([3, 3] : List ℕ).foldl update 1 ≠
    ∏ p ∈ ([3, 3] : List ℕ).toFinset, factor p := by decide

-- Duplicate cells remain separate list occurrences.
example :
    ArchiveLedgerSumBridge.entriesFrom []
      [⟨3, [⟨6, 24, 1⟩, ⟨6, 24, 1⟩]⟩] =
      [⟨[], ⟨6, 24, 1⟩⟩, ⟨[], ⟨6, 24, 1⟩⟩] := by decide

#print axioms indexed_density
