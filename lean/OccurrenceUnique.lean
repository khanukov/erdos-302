import OccurrencePath

namespace RenewalOccurrenceIndex

/-- Encoding, rather than the evaluated argument, distinguishes every position.
    This is stronger than the intended divisor > 1 setting: no condition on p is needed. -/
theorem occurrences_nodup (p : Nat → Nat) (j n : Nat) :
    (occurrences p j n).Nodup := by
  induction j generalizing n with
  | zero => simp [occurrences]
  | succ j ih =>
    simp only [occurrences]
    rw [List.nodup_iff_pairwise_ne, List.pairwise_flatMap]
    constructor
    · intro k hk
      rw [List.pairwise_append]
      refine ⟨?_, by simp, ?_⟩
      · rw [List.pairwise_map]
        apply (ih (n / p j ^ k)).imp
        intro a b hab heq
        apply hab
        cases a with
        | mk al ac aa =>
          cases b with
          | mk bl bc ba =>
            simp only [prependChoice, Occurrence.mk.injEq, List.cons.injEq] at heq
            simp_all
      · intro x hx y hy heq
        simp only [List.mem_map] at hx
        obtain ⟨a, ha, rfl⟩ := hx
        simp only [List.mem_singleton] at hy
        have hs := path_shape p (mem_path p j (n / p j ^ k) a ha)
        have hl := congrArg Occurrence.level (heq.trans hy)
        simp [prependChoice] at hl
        omega
    · apply List.Pairwise.imp _ (List.nodup_range : (List.range n).Nodup)
      intro k l hkl x hx y hy heq
      have first : ∀ z ∈ (occurrences p j (n / p j ^ k)).map (prependChoice k) ++
          [{ level := j, choices := [k], arg := n / p j ^ k }],
          z.choices.head? = some k := by
        intro z hz
        simp only [List.mem_append, List.mem_map, List.mem_singleton] at hz
        rcases hz with ⟨a, _, rfl⟩ | rfl <;> rfl
      have second : ∀ z ∈ (occurrences p j (n / p j ^ l)).map (prependChoice l) ++
          [{ level := j, choices := [l], arg := n / p j ^ l }],
          z.choices.head? = some l := by
        intro z hz
        simp only [List.mem_append, List.mem_map, List.mem_singleton] at hz
        rcases hz with ⟨a, _, rfl⟩ | rfl <;> rfl
      have e := congrArg (fun z : Occurrence => z.choices.head?) heq
      rw [first x hx, second y hy] at e
      exact hkl (Option.some.inj e)

theorem path_unique_position (p : Nat → Nat) {j n : Nat} {a : Occurrence}
    (h : Path p j n a) : ∃ i : Fin (occurrences p j n).length,
      (occurrences p j n)[i] = a ∧ ∀ q : Fin (occurrences p j n).length,
        (occurrences p j n)[q] = a → q = i := by
  have hm := path_mem p h
  obtain ⟨i, hi, hv⟩ := List.mem_iff_getElem.mp hm
  refine ⟨⟨i, hi⟩, hv, ?_⟩
  intro q hq
  apply Fin.ext
  apply (List.getElem?_inj q.isLt (occurrences_nodup p j n)).mp
  simp only [List.getElem?_eq_getElem hi, List.getElem?_eq_getElem q.isLt, hv]
  exact congrArg some hq

#print axioms occurrences_nodup
#print axioms path_unique_position
end RenewalOccurrenceIndex
