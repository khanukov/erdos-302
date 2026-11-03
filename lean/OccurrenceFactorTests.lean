import OccurrenceFactor
open RenewalOccurrenceIndex

example (p : Nat → Nat) {j n : Nat} {a : Occurrence} (h : Path p j n a) :
    a.arg = n / pathFactor p j a.choices := path_arg_factor p h

example (p : Nat → Nat) {j n : Nat} {a : Occurrence} (h : Path p j n a) :
    ∃ i : Fin (occurrences p j n).length,
      (occurrences p j n)[i] = a ∧
      ∀ q : Fin (occurrences p j n).length,
        (occurrences p j n)[q] = a → q = i := path_unique_position p h

example (p : Nat → Nat) {j n : Nat} {a : Occurrence} (h : Path p j n a) :
    ∃ i : Fin (occurrences p j n).length,
      (occurrences p j n)[i] = a ∧
      ∀ q : Fin (occurrences p j n).length,
        (occurrences p j n)[q].level = a.level →
        (occurrences p j n)[q].choices = a.choices → q = i :=
  path_encoding_unique_position p h

example : pathFactor (fun j => j + 2) 3 [1, 2] = 36 := by decide
