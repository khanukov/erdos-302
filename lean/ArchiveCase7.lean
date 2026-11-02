import CaseTree

/- Generated from archive node 7; Python transcription is not a Lean theorem
   relating the archive bytes or source nodes to these data. -/
namespace ArchiveCase7

def target : Finset ℕ := {2, 3, 4, 5, 6, 7, 8, 10, 12, 14, 15, 16, 20, 21, 24, 28, 30}
def demand : ℕ := 4
-- (image index, source index, numerator, denominator); source index, support, demand.
def imageRefs : List (ℕ × ℕ × ℕ × ℕ) := [(4, 0, 1, 1), (0, 2, 1, 1), (5, 0, 5, 1), (6, 6, 1, 1)]
def sourceNodes : List (ℕ × Finset ℕ × ℕ) := [(0, {2, 3, 6}, 1), (2, {4, 5, 20}, 1), (6, {12, 21, 28}, 1)]
def rows : List (BankCase.Constraint ℕ) := [({2, 3, 6}, (1 : ℤ)), ({4, 5, 20}, (1 : ℤ)), ({10, 15, 30}, (1 : ℤ)), ({12, 21, 28}, (1 : ℤ))]
def tree : BankCase.Tree ℕ := BankCase.Tree.dual [(({2, 3, 6}, (1 : ℤ)), (100000000 : ℤ)), (({4, 5, 20}, (1 : ℤ)), (100000000 : ℤ)), (({10, 15, 30}, (1 : ℤ)), (100000000 : ℤ)), (({12, 21, 28}, (1 : ℤ)), (100000000 : ℤ))] 100000000

-- Host CI must kernel-check this candidate; generation is not verification.
theorem check_valid : BankCase.check rows target ∅ ∅ demand tree = true := by
  simp only [tree, rows, target, demand, BankCase.check] <;> decide
#print axioms check_valid
end ArchiveCase7
