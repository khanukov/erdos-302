import DenseData

namespace Node1190Min
set_option maxRecDepth 100000
set_option maxHeartbeats 100000000
theorem Shard000_004 : ∀ i, 0 ≤ i → i < 4 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := by
  intro i hlo hhi
  interval_cases i <;> decide
#print axioms Shard000_004
end Node1190Min
