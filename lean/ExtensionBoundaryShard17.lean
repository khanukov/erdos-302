import ExtensionBoundaryData

namespace ExtensionFirstArchive
open Finset ExtensionSeedCandidate

set_option maxRecDepth 100000 in
set_option maxHeartbeats 100000000 in
 theorem shard17 : ∀ b ∈ source.filter (fun x => 1700 ≤ x ∧ x < 1800),
    ∀ c ∈ source, b < c →
      let a := b * c / (b + c)
      a ∈ source → 0 < a → a < b → b * c = a * (b + c) →
      (a ∈ target ∧ b ∈ target ∧ c ∈ target) ∨
        (a ∈ firstDelete ∨ b ∈ firstDelete ∨ c ∈ firstDelete) := by
  decide

#print axioms shard17
end ExtensionFirstArchive
