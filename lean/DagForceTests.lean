import DagForce

open Finset UpperBridge ArchiveDag BankCase

def exampleNodes : ℕ → Node
  | 0 => ⟨{2,3,6}, 1, .edge 2 3 6⟩
  | _ => ⟨∅, 0, .small⟩

-- On the branch excluding 3 and 6, the checked edge row forces 2.
example (C : Finset ℕ) (cover : OrderedCover {2,3,6} C)
    (state : State {2,3,6} ∅ {3,6} C) :
    State {2,3,6} {2} {3,6} C := by
  have restricted : C ∩ ({2,3,6} : Finset ℕ) = C := inter_eq_left.mpr state.1
  have state' : State {2,3,6} ∅ {3,6} (C ∩ {2,3,6}) := by
    rw [restricted]
    exact state
  have h := ArchiveDag.force_from_prior exampleNodes 1 0 (by decide)
    (by decide) {2,3,6} ∅ {3,6} C cover state' (by decide)
  simpa [exampleNodes, BankCase.Free, restricted] using h

-- Signed residuals must not be silently truncated at zero.
example : Residual ({2,3,6} : Finset ℕ) {2} 1 = -1 := by decide
example : Remaining ({2} : Finset ℕ) (-1) ∅ ≠
    ((({2} : Finset ℕ) ∩ Free {2} ∅ ∅).card : ℤ) := by decide

#print axioms ArchiveDag.force_from_prior
