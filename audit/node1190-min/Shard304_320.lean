import DenseData

namespace Node1190Min
set_option maxRecDepth 100000
set_option maxHeartbeats 100000000
theorem Shard304_320 : ∀ i, 304 ≤ i → i < 320 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := by
  intro i hlo hhi
  interval_cases i <;> decide
#print axioms Shard304_320
end Node1190Min
