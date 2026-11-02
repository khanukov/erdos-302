import ActualPrefix32Data
namespace ActualPrefix32
open ActualPrefix32Data MixedCaseTrimCandidate
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000
theorem check9 : MixedDag.Check extraCheck nodes 9 := by decide
theorem check10 : MixedDag.Check extraCheck nodes 10 := by decide
theorem check11 : MixedDag.Check extraCheck nodes 11 := by decide
theorem check12 : MixedDag.Check extraCheck nodes 12 := by decide
theorem check13 : MixedDag.Check extraCheck nodes 13 := by decide
theorem check14 : MixedDag.Check extraCheck nodes 14 := by
  change CaseCheck nodes 14 _ _
  unfold CaseCheck RefCheck row image nodes
  decide
theorem check15 : MixedDag.Check extraCheck nodes 15 := by
  change TrimCheck nodes 15 _
  unfold TrimCheck RefCheck image nodes UpperBridge.OrderedEdge
  decide
#print axioms check9
#print axioms check10
#print axioms check11
#print axioms check12
#print axioms check13
#print axioms check14
#print axioms check15
end ActualPrefix32
