import ExtensionBoundaryData

namespace ExtensionFirstArchive
open Finset ExtensionSeedCandidate

set_option maxRecDepth 100000 in
set_option maxHeartbeats 100000000 in
 theorem shard05 : ∀ b ∈ source.filter (fun x => 500 ≤ x ∧ x < 600),
    ∀ c ∈ source, b < c →
      let a := b * c / (b + c)
      a ∈ source → 0 < a → a < b → b * c = a * (b + c) →
      (a ∈ target ∧ b ∈ target ∧ c ∈ target) ∨
        (a ∈ firstDelete ∨ b ∈ firstDelete ∨ c ∈ firstDelete) := by
  decide

#print axioms shard05
end ExtensionFirstArchive
