import FourEdgeUniversesCandidate

set_option maxRecDepth 100000
set_option maxHeartbeats 80000000
namespace FourExternal

theorem edges_1097_257_320 :
    ∀ b ∈ (Finset.Icc 257 320), ∀ c ∈ universe_1097,
      b ∈ universe_1097 → b < c →
      let a := b * c / (b + c)
      a ∈ universe_1097 → b * c = a * (b + c) →
      a ∈ active_1097 ∧ b ∈ active_1097 ∧ c ∈ active_1097 := by
  decide +kernel

#print axioms edges_1097_257_320

end FourExternal
