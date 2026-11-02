import MixedCaseTrimCandidate

/-! Candidate tests: require hosted Lean compilation before reliance. -/
namespace MixedCaseTrimCandidateTest
open MixedCaseTrimCandidate

def caseNodes (_ : ℕ) : MixedDag.Node Payload := ⟨{2, 3, 6}, 1, .small⟩
def ref0 : Ref := ⟨0, 1, 1⟩
def caseRows : List Ref := [ref0]
def caseTree : BankCase.Tree ℕ :=
  .dual [((({2, 3, 6} : Finset ℕ), (1 : ℤ)), (1 : ℤ))] 1

-- Positive, satisfiable graph and positive demand; not an assumed bound.
example : CaseCheck caseNodes 1 caseRows caseTree := by
  unfold CaseCheck RefCheck image row caseNodes caseRows ref0 caseTree
  simp only [BankCase.check] <;> decide

example : Extended.Bound (caseNodes 1).support (caseNodes 1).demand := by
  apply case_sound caseNodes 1 caseRows caseTree
  · unfold CaseCheck RefCheck image row caseNodes caseRows ref0 caseTree
    simp only [BankCase.check] <;> decide
  · intro j hj
    simpa [caseNodes] using Extended.edge_0

-- A self-reference must fail even if the corresponding image is legitimate.
example : ¬ RefCheck caseNodes 0 ref0 := by
  unfold RefCheck caseNodes ref0
  decide

def trimNodes (i : ℕ) : MixedDag.Node Payload :=
  if i = 0 then ⟨{2, 3, 6, 7}, 1, .small⟩ else ⟨{2, 3, 6}, 1, .small⟩

-- Removal of an isolated vertex; removing a real edge vertex must fail.
example : TrimCheck trimNodes 1 ref0 := by
  unfold TrimCheck RefCheck image trimNodes ref0 UpperBridge.OrderedEdge
  decide

def badTrimNodes (i : ℕ) : MixedDag.Node Payload :=
  if i = 0 then ⟨{2, 3, 6}, 1, .small⟩ else ⟨{2, 3}, 1, .small⟩
example : ¬ TrimCheck badTrimNodes 1 ref0 := by
  unfold TrimCheck RefCheck image badTrimNodes ref0 UpperBridge.OrderedEdge
  decide
-- A genuinely combined two-node checker: the predecessor is a checked edge,
-- and the successor obtains the positive bound via the finite case rule.
def mixedNodes (i : ℕ) : MixedDag.Node Payload :=
  if i = 0 then ⟨{2, 3, 6}, 1, .edge 2 3 6⟩
  else ⟨{2, 3, 6}, 1, .extra (.caseRule caseRows caseTree)⟩

theorem mixed_valid : ∀ i < 2, MixedDag.Check extraCheck mixedNodes i := by
  intro i hi
  interval_cases i
  · decide
  · change CaseCheck mixedNodes 1 caseRows caseTree
    unfold CaseCheck RefCheck image row mixedNodes caseRows ref0 caseTree
    simp only [BankCase.check] <;> decide

theorem mixed_bound : Extended.Bound (mixedNodes 1).support (mixedNodes 1).demand :=
  sound mixedNodes 2 mixed_valid 1 (by decide)

def mixedTrimNodes (i : ℕ) : MixedDag.Node Payload :=
  if i = 0 then ⟨{2, 3, 6, 7}, 1, .small⟩
  else ⟨{2, 3, 6}, 1, .extra (.trimRule ref0)⟩

theorem mixed_trim_valid : ∀ i < 2, MixedDag.Check extraCheck mixedTrimNodes i := by
  decide

theorem mixed_trim_bound : Extended.Bound (mixedTrimNodes 1).support
    (mixedTrimNodes 1).demand :=
  sound mixedTrimNodes 2 mixed_trim_valid 1 (by decide)

-- One outside vertex is charged exactly once: 3 - 1 = 2.
def outsideNodes (i : ℕ) : MixedDag.Node Payload :=
  if i = 0 then ⟨{2,3,4,5,6,7,8,10,12,14,15,16,20,21,24}, 3, .small⟩
  else ⟨{2,3,4,5,6,8,10,12,14,15,16,20,21,24}, 2, .small⟩
def outsideTree : BankCase.Tree ℕ :=
  .dual [((({2,3,4,5,6,8,10,12,14,15,16,20,21,24} : Finset ℕ), (2 : ℤ)), (1 : ℤ))] 1

example : (image outsideNodes ref0 \ (outsideNodes 1).support).card = 1 := by
  unfold image outsideNodes ref0
  decide
example : row outsideNodes 1 ref0 =
    ((outsideNodes 1).support, (2 : ℤ)) := by
  unfold row image outsideNodes ref0 BankCase.Residual
  decide
theorem outside_valid : CaseCheck outsideNodes 1 [ref0] outsideTree := by
  unfold CaseCheck RefCheck image row outsideNodes ref0 outsideTree BankCase.Residual
  simp only [BankCase.check] <;> decide
theorem outside_bound : Extended.Bound (outsideNodes 1).support (outsideNodes 1).demand := by
  apply case_sound outsideNodes 1 [ref0] outsideTree
  · unfold CaseCheck RefCheck image row outsideNodes ref0 outsideTree BankCase.Residual
    simp only [BankCase.check] <;> decide
  · intro j hj
    have : j = 0 := by omega
    subst j
    simpa [outsideNodes] using Extended.bank_node_4

-- Signed residuals must remain negative rather than truncate to zero.
example : (row outsideNodes 1 ⟨0, 1, 1⟩).2 = (2 : ℤ) := by
  unfold row image outsideNodes BankCase.Residual
  decide
example : BankCase.Residual ({1,2,3} : Finset ℕ) ∅ 1 = -2 := by decide
def negativeNodes (i : ℕ) : MixedDag.Node Payload :=
  if i = 0 then ⟨{1,2,3}, 1, .small⟩ else ⟨∅, 0, .small⟩
def negativeTree : BankCase.Tree ℕ :=
  .dual [(((∅ : Finset ℕ), (-2 : ℤ)), (1 : ℤ))] 1
theorem negative_row : (row negativeNodes 1 ref0).2 = (-2 : ℤ) := by
  unfold row image negativeNodes ref0 BankCase.Residual
  decide
theorem negative_dual_rejected : ¬ CaseCheck negativeNodes 1 [ref0] negativeTree := by
  unfold CaseCheck RefCheck image row negativeNodes ref0 negativeTree BankCase.Residual
  simp only [BankCase.check] <;> decide
example : ¬ RefCheck outsideNodes 1 ⟨0, 0, 1⟩ := by decide
example : ¬ RefCheck outsideNodes 1 ⟨0, 1, 0⟩ := by decide
example : ¬ RefCheck outsideNodes 1 ⟨0, 1, 2⟩ := by decide

#print axioms mixed_trim_valid
#print axioms mixed_trim_bound
#print axioms outside_valid
#print axioms outside_bound
#print axioms negative_row
#print axioms negative_dual_rejected

#print axioms mixed_valid
#print axioms mixed_bound

end MixedCaseTrimCandidateTest
