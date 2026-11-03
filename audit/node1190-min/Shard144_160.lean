import DenseData

namespace Node1190Min
set_option maxRecDepth 100000
set_option maxHeartbeats 100000000
theorem Shard144_160 : ∀ i, 144 ≤ i → i < 160 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := by
  intro i hlo hhi
  interval_cases i <;> decide
#print axioms Shard144_160
end Node1190Min
