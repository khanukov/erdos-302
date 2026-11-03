import Node1190LeafBridge

/- Generic, occurrence-preserving folds for the concrete dual certificate.
   This is a candidate until checked by Lean in the hosted workflow. -/
namespace Node1190ComponentFold
open scoped BigOperators

/-- A property proved at every list position holds for every list member.
    `getD` is only used in range, so the default never supplies evidence. -/
theorem list_all_of_positions {α : Type} (P : α → Prop) (d : α)
    (xs : List α) (h : ∀ i, i < xs.length → P (xs.getD i d)) :
    ∀ x ∈ xs, P x := by
  induction xs with
  | nil => simp
  | cons a as ih =>
    intro x hx
    simp only [List.mem_cons] at hx
    rcases hx with rfl | hx
    · simpa using h 0 (by simp)
    · apply ih
      · intro i hi
        simpa using h (i + 1) (by simp; omega)
      · exact hx

/-- An in-range reference position supplies a row in the mapped list. -/
theorem mapped_getD_mem {α β : Type} (xs : List α) (d : α) (f : α → β)
    (i : ℕ) (hi : i < xs.length) : f (xs.getD i d) ∈ xs.map f := by
  apply List.mem_map.mpr
  refine ⟨xs.getD i d, ?_, rfl⟩
  induction xs generalizing i with
  | nil => simp at hi
  | cons a as ih =>
    cases i with
    | zero => simp
    | succ i =>
      simp only [List.length_cons, Nat.succ_lt_succ_iff] at hi
      simp only [List.getD, List.mem_cons]
      exact Or.inr (ih i hi)

/-- Fold a predicate over the members of an enumerating list into a Finset
    bound. Duplicate enumeration entries are harmless for this membership fold. -/
theorem finset_all_of_list {α : Type} [DecidableEq α] (s : Finset α)
    (xs : List α) (P : α → Prop)
    (cover : ∀ x ∈ s, x ∈ xs) (h : ∀ x ∈ xs, P x) :
    ∀ x ∈ s, P x := by
  intro x hx
  exact h x (cover x hx)

/-- Assemble a leaf from occurrence witnesses, not from the leaf check itself. -/
theorem leaf_from_positions (refs : List MixedCaseTrimCandidate.Ref)
    (default : MixedCaseTrimCandidate.Ref)
    (nodes : ℕ → MixedDag.Node MixedCaseTrimCandidate.Payload) (node : ℕ)
    (T O Z : Finset ℕ) (k : ℕ) (es : List (BankCase.WeightedRow ℕ)) (D : ℤ)
    (rowpos : ∀ i ∈ Finset.range es.length, ∃ j, j < refs.length ∧
      (BankCase.dualEntry es i).1 = MixedCaseTrimCandidate.row nodes node (refs.getD j default))
    (hD : 0 < D)
    (hw : ∀ i ∈ Finset.range es.length, 0 < (BankCase.dualEntry es i).2)
    (hcap : ∀ x ∈ BankCase.Free T O Z,
      (∑ i ∈ (Finset.range es.length).filter
        (fun i => x ∈ (BankCase.dualEntry es i).1.1), (BankCase.dualEntry es i).2) ≤ D)
    (hobj : D * ((k : ℤ) - 1 - (O.card : ℤ)) <
      ∑ i ∈ Finset.range es.length, (BankCase.dualEntry es i).2 *
        BankCase.Remaining (BankCase.dualEntry es i).1.1 (BankCase.dualEntry es i).1.2 O) :
    BankCase.check (refs.map (MixedCaseTrimCandidate.row nodes node)) T O Z k
      (.dual es D) = true := by
  apply Node1190Dual.leaf_from_components _ _ _ _ _ _ _ ?_ hD hw hcap hobj
  intro i hi
  obtain ⟨j, hj, heq⟩ := rowpos i hi
  rw [heq]
  exact mapped_getD_mem refs default (MixedCaseTrimCandidate.row nodes node) j hj

#print axioms leaf_from_positions
#print axioms list_all_of_positions
#print axioms mapped_getD_mem
#print axioms finset_all_of_list
end Node1190ComponentFold
