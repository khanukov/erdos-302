import DenseData
import Node1209SourceCandidate

/- Candidate: the first 375 dense checks are explicit hypotheses. Archive
   extraction and the Python translation are not kernel provenance. -/
namespace Node1209DirectCandidate
set_option maxRecDepth 100000
set_option maxHeartbeats 100000000

theorem source_subset :
    (Node1209Dense.nodes 374).support ⊆ Node1209SourceCandidate.node.support := by
  decide

theorem source_bound
    (prefix : ∀ i < 375,
      MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i) :
    Extended.Bound ExtensionFirstArchive.source 258 := by
  have hb := MixedCaseTrimCandidate.sound Node1209Dense.nodes 375 prefix 374 (by decide)
  have ht := Extended.bound_mono source_subset hb
  change Extended.Bound Node1209SourceCandidate.node.support
    Node1209SourceCandidate.node.demand at ht
  rw [Node1209SourceCandidate.support_identity,
    Node1209SourceCandidate.demand_identity] at ht
  exact ht

#print axioms source_subset
#print axioms source_bound
end Node1209DirectCandidate
