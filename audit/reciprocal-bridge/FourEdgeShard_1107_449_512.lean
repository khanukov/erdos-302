import FourEdgeUniversesCandidate

set_option maxRecDepth 100000
set_option maxHeartbeats 80000000
namespace FourExternal

theorem edges_1107_449_512 :
    ∀ b ∈ (Finset.Icc 449 512), ∀ c ∈ universe_1107,
      b ∈ universe_1107 → b < c →
      let a := b * c / (b + c)
      a ∈ universe_1107 → b * c = a * (b + c) →
      a ∈ active_1107 ∧ b ∈ active_1107 ∧ c ∈ active_1107 := by
  decide +kernel

#print axioms edges_1107_449_512

end FourExternal
