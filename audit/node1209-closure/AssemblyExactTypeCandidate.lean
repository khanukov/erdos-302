import AssemblyCandidate

set_option maxRecDepth 100000
set_option maxHeartbeats 100000000

example :
  MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 4 →
  MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 5 →
  MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 7 →
  MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 8 →
  MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 14 →
  MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 15 →
  MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 374 →
  MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 375 →
  MixedDag.Valid MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 376 :=
  Node1209AssemblyCandidate.valid

example :
  MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 4 →
  MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 5 →
  MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 7 →
  MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 8 →
  MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 14 →
  MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 15 →
  MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 374 →
  MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 375 →
  Extended.Bound ExtensionFirstArchive.source 258 := Node1209AssemblyCandidate.source_bound

example :
  MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 4 →
  MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 5 →
  MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 7 →
  MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 8 →
  MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 14 →
  MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 15 →
  MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 374 →
  MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 375 →
  Extended.Bound ExtensionFirstArchive.target 242 := Node1209AssemblyCandidate.target_bound

#print axioms Node1209AssemblyCandidate.valid
#print axioms Node1209AssemblyCandidate.source_bound
#print axioms Node1209AssemblyCandidate.target_bound
