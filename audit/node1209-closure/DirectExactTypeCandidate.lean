import DirectCandidate

example :
    (∀ i < 375, MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i) →
    Extended.Bound ExtensionFirstArchive.source 258 :=
  Node1209DirectCandidate.source_bound

example : (Node1209Dense.nodes 374).support ⊆ Node1209SourceCandidate.node.support :=
  Node1209DirectCandidate.source_subset

#print axioms Node1209DirectCandidate.source_subset
#print axioms Node1209DirectCandidate.source_bound
