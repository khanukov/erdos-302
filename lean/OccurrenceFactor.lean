import OccurrenceUnique

/-! Interpret a dynamic path as the product of its successive prime powers.
No primality or positivity assumptions are needed for the quotient identity. -/
namespace RenewalOccurrenceIndex

def pathFactor (p : Nat → Nat) : Nat → List Nat → Nat
  | 0, _ => 1
  | _ + 1, [] => 1
  | j + 1, k :: ks => p j ^ k * pathFactor p j ks

@[simp] theorem pathFactor_nil (p : Nat → Nat) (j : Nat) : pathFactor p j [] = 1 := by
  cases j <;> rfl

theorem path_arg_factor (p : Nat → Nat) {j n : Nat} {a : Occurrence}
    (h : Path p j n a) : a.arg = n / pathFactor p j a.choices := by
  induction h with
  | stop j n k bound => simp [pathFactor]
  | next j n k a bound tail ih =>
      simp only [prependChoice, pathFactor]
      rw [ih, Nat.div_div_eq_div_mul]

/-- The level and exponent list determine the position, even when different
    encodings evaluate to the same argument (or the same numerical factor). -/
theorem path_encoding_unique_position (p : Nat → Nat) {j n : Nat} {a : Occurrence}
    (h : Path p j n a) :
    ∃ i : Fin (occurrences p j n).length,
      (occurrences p j n)[i] = a ∧
      ∀ q : Fin (occurrences p j n).length,
        (occurrences p j n)[q].level = a.level →
        (occurrences p j n)[q].choices = a.choices → q = i := by
  obtain ⟨i, hi, hu⟩ := path_unique_position p h
  refine ⟨i, hi, ?_⟩
  intro q hl hc
  apply hu q
  have hq := path_arg_factor p (occurrence_position_path p j n q)
  have ha := path_arg_factor p h
  have he : (occurrences p j n)[q].arg = a.arg := by
    rw [hq, ha, hc]
  cases e : (occurrences p j n)[q] with
  | mk l c v =>
    cases a with
    | mk l' c' v' =>
      simp only [e] at hl hc he ⊢
      simp_all

/-- Every actual list position evaluates to the quotient by its encoded product. -/
theorem position_arg_factor (p : Nat → Nat) (j n : Nat)
    (i : Fin (occurrences p j n).length) :
    (occurrences p j n)[i].arg = n / pathFactor p j (occurrences p j n)[i].choices :=
  path_arg_factor p (occurrence_position_path p j n i)

#print axioms position_arg_factor
#print axioms path_arg_factor
#print axioms path_encoding_unique_position
end RenewalOccurrenceIndex
