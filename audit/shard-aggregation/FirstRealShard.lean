import FirstRealData

/-! Candidate closed checks for the nine literal nodes; compilation required. -/
namespace FirstRealShard
open FirstRealData MixedCaseTrimCandidate

set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem check0 : MixedDag.Check extraCheck nodes 0 := by decide
theorem check1 : MixedDag.Check extraCheck nodes 1 := by decide
theorem check2 : MixedDag.Check extraCheck nodes 2 := by decide
theorem check3 : MixedDag.Check extraCheck nodes 3 := by decide

theorem check4 : MixedDag.Check extraCheck nodes 4 := by
  change CaseCheck nodes 4 _ _
  unfold CaseCheck RefCheck row image nodes
  decide

theorem check5 : MixedDag.Check extraCheck nodes 5 := by
  change TrimCheck nodes 5 _
  unfold TrimCheck RefCheck image nodes UpperBridge.OrderedEdge
  decide

theorem check6 : MixedDag.Check extraCheck nodes 6 := by decide

theorem check7 : MixedDag.Check extraCheck nodes 7 := by
  change CaseCheck nodes 7 _ _
  unfold CaseCheck RefCheck row image nodes
  decide

theorem check8 : MixedDag.Check extraCheck nodes 8 := by
  change TrimCheck nodes 8 _
  unfold TrimCheck RefCheck image nodes UpperBridge.OrderedEdge
  decide

theorem checked : ∀ i < 9, MixedDag.Check extraCheck nodes i := by
  intro i hi
  interval_cases i <;> first | exact check0 | exact check1 | exact check2 | exact check3 | exact check4 | exact check5 | exact check6 | exact check7 | exact check8

theorem bound8 : Extended.Bound (nodes 8).support (nodes 8).demand :=
  MixedCaseTrimCandidate.sound nodes 9 checked 8 (by decide)

#print axioms check0
#print axioms check1
#print axioms check2
#print axioms check3
#print axioms check4
#print axioms check5
#print axioms check6
#print axioms check7
#print axioms check8
#print axioms checked
#print axioms bound8
end FirstRealShard
