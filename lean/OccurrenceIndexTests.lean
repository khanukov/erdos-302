import OccurrenceIndex
open RenewalOccurrenceIndex

-- Equal arguments do not collapse different exponent choices.
example : (occurrences (fun _ => 3) 1 3).map (fun a => (a.level, a.arg)) =
    [(0, 3), (0, 1), (0, 0)] := by decide
example : (occurrences (fun _ => 3) 1 3).map (fun a => a.choices) =
    [[0], [1], [2]] := by decide
example : (occurrences (fun _ => 2) 0 10).length = 0 := by decide
example : (occurrences (fun _ => 2) 2 0).length = 0 := by decide
-- Repeated divisor 2 produces the same positive level/argument by different paths.
example : ((occurrences (fun _ => 2) 2 4).filter
    (fun a => a.level == 0 && a.arg == 2)).length = 2 := by decide
