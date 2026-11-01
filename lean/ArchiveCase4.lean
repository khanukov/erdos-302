import CaseTree

/- Generated from archive node 4; Python transcription is not a Lean theorem
   relating the archive bytes or source nodes to these data. -/
namespace ArchiveCase4

def target : Finset ℕ := {2, 3, 4, 5, 6, 7, 8, 10, 12, 14, 15, 16, 20, 21, 24}
def demand : ℕ := 3
-- (image index, source index, numerator, denominator); source index, support, demand.
def imageRefs : List (ℕ × ℕ × ℕ × ℕ) := [(0, 2, 1, 1), (1, 3, 1, 1), (2, 0, 4, 1)]
def sourceNodes : List (ℕ × Finset ℕ × ℕ) := [(0, {2, 3, 6}, 1), (2, {4, 5, 20}, 1), (3, {6, 10, 15}, 1)]
def rows : List (BankCase.Constraint ℕ) := [({4, 5, 20}, (1 : ℤ)), ({6, 10, 15}, (1 : ℤ)), ({8, 12, 24}, (1 : ℤ))]
def tree : BankCase.Tree ℕ := BankCase.Tree.dual [(({4, 5, 20}, (1 : ℤ)), (100000000 : ℤ)), (({6, 10, 15}, (1 : ℤ)), (100000000 : ℤ)), (({8, 12, 24}, (1 : ℤ)), (100000000 : ℤ))] 100000000

-- Host CI must kernel-check this candidate; generation is not verification.
theorem check_valid : BankCase.check rows target ∅ ∅ demand tree = true := by
  simp only [tree, rows, target, demand, BankCase.check] <;> decide
#print axioms check_valid
end ArchiveCase4
