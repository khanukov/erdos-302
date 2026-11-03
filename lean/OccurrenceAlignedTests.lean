import OccurrenceAligned
open RenewalOccurrenceIndex
example : alignedBases (fun i => i + 2) 3 2 = [4, 3] := by decide
example : pathFactor (fun i => i + 2) 3 [1, 0] = alignedProduct [4, 3] [1, 0] := by decide
-- Both are valid paths; the longer path has a trailing zero exponent.
def sampleP (i : Nat) : Nat := i + 2
def short : Occurrence := ⟨1, [1], 1⟩
def long : Occurrence := ⟨0, [1, 0], 1⟩
example : Path sampleP 2 3 short := by
  exact Path.stop 1 3 1 (by decide)
example : Path sampleP 2 3 long := by
  exact Path.next 1 3 1 ⟨0, [0], 1⟩ (by decide) (Path.stop 0 1 0 (by decide))
example : short.level ≠ long.level ∧ short.choices ≠ long.choices ∧
    pathFactor sampleP 2 short.choices = pathFactor sampleP 2 long.choices := by decide
