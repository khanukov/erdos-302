import GraphDemandSeedSoundCandidate
import SmoothRenewal

/-! The concrete n=6 bound on the actual positive smooth vertex set. -/
namespace GraphDemandSmoothSix
open Finset UpperBridge
open scoped Classical

/-- Smooth zero is impossible here: 5 is a prime divisor of zero, but not in Q. -/
theorem positive_of_smooth {x : ℕ}
    (hx : UpperProjection.Smooth ({2, 3} : Finset ℕ) x) : 0 < x := by
  by_contra h
  have hz : x = 0 := Nat.eq_zero_of_not_pos h
  have h5 : 5 ∈ ({2, 3} : Finset ℕ) := hx 5 (by decide) (by simp [hz])
  have h5not : 5 ∉ ({2, 3} : Finset ℕ) := by decide
  exact h5not h5

/-- Instantiate the checked seed maximum on the real smooth vertex set. -/
theorem seed_max_bound :
    Extended.Bound (SmoothRenewal.vertices {2, 3} 6)
      (GraphDemandSeedSoundCandidate.seedMax ArchiveSeedNode0.nodes 1 {2, 3} 6) := by
  apply GraphDemandSeedSoundCandidate.seedMax_bound
    ArchiveSeedNode0.nodes 1 BankProfileConcrete.valid {2, 3} 6
    (SmoothRenewal.vertices {2, 3} 6)
  intro x hx hle
  have hp : 0 < x := positive_of_smooth hx
  exact Finset.mem_filter.mpr ⟨Finset.mem_Icc.mpr ⟨hp, hle⟩, hx⟩

/-- Closed semantic bound: no arbitrary ambient set or embedding assumption. -/
theorem bound_one : Extended.Bound (SmoothRenewal.vertices {2, 3} 6) 1 := by
  simpa only [GraphDemandSeedSoundCandidate.first_cell_positive] using seed_max_bound

/-- The archived first-cell seed agrees at this one point. -/
theorem archived_bound : Extended.Bound (SmoothRenewal.vertices {2, 3} 6)
    (SeedMaxFirstCellCandidate.seed 6) := by
  rw [SeedMaxFirstCellCandidate.first_seed.2]
  exact bound_one

#print axioms positive_of_smooth
#print axioms seed_max_bound
#print axioms bound_one
#print axioms archived_bound
end GraphDemandSmoothSix
