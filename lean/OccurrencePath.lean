import OccurrenceIndex

/-! Dynamic exponent paths for the actual occurrence recursion.  Positions are
indices in the original list; equality of arguments does not identify them. -/
namespace RenewalOccurrenceIndex

inductive Path (p : Nat → Nat) : Nat → Nat → Occurrence → Prop where
  | stop (j n k : Nat) (bound : k < n) :
      Path p (j + 1) n { level := j, choices := [k], arg := n / p j ^ k }
  | next (j n k : Nat) (a : Occurrence) (bound : k < n)
      (tail : Path p j (n / p j ^ k) a) :
      Path p (j + 1) n (prependChoice k a)

theorem path_mem (p : Nat → Nat) {j n : Nat} {a : Occurrence}
    (h : Path p j n a) : a ∈ occurrences p j n := by
  induction h with
  | stop j n k bound =>
      simp only [occurrences, List.mem_flatMap, List.mem_range, List.mem_append,
        List.mem_map, List.mem_singleton]
      exact ⟨k, bound, Or.inr rfl⟩
  | next j n k a bound tail ih =>
      simp only [occurrences, List.mem_flatMap, List.mem_range, List.mem_append,
        List.mem_map, List.mem_singleton]
      exact ⟨k, bound, Or.inl ⟨a, ih, rfl⟩⟩

theorem mem_path (p : Nat → Nat) (j n : Nat) (a : Occurrence)
    (h : a ∈ occurrences p j n) : Path p j n a := by
  induction j generalizing n a with
  | zero => simp [occurrences] at h
  | succ j ih =>
      simp only [occurrences, List.mem_flatMap, List.mem_range, List.mem_append,
        List.mem_map, List.mem_singleton] at h
      obtain ⟨k, hk, hm | he⟩ := h
      · obtain ⟨b, hb, rfl⟩ := hm
        exact .next j n k b hk (ih _ _ hb)
      · subst a
        exact .stop j n k hk

theorem occurrence_position_path (p : Nat → Nat) (j n : Nat)
    (i : Fin (occurrences p j n).length) :
    Path p j n ((occurrences p j n)[i]) := by
  apply mem_path
  exact List.getElem_mem _

theorem path_shape (p : Nat → Nat) {j n : Nat} {a : Occurrence}
    (h : Path p j n a) : a.level < j ∧ a.choices.length = j - a.level := by
  induction h with
  | stop j n k bound => simp
  | next j n k a bound tail ih =>
      simp only [prependChoice, List.length_cons]
      omega

#print axioms path_shape
#print axioms path_mem
#print axioms mem_path
#print axioms occurrence_position_path
end RenewalOccurrenceIndex
