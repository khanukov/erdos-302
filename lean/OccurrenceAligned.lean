import OccurrenceFactor

namespace RenewalOccurrenceIndex

def alignedBases (p : Nat → Nat) : Nat → Nat → List Nat
  | 0, _ => []
  | _, 0 => []
  | j + 1, d + 1 => p j :: alignedBases p j d

def alignedProduct : List Nat → List Nat → Nat
  | p :: ps, e :: es => p ^ e * alignedProduct ps es
  | _, _ => 1

theorem aligned_factor (p : Nat → Nat) (j : Nat) (es : List Nat) :
    pathFactor p j es = alignedProduct (alignedBases p j es.length) es := by
  induction j generalizing es with
  | zero => cases es <;> rfl
  | succ j ih => cases es with
    | nil => rfl
    | cons e es => simp only [pathFactor, alignedBases, alignedProduct, List.length_cons, ih]

theorem aligned_bases_length (p : Nat → Nat) (j d : Nat) (h : d ≤ j) :
    (alignedBases p j d).length = d := by
  induction j generalizing d with
  | zero =>
      have hd : d = 0 := by omega
      subst d
      rfl
  | succ j ih => cases d with
    | zero => rfl
    | succ d => simp only [alignedBases, List.length_cons]; rw [ih d (by omega)]

theorem path_aligned_factor (p : Nat → Nat) {j n : Nat} {a : Occurrence}
    (h : Path p j n a) :
    pathFactor p j a.choices = alignedProduct (alignedBases p j (j - a.level)) a.choices := by
  rw [← (path_shape p h).2]
  exact aligned_factor p j a.choices

theorem path_aligned_length (p : Nat → Nat) {j n : Nat} {a : Occurrence}
    (h : Path p j n a) :
    a.choices.length = (alignedBases p j (j - a.level)).length := by
  rw [aligned_bases_length p j (j - a.level) (by omega)]
  exact (path_shape p h).2

#print axioms aligned_factor
#print axioms aligned_bases_length
#print axioms path_aligned_factor
#print axioms path_aligned_length
end RenewalOccurrenceIndex
