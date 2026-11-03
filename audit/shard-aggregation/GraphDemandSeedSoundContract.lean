import GraphDemandSeedSoundCandidate

/-! Typed API contracts: these deliberately retain the strong embedding
hypothesis, and the table-to-semantic bridge is only at n = 6. -/
namespace GraphDemandSeedSoundContract
open Finset UpperBridge

theorem general_contract (nodes : ℕ → ArchiveDag.Node) (count : ℕ)
    (valid : ∀ i < count, ArchiveDag.Check nodes i)
    (Q : Finset ℕ) (n : ℕ) (W : Finset ℕ)
    (embed : ∀ x, UpperProjection.Smooth Q x → x ≤ n → x ∈ W) :
    Extended.Bound W (GraphDemandSeedSoundCandidate.seedMax nodes count Q n) :=
  GraphDemandSeedSoundCandidate.seedMax_bound nodes count valid Q n W embed

theorem positive_contract :
    GraphDemandSeedSoundCandidate.seedMax ArchiveSeedNode0.nodes 1 {2, 3} 6 = 1 :=
  GraphDemandSeedSoundCandidate.first_cell_positive

theorem archived_contract (W : Finset ℕ)
    (embed : ∀ x, UpperProjection.Smooth ({2, 3} : Finset ℕ) x → x ≤ 6 → x ∈ W) :
    Extended.Bound W (SeedMaxFirstCellCandidate.seed 6) :=
  GraphDemandSeedSoundCandidate.archived_first_cell_bound W embed

#print axioms general_contract
#print axioms positive_contract
#print axioms archived_contract
end GraphDemandSeedSoundContract
