import Std

/-! Self-contained list-position accounting. Equal cell records and equal
occurrences are deliberately not deduplicated. -/
namespace CorrectionOccurrenceGeneric

structure Cell where
  level : Nat
  lo : Nat
  hi : Nat
  height : Nat
  deriving DecidableEq, Repr

structure Occurrence where
  level : Nat
  arg : Nat
  deriving DecidableEq, Repr

def hit (o : Occurrence) (c : Cell) : Nat :=
  if c.level = o.level ∧ c.lo ≤ o.arg ∧ o.arg < c.hi then 1 else 0

def correction (cells : List Cell) (j x : Nat) : Nat :=
  (cells.map fun c => c.height * hit ⟨j, x⟩ c).sum

def multiplicity (os : List Occurrence) (c : Cell) : Nat :=
  (os.map fun o => hit o c).sum

private theorem sum_map_add (xs : List α) (f g : α → Nat) :
    (xs.map fun x => f x + g x).sum = (xs.map f).sum + (xs.map g).sum := by
  induction xs with
  | nil => simp
  | cons x xs ih => simp [ih, Nat.add_assoc, Nat.add_left_comm]

private theorem sum_map_mul (xs : List α) (f : α → Nat) (n : Nat) :
    (xs.map fun x => n * f x).sum = n * (xs.map f).sum := by
  induction xs with
  | nil => simp
  | cons x xs ih => simp [ih, Nat.mul_add]

/-- Exact Fubini identity for literal positions: no distinctness is assumed. -/
theorem occurrence_correction_sum (cells : List Cell) (os : List Occurrence) :
    (os.map fun o => correction cells o.level o.arg).sum =
      (cells.map fun c => c.height * multiplicity os c).sum := by
  induction os with
  | nil =>
    simp only [List.map_nil, List.sum_nil, multiplicity, Nat.mul_zero]
    induction cells with
    | nil => rfl
    | cons c cs ih =>
      simp only [List.map_cons, List.sum_cons, Nat.zero_add]
      exact ih
  | cons o os ih =>
    simp only [List.map_cons, List.sum_cons, correction, multiplicity] at *
    rw [ih, ← sum_map_add]
    apply congrArg List.sum
    apply List.map_congr_left
    intro c hc
    simp [Nat.mul_add]

example : correction [⟨0, 1, 4, 2⟩, ⟨0, 1, 4, 2⟩] 0 3 = 4 := by decide
example : multiplicity [⟨0, 3⟩, ⟨0, 3⟩] ⟨0, 1, 4, 2⟩ = 2 := by decide
example : correction [⟨0, 1, 4, 2⟩] 0 0 = 0 := by decide
example : correction [⟨0, 1, 4, 2⟩] 0 4 = 0 := by decide
#print axioms occurrence_correction_sum
end CorrectionOccurrenceGeneric
