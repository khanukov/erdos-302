import SumBridge

namespace ArchiveSumBridgeTest
open ArchiveSumBridge

-- Non-integral endpoints exercise the integer floor-loss condition.
example : boundaryOK 11 3 5 := by norm_num [boundaryOK]
example : boundaryOK 12 2 3 := by norm_num [boundaryOK]

-- A nonempty prime set and nonintegral endpoints, without assuming the count bound.
example : (11 : ℝ) * density ({2} : Finset ℕ) * (1 / 3 - 1 / 5) - 4 ≤
    (ArchiveSummation.cellCount 11 3 5
      (fun q => Nat.Coprime q (∏ p ∈ ({2} : Finset ℕ), p)) : ℝ) := by
  apply cell_lower_archive 11 3 5 2 ({2} : Finset ℕ)
  · norm_num
  · norm_num
  · norm_num
  · intro p hp
    simp only [Finset.mem_singleton] at hp
    subst p
    norm_num
  · norm_num [density]
  · norm_num [boundaryOK]
  · norm_num

-- Equal endpoints are permitted and test the half-open interval convention.
example : (10 : ℝ) * density (∅ : Finset ℕ) * (1 / 2 - 1 / 2) - 2 ≤
    (ArchiveSummation.cellCount 10 2 2
      (fun q => Nat.Coprime q (∏ p ∈ (∅ : Finset ℕ), p)) : ℝ) := by
  apply cell_lower_archive 10 2 2 1 (∅ : Finset ℕ)
  · norm_num
  · norm_num
  · norm_num
  · simp
  · norm_num [density]
  · norm_num [boundaryOK]
  · norm_num

#print axioms ArchiveSumBridge.global_upper_archive
end ArchiveSumBridgeTest
