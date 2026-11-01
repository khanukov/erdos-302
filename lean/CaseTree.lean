import CaseRules

/-! A finite, recursive case-certificate fragment.  A successful check rules out
any small C satisfying the supplied rows.  This is not yet the archive's dual
rule, array/edge validation, reachability check, or archive translation. -/
namespace BankCase

variable {α : Type*} [DecidableEq α]

/-- A row and its signed lower bound. -/
abbrev Constraint (α : Type*) := Finset α × ℤ

inductive Tree (α : Type*) where
  | budget
  | row (c : Constraint α)
  | force (c : Constraint α) (child : Tree α)
  | split (x : α) (zero one : Tree α)
  deriving DecidableEq

/-- Check every branch and every local premise, not a semantic oracle.  The
explicit measure decreases even when the state is updated by a force. -/
def check (rows : List (Constraint α)) (T O Z : Finset α) (k : ℕ)
    (t : Tree α) : Bool :=
  match t with
  | .budget => decide ((k : ℤ) - 1 - (O.card : ℤ) < 0)
  | .row c =>
      decide (c ∈ rows) &&
      decide (((c.1 ∩ Free T O Z).card : ℤ) < Remaining c.1 c.2 O)
  | .force c child =>
      decide (c ∈ rows) &&
      decide (Remaining c.1 c.2 O = ((c.1 ∩ Free T O Z).card : ℤ)) &&
      check rows T (O ∪ (c.1 ∩ Free T O Z)) Z k child
  | .split x zero one =>
      decide (x ∈ Free T O Z) &&
      check rows T O (insert x Z) k zero &&
      check rows T (insert x O) Z k one
termination_by sizeOf t

/-- Soundness concerns all models of the input constraints, rather than taking
branch soundness or the desired contradiction as an input. -/
theorem check_sound (rows : List (Constraint α)) (T O Z C : Finset α)
    (k : ℕ) (t : Tree α) (hc : check rows T O Z k t = true)
    (hs : State T O Z C) (hsmall : (C.card : ℤ) ≤ (k : ℤ) - 1)
    (hrows : ∀ c ∈ rows, Row c.1 c.2 C) : False := by
  induction t generalizing O Z with
  | budget =>
      simp only [check, decide_eq_true_eq] at hc
      exact budget_reject hs hsmall hc
  | row c =>
      simp only [check, Bool.and_eq_true, decide_eq_true_eq] at hc
      exact row_reject hs (hrows c hc.1) hc.2
  | force c child ih =>
      simp only [check, Bool.and_eq_true, decide_eq_true_eq] at hc
      exact ih _ _ hc.2 (force_sound hs (hrows c hc.1.1) hc.1.2)
  | split x zero one ihZero ihOne =>
      simp only [check, Bool.and_eq_true, decide_eq_true_eq] at hc
      apply split_sound x hs
      · intro hz
        exact ihZero _ _ hc.1.2 hz
      · intro ho
        exact ihOne _ _ hc.2 ho

#print axioms check_sound
end BankCase
