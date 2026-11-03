import OccurrencePrimeBridgeCandidate
open RenewalOccurrenceIndex

def primes (i : Nat) : Nat := if i = 0 then 2 else 3
def leftPath : Occurrence := ⟨0, [1, 0], 2⟩
def rightPath : Occurrence := ⟨0, [1, 0], 2⟩
example : Path primes 2 6 leftPath := by
  exact Path.next 1 6 1 ⟨0, [0], 2⟩ (by decide) (Path.stop 0 2 0 (by decide))
example : Path primes 2 6 rightPath := by
  exact Path.next 1 6 1 ⟨0, [0], 2⟩ (by decide) (Path.stop 0 2 0 (by decide))
example (a b : Occurrence) (ha : Path primes 2 6 a) (hb : Path primes 2 6 b)
    (hla : a.level = 0) (hlb : b.level = 0)
    (h : pathFactor primes 2 a.choices = pathFactor primes 2 b.choices) :
    a.choices = b.choices := by
  apply path_factor_choices_unique primes ha hb (hla.trans hlb.symm) ?_ ?_ h
  · rw [hla]; norm_num [alignedBases, primes]
  · rw [hla]; decide
