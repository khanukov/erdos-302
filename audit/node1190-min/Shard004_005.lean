import DenseData

namespace Node1190Min
set_option maxRecDepth 100000
set_option maxHeartbeats 100000000
theorem Shard004_005 : ∀ i, 4 ≤ i → i < 5 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := by
  intro i hlo hhi
  interval_cases i
  change MixedCaseTrimCandidate.CaseCheck Node1209Dense.nodes 4 _ _
  unfold MixedCaseTrimCandidate.CaseCheck MixedCaseTrimCandidate.RefCheck MixedCaseTrimCandidate.row MixedCaseTrimCandidate.image Node1209Dense.nodes
  constructor
  · decide
  · repeat' rw [BankCase.check]
    decide
#print axioms Shard004_005
end Node1190Min
