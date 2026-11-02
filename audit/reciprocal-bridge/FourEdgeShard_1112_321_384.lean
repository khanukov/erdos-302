import FourEdgeUniversesCandidate

set_option maxRecDepth 100000
set_option maxHeartbeats 80000000
namespace FourExternal

theorem edges_1112_321_384 :
    ∀ b ∈ (Finset.Icc 321 384), ∀ c ∈ universe_1112,
      b ∈ universe_1112 → b < c →
      let a := b * c / (b + c)
      a ∈ universe_1112 → b * c = a * (b + c) →
      a ∈ active_1112 ∧ b ∈ active_1112 ∧ c ∈ active_1112 := by
  decide +kernel

#print axioms edges_1112_321_384

end FourExternal
