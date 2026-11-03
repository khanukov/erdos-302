import DenseData

namespace Node1190Min
set_option maxRecDepth 100000
set_option maxHeartbeats 100000000
theorem Shard007_008 : ∀ i, 7 ≤ i → i < 8 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := by
  intro i hlo hhi
  interval_cases i
  change MixedCaseTrimCandidate.CaseCheck Node1209Dense.nodes 7 _ _
  unfold MixedCaseTrimCandidate.CaseCheck MixedCaseTrimCandidate.RefCheck MixedCaseTrimCandidate.row MixedCaseTrimCandidate.image Node1209Dense.nodes
  constructor
  · decide
  · repeat' rw [BankCase.check]
    decide
#print axioms Shard007_008
end Node1190Min
