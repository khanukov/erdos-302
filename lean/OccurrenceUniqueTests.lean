import OccurrenceUnique
open RenewalOccurrenceIndex

-- Distinct positional encodings, same positive evaluated argument.
example : (occurrences (fun _ => 2) 2 3).countP (fun a => a.arg == 1) > 1 := by decide
example : (occurrences (fun _ => 2) 1 3).countP (fun a => a.arg == 0) > 0 := by decide
example : occurrences (fun _ => 2) 3 0 = [] := by decide
example : (occurrences (fun _ => 1) 2 3).Nodup := by decide
example : ∀ j ∈ List.range 4, ∀ n ∈ List.range 5,
    (occurrences (fun _ => 2) j n).Nodup := by decide

example (p : Nat → Nat) (hp : ∀ j, 1 < p j) {j n : Nat} {a : Occurrence}
    (h : Path p j n a) : ∃ i : Fin (occurrences p j n).length,
      (occurrences p j n)[i] = a ∧ ∀ q : Fin (occurrences p j n).length,
        (occurrences p j n)[q] = a → q = i := by
  exact path_unique_position p h
