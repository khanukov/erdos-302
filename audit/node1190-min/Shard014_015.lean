import DenseData

namespace Node1190Min
set_option maxRecDepth 100000
set_option maxHeartbeats 100000000
theorem Shard014_015 : ∀ i, 14 ≤ i → i < 15 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := by
  intro i hlo hhi
  interval_cases i <;> decide
#print axioms Shard014_015
end Node1190Min
