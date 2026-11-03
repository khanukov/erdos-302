import DenseData

namespace Node1190Min
set_option maxRecDepth 100000
set_option maxHeartbeats 100000000
theorem Shard008_009 : ∀ i, 8 ≤ i → i < 9 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := by
  intro i hlo hhi
  interval_cases i <;> decide
#print axioms Shard008_009
end Node1190Min
