import FourEdgeUniversesCandidate

set_option maxRecDepth 100000
set_option maxHeartbeats 80000000
namespace FourExternal

theorem edges_1114_449_512 :
    ∀ b ∈ (Finset.Icc 449 512), ∀ c ∈ universe_1114,
      b ∈ universe_1114 → b < c →
      let a := b * c / (b + c)
      a ∈ universe_1114 → b * c = a * (b + c) →
      a ∈ active_1114 ∧ b ∈ active_1114 ∧ c ∈ active_1114 := by
  decide +kernel

#print axioms edges_1114_449_512

end FourExternal
