import Dense

/- Original node 8, trim; direct check on the actual dense DAG.
   This declaration assumes neither checker validity nor predecessor bounds. -/
namespace Node1209NonSmall008
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000

theorem check : MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 8 := by
  decide

-- Explicit exact-type gate, independent of the axiom gate below.
example : MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 8 := check
#print axioms check
end Node1209NonSmall008
