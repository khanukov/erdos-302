import OccurrencePath
open RenewalOccurrenceIndex

example : (occurrences (fun _ => 2) 2 3).length = 7 := by decide
example : (occurrences (fun _ => 2) 1 0) = [] := by decide
example : ∃ a ∈ occurrences (fun _ => 2) 1 3, a.arg = 0 := by decide
example : ∀ j ∈ List.range 4, ∀ n ∈ List.range 5,
    ∀ a ∈ occurrences (fun _ => 2) j n,
      a.level < j ∧ a.choices.length = j - a.level := by decide
example : (occurrences (fun _ => 2) 2 3).countP (fun a => a.arg == 1) > 1 := by decide
example : ∀ (i : Fin (occurrences (fun _ => 2) 2 3).length),
    Path (fun _ => 2) 2 3 ((occurrences (fun _ => 2) 2 3)[i]) := by
  intro i
  exact occurrence_position_path _ _ _ i
