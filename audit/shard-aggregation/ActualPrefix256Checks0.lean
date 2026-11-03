import ActualPrefix256Data
namespace ActualPrefix256
open ActualPrefix256Data MixedCaseTrimCandidate
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000
theorem check0 : MixedDag.Check extraCheck nodes 0 := by decide
theorem check1 : MixedDag.Check extraCheck nodes 1 := by decide
theorem check2 : MixedDag.Check extraCheck nodes 2 := by decide
theorem check3 : MixedDag.Check extraCheck nodes 3 := by decide
set_option maxRecDepth 16384 in
theorem check4 : MixedDag.Check extraCheck nodes 4 := by
  change CaseCheck nodes 4 _ _
  unfold CaseCheck RefCheck row image nodes
  constructor
  · decide
  · repeat' rw [BankCase.check]
    decide
theorem check5 : MixedDag.Check extraCheck nodes 5 := by
  change TrimCheck nodes 5 _
  unfold TrimCheck RefCheck image nodes UpperBridge.OrderedEdge
  decide
theorem check6 : MixedDag.Check extraCheck nodes 6 := by decide
set_option maxRecDepth 16384 in
theorem check7 : MixedDag.Check extraCheck nodes 7 := by
  change CaseCheck nodes 7 _ _
  unfold CaseCheck RefCheck row image nodes
  constructor
  · decide
  · repeat' rw [BankCase.check]
    decide
theorem check8 : MixedDag.Check extraCheck nodes 8 := by
  change TrimCheck nodes 8 _
  unfold TrimCheck RefCheck image nodes UpperBridge.OrderedEdge
  decide
theorem check9 : MixedDag.Check extraCheck nodes 9 := by decide
theorem check10 : MixedDag.Check extraCheck nodes 10 := by decide
theorem check11 : MixedDag.Check extraCheck nodes 11 := by decide
theorem check12 : MixedDag.Check extraCheck nodes 12 := by decide
theorem check13 : MixedDag.Check extraCheck nodes 13 := by decide
set_option maxRecDepth 16384 in
theorem check14 : MixedDag.Check extraCheck nodes 14 := by
  change CaseCheck nodes 14 _ _
  unfold CaseCheck RefCheck row image nodes
  constructor
  · decide
  · repeat' rw [BankCase.check]
    decide
theorem check15 : MixedDag.Check extraCheck nodes 15 := by
  change TrimCheck nodes 15 _
  unfold TrimCheck RefCheck image nodes UpperBridge.OrderedEdge
  decide
#print axioms check0
#print axioms check1
#print axioms check2
#print axioms check3
#print axioms check4
#print axioms check5
#print axioms check6
#print axioms check7
#print axioms check8
#print axioms check9
#print axioms check10
#print axioms check11
#print axioms check12
#print axioms check13
#print axioms check14
#print axioms check15
end ActualPrefix256
