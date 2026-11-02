import ActualPrefix256Data
namespace ActualPrefix256
open ActualPrefix256Data MixedCaseTrimCandidate
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000
theorem check32 : MixedDag.Check extraCheck nodes 32 := by decide
theorem check33 : MixedDag.Check extraCheck nodes 33 := by decide
theorem check34 : MixedDag.Check extraCheck nodes 34 := by decide
theorem check35 : MixedDag.Check extraCheck nodes 35 := by
  change CaseCheck nodes 35 _ _
  unfold CaseCheck RefCheck row image nodes
  decide
theorem check36 : MixedDag.Check extraCheck nodes 36 := by decide
theorem check37 : MixedDag.Check extraCheck nodes 37 := by decide
theorem check38 : MixedDag.Check extraCheck nodes 38 := by decide
theorem check39 : MixedDag.Check extraCheck nodes 39 := by decide
theorem check40 : MixedDag.Check extraCheck nodes 40 := by decide
theorem check41 : MixedDag.Check extraCheck nodes 41 := by decide
theorem check42 : MixedDag.Check extraCheck nodes 42 := by decide
theorem check43 : MixedDag.Check extraCheck nodes 43 := by decide
theorem check44 : MixedDag.Check extraCheck nodes 44 := by decide
theorem check45 : MixedDag.Check extraCheck nodes 45 := by decide
theorem check46 : MixedDag.Check extraCheck nodes 46 := by decide
theorem check47 : MixedDag.Check extraCheck nodes 47 := by decide
#print axioms check32
#print axioms check33
#print axioms check34
#print axioms check35
#print axioms check36
#print axioms check37
#print axioms check38
#print axioms check39
#print axioms check40
#print axioms check41
#print axioms check42
#print axioms check43
#print axioms check44
#print axioms check45
#print axioms check46
#print axioms check47
end ActualPrefix256
