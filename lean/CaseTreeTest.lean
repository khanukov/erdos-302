import CaseTree

namespace BankCase

private def singletonRow : Constraint ℕ := ({0}, 1)
private def universe01 : Finset ℕ := {0, 1}

-- Two disjoint demands exclude a one-vertex model through a dual leaf.
private def row1 : Constraint ℕ := ({1}, 1)
example : check [singletonRow, row1] universe01 ∅ ∅ 2
    (.dual [(singletonRow, 1), (row1, 1)] 1) = true := by simp only [check] <;> decide

-- An unlisted row cannot be smuggled into a dual certificate.
example : check [singletonRow] universe01 ∅ ∅ 2
    (.dual [(singletonRow, 1), (row1, 1)] 1) = false := by simp only [check] <;> decide

-- The -1 residual cancels one unit of the second row: clamping it would
-- incorrectly make the objective 2 > 1 and accept this certificate.
example : check [({0}, 0), ({1, 2}, 2)] ({0, 1, 2} : Finset ℕ) {0} ∅ 3
    (.dual [((({0} : Finset ℕ), 0), 1), (({1, 2}, 2), 1)] 1) = false := by
  simp only [check] <;> decide
example : check [({0}, 0), ({1, 2}, 2)] ({0, 1, 2} : Finset ℕ) {0} ∅ 2
    (.dual [((({0} : Finset ℕ), 0), 1), (({1, 2}, 2), 1)] 1) = true := by
  simp only [check] <;> decide

-- Dual leaves work inside both branches, not only at the root.
example : check [singletonRow, row1] universe01 ∅ ∅ 1
    (.split 0 (.row singletonRow) (.dual [(row1, 1)] 1)) = true := by
  simp only [check] <;> decide

-- Weight and per-vertex capacity are checked by the integrated leaf.
example : check [singletonRow] universe01 ∅ ∅ 1
    (.dual [(singletonRow, 0)] 1) = false := by simp only [check] <;> decide
example : check [singletonRow] universe01 ∅ ∅ 1
    (.dual [(singletonRow, 1)] 0) = false := by simp only [check] <;> decide
example : check [singletonRow] universe01 ∅ ∅ 1
    (.dual [(singletonRow, 1), (singletonRow, 1)] 1) = false := by simp only [check] <;> decide

-- Forcing the only demanded vertex makes a size-zero budget impossible.
example : check [singletonRow] universe01 ∅ ∅ 1
    (.force singletonRow .budget) = true := by simp only [check] <;> decide

-- Both children are checked under their distinct path states.
example : check [singletonRow] universe01 ∅ ∅ 1
    (.split 0 (.row singletonRow) .budget) = true := by simp only [check] <;> decide

-- A concrete use of the general soundness theorem, not just evaluation.
example (C : Finset ℕ) (hs : State universe01 ∅ ∅ C)
    (hsmall : (C.card : ℤ) ≤ 0) (hr : Row singletonRow.1 singletonRow.2 C) : False := by
  apply check_sound [singletonRow] universe01 ∅ ∅ C 1
    (.split 0 (.row singletonRow) .budget) (by simp only [check] <;> decide) hs
  · simpa using hsmall
  · intro c hc
    simp only [List.mem_singleton] at hc
    subst c
    exact hr

-- Missing constraint, incorrect equality, non-free split, and a bad child fail.
example : check [] universe01 ∅ ∅ 1 (.row singletonRow) = false := by simp only [check] <;> decide
example : check [] universe01 ∅ ∅ 1 (.force singletonRow .budget) = false := by simp only [check] <;> decide
example : check [({0, 1}, 1)] universe01 ∅ ∅ 1
    (.force ({0, 1}, 1) .budget) = false := by simp only [check] <;> decide
example : check [singletonRow] universe01 ∅ ∅ 1
    (.split 2 (.row singletonRow) .budget) = false := by simp only [check] <;> decide
example : check [singletonRow] universe01 ∅ ∅ 1
    (.split 0 (.row singletonRow) (.row singletonRow)) = false := by simp only [check] <;> decide

-- The arithmetic is signed: a negative residual is not a contradiction.
example : check [({0}, (-1 : ℤ))] universe01 ∅ ∅ 1
    (.row ({0}, (-1 : ℤ))) = false := by simp only [check] <;> decide

#print axioms check_sound
end BankCase
