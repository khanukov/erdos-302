import Std

/-! A finite, unquotiented list of level and suffix-exponent occurrences.
The list position is the occurrence identity; equal evaluated arguments survive. -/
namespace RenewalOccurrenceIndex

structure Occurrence where
  level : Nat
  choices : List Nat
  arg : Nat
  deriving DecidableEq, Repr

def prependChoice (k : Nat) (a : Occurrence) : Occurrence :=
  { a with choices := k :: a.choices }

def occurrences (p : Nat → Nat) : Nat → Nat → List Occurrence
  | 0, _ => []
  | j + 1, n => (List.range n).flatMap fun k =>
      let m := n / p j ^ k
      (occurrences p j m).map (prependChoice k) ++ [{ level := j, choices := [k], arg := m }]

def listExpansion (p : Nat → Nat) (d : Nat → Nat → Nat) : Nat → Nat → Nat
  | 0, _ => 0
  | j + 1, n => ((List.range n).map fun k =>
      listExpansion p d j (n / p j ^ k) + d j (n / p j ^ k)).sum

private theorem flatMap_weight (xs : List α) (f : α → List β) (w : β → Nat) :
    ((xs.flatMap f).map w).sum = (xs.map fun x => ((f x).map w).sum).sum := by
  induction xs with
  | nil => rfl
  | cons x xs ih =>
      simp only [List.flatMap_cons, List.map_append, List.sum_append, List.map_cons,
        List.sum_cons, ih]

private theorem prepend_weight (xs : List Occurrence) (k : Nat) (d : Nat → Nat → Nat) :
    ((xs.map (prependChoice k)).map (fun a => d a.level a.arg)).sum =
      (xs.map (fun a => d a.level a.arg)).sum := by
  simp [List.map_map, prependChoice, Function.comp_def]

theorem index_expansion (p : Nat → Nat) (d : Nat → Nat → Nat) (levels n : Nat) :
    listExpansion p d levels n =
      ((occurrences p levels n).map (fun a => d a.level a.arg)).sum := by
  induction levels generalizing n with
  | zero => rfl
  | succ j ih =>
      simp only [listExpansion, occurrences, flatMap_weight]
      congr 1
      apply List.map_congr_left
      intro k hk
      simp only [List.map_append, List.sum_append, List.map_cons, List.map_nil, List.sum_cons,
        List.sum_nil, Nat.add_zero, prepend_weight]
      rw [ih]

#print axioms index_expansion
end RenewalOccurrenceIndex
