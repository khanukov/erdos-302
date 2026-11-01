import SumBridge

namespace ArchiveSumBridgeTest
open ArchiveSumBridge

-- Non-integral endpoints exercise the integer floor-loss condition.
example : boundaryOK 11 3 5 := by norm_num [boundaryOK]
example : boundaryOK 12 2 3 := by norm_num [boundaryOK]
example : ¬ boundaryOK 2 0 1 := by norm_num [boundaryOK]

-- Exercise the cast and positive-denominator bridge directly, including b < a.
example : (11 : ℝ) * (1 / 5 - 1 / 3) -
    (((11 / 5 : ℕ) : ℝ) - ((11 / 3 : ℕ) : ℝ)) ≤ 1 := by
  apply real_endpoint_loss_le_one 11 5 3 <;> norm_num [boundaryOK]

example (N a b : ℕ) (ha : 0 < a) (hb : 0 < b)
    (hboundary : boundaryOK N a b) :
    (N : ℝ) * (1 / (a : ℝ) - 1 / (b : ℝ)) -
      (((N / a : ℕ) : ℝ) - ((N / b : ℕ) : ℝ)) ≤ 1 :=
  real_endpoint_loss_le_one N a b ha hb hboundary

-- A nonempty prime set and nonintegral endpoints, without assuming the count bound.
example : ((11 : ℕ) : ℝ) * density ({2} : Finset ℕ) * (1 / ((3 : ℕ) : ℝ) - 1 / ((5 : ℕ) : ℝ)) - (2 : ℝ) ^ 2 ≤
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
example : ((10 : ℕ) : ℝ) * density (∅ : Finset ℕ) * (1 / ((2 : ℕ) : ℝ) - 1 / ((2 : ℕ) : ℝ)) - (2 : ℝ) ^ 1 ≤
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

-- Equality j = |S| is allowed, including a nonempty prime set.
example : ((11 : ℕ) : ℝ) * density ({2} : Finset ℕ) * (1 / ((3 : ℕ) : ℝ) - 1 / ((5 : ℕ) : ℝ)) - (2 : ℝ) ^ 1 ≤
    (ArchiveSummation.cellCount 11 3 5
      (fun q => Nat.Coprime q (∏ p ∈ ({2} : Finset ℕ), p)) : ℝ) := by
  apply cell_lower_archive 11 3 5 1 ({2} : Finset ℕ)
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

example (N a b : ℕ) (S : Finset ℕ) (ha : 0 < a) (hb : 0 < b)
    (hLU : N / b ≤ N / a) (hp : ∀ p ∈ S, Nat.Prime p)
    (hrho : 0 ≤ density S ∧ density S ≤ 1) (hboundary : boundaryOK N a b) :
    (N : ℝ) * density S * (1 / (a : ℝ) - 1 / (b : ℝ)) - (2 : ℝ) ^ S.card ≤
      (ArchiveSummation.cellCount N a b
        (fun q => Nat.Coprime q (∏ p ∈ S, p)) : ℝ) :=
  cell_lower_archive N a b S.card S ha hb hLU hp hrho hboundary le_rfl

#print axioms ArchiveSumBridge.global_upper_exact
#print axioms ArchiveSumBridge.global_upper_archive
end ArchiveSumBridgeTest
