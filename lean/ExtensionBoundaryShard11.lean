import ExtensionBoundaryData

namespace ExtensionFirstArchive
open Finset ExtensionSeedCandidate

set_option maxRecDepth 100000 in
set_option maxHeartbeats 100000000 in
 theorem shard11 : ∀ b ∈ source.filter (fun x => 1100 ≤ x ∧ x < 1200),
    ∀ c ∈ source, b < c →
      let a := b * c / (b + c)
      a ∈ source → 0 < a → a < b → b * c = a * (b + c) →
      (a ∈ target ∧ b ∈ target ∧ c ∈ target) ∨
        (a ∈ firstDelete ∨ b ∈ firstDelete ∨ c ∈ firstDelete) := by
  decide

#print axioms shard11
end ExtensionFirstArchive
