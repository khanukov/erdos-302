import CaseTree

namespace BankCase

private def singletonRow : Constraint ℕ := ({0}, 1)
private def universe01 : Finset ℕ := {0, 1}

-- Forcing the only demanded vertex makes a size-zero budget impossible.
example : check [singletonRow] universe01 ∅ ∅ 1
    (.force singletonRow .budget) = true := by decide

-- Both children are checked under their distinct path states.
example : check [singletonRow] universe01 ∅ ∅ 1
    (.split 0 (.row singletonRow) .budget) = true := by decide

-- A concrete use of the general soundness theorem, not just evaluation.
example (C : Finset ℕ) (hs : State universe01 ∅ ∅ C)
    (hsmall : (C.card : ℤ) ≤ 0) (hr : Row singletonRow.1 singletonRow.2 C) : False := by
  apply check_sound [singletonRow] universe01 ∅ ∅ C 1
    (.split 0 (.row singletonRow) .budget) (by decide) hs
  · simpa using hsmall
  · intro c hc
    simp only [List.mem_singleton] at hc
    subst c
    exact hr

-- Missing constraint, incorrect equality, non-free split, and a bad child fail.
example : check [] universe01 ∅ ∅ 1 (.row singletonRow) = false := by decide
example : check [] universe01 ∅ ∅ 1 (.force singletonRow .budget) = false := by decide
example : check [({0, 1}, 1)] universe01 ∅ ∅ 1
    (.force ({0, 1}, 1) .budget) = false := by decide
example : check [singletonRow] universe01 ∅ ∅ 1
    (.split 2 (.row singletonRow) .budget) = false := by decide
example : check [singletonRow] universe01 ∅ ∅ 1
    (.split 0 (.row singletonRow) (.row singletonRow)) = false := by decide

-- The arithmetic is signed: a negative residual is not a contradiction.
example : check [({0}, (-1 : ℤ))] universe01 ∅ ∅ 1
    (.row ({0}, (-1 : ℤ))) = false := by decide

#print axioms check_sound
end BankCase
