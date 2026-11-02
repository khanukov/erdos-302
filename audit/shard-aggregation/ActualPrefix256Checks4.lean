import ActualPrefix256Data
namespace ActualPrefix256
open ActualPrefix256Data MixedCaseTrimCandidate
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000
theorem check64 : MixedDag.Check extraCheck nodes 64 := by decide
theorem check65 : MixedDag.Check extraCheck nodes 65 := by decide
theorem check66 : MixedDag.Check extraCheck nodes 66 := by decide
theorem check67 : MixedDag.Check extraCheck nodes 67 := by
  change CaseCheck nodes 67 _ _
  unfold CaseCheck RefCheck image row nodes
  simp only [BankCase.check] <;> decide
theorem check68 : MixedDag.Check extraCheck nodes 68 := by decide
theorem check69 : MixedDag.Check extraCheck nodes 69 := by decide
theorem check70 : MixedDag.Check extraCheck nodes 70 := by decide
theorem check71 : MixedDag.Check extraCheck nodes 71 := by decide
theorem check72 : MixedDag.Check extraCheck nodes 72 := by
  change CaseCheck nodes 72 _ _
  unfold CaseCheck RefCheck image row nodes
  simp only [BankCase.check] <;> decide
theorem check73 : MixedDag.Check extraCheck nodes 73 := by decide
theorem check74 : MixedDag.Check extraCheck nodes 74 := by decide
theorem check75 : MixedDag.Check extraCheck nodes 75 := by decide
theorem check76 : MixedDag.Check extraCheck nodes 76 := by decide
theorem check77 : MixedDag.Check extraCheck nodes 77 := by decide
theorem check78 : MixedDag.Check extraCheck nodes 78 := by
  change CaseCheck nodes 78 _ _
  unfold CaseCheck RefCheck image row nodes
  simp only [BankCase.check] <;> decide
theorem check79 : MixedDag.Check extraCheck nodes 79 := by decide
#print axioms check64
#print axioms check65
#print axioms check66
#print axioms check67
#print axioms check68
#print axioms check69
#print axioms check70
#print axioms check71
#print axioms check72
#print axioms check73
#print axioms check74
#print axioms check75
#print axioms check76
#print axioms check77
#print axioms check78
#print axioms check79
end ActualPrefix256
