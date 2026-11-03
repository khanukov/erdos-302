import OccurrenceAligned
import DistinctPrimeFactorCandidate

namespace RenewalOccurrenceIndex

/-- The independent Std and Mathlib products have the same recursive meaning. -/
theorem aligned_product_eq (ps es : List Nat) :
    alignedProduct ps es = DistinctPrimeFactorCandidate.product ps es := by
  induction ps generalizing es with
  | nil => cases es <;> rfl
  | cons p ps ih =>
      cases es with
      | nil => rfl
      | cons e es => simp only [alignedProduct, DistinctPrimeFactorCandidate.product, ih]

/-- Actual paths at a common starting and stopping level have identical choices
when their factors agree, provided their actual aligned bases are distinct primes. -/
theorem path_factor_choices_unique (p : Nat → Nat) {j n m : Nat} {a b : Occurrence}
    (ha : Path p j n a) (hb : Path p j m b) (hl : a.level = b.level)
    (hp : ∀ q ∈ alignedBases p j (j - a.level), Nat.Prime q)
    (hd : (alignedBases p j (j - a.level)).Nodup)
    (hf : pathFactor p j a.choices = pathFactor p j b.choices) :
    a.choices = b.choices := by
  apply DistinctPrimeFactorCandidate.product_injective
    (alignedBases p j (j - a.level)) a.choices b.choices hp hd
    (path_aligned_length p ha)
  · simpa [hl] using path_aligned_length p hb
  · rw [← aligned_product_eq, ← aligned_product_eq]
    rw [← path_aligned_factor p ha]
    rw [hl, ← path_aligned_factor p hb]
    exact hf

/-- At a common input as well, factor and level determine the entire occurrence. -/
theorem path_factor_occurrence_unique (p : Nat → Nat) {j n : Nat} {a b : Occurrence}
    (ha : Path p j n a) (hb : Path p j n b) (hl : a.level = b.level)
    (hp : ∀ q ∈ alignedBases p j (j - a.level), Nat.Prime q)
    (hd : (alignedBases p j (j - a.level)).Nodup)
    (hf : pathFactor p j a.choices = pathFactor p j b.choices) : a = b := by
  have hc := path_factor_choices_unique p ha hb hl hp hd hf
  have hv : a.arg = b.arg := by rw [path_arg_factor p ha, path_arg_factor p hb, hf]
  cases a; cases b; simp_all

#print axioms aligned_product_eq
#print axioms path_factor_choices_unique
#print axioms path_factor_occurrence_unique
end RenewalOccurrenceIndex
