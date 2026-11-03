import Candidate
import RootDenseData

/- Candidate: the two dense translations are distinct Lean definitions.  Their
   relationship to archive bytes is checked externally, not proved in Lean. -/
namespace Node1190Composition
set_option maxRecDepth 100000
set_option maxHeartbeats 100000000

theorem support_subset :
    (Node1209Dense.nodes 336).support ⊆
      (Node1209RootDense.nodes 375).support := by
  decide

theorem root_bound :
    Extended.Bound (Node1209RootDense.nodes 375).support 258 := by
  have hb := MixedCaseTrimCandidate.sound Node1209Dense.nodes 337
    Node1190Min.valid 336 (by decide)
  have ht := Extended.bound_mono support_subset hb
  change Extended.Bound (Node1209RootDense.nodes 375).support 258 at ht
  exact ht

theorem source_bound : Extended.Bound ExtensionFirstArchive.source 258 := by
  have ht := root_bound
  change Extended.Bound Node1209SourceCandidate.node.support
    Node1209SourceCandidate.node.demand at ht
  rw [Node1209SourceCandidate.support_identity,
    Node1209SourceCandidate.demand_identity] at ht
  exact ht

theorem target_bound : Extended.Bound ExtensionFirstArchive.target 242 :=
  FirstExtensionBridge.target_bound source_bound

#print axioms support_subset
#print axioms root_bound
#print axioms source_bound
#print axioms target_bound
end Node1190Composition
