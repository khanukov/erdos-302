import Lean

/-! Generic ordered fold expansion.  Occurrences are lists, not sets, so equal
entries at different positions are retained.  This module uses only Lean core. -/
namespace GainFold
universe u v w
variable {D : Type u} {L : Type v} {A : Type w}

def occurrences (next : D → L → D) (emit : D → L → List A) : D → List L → List A
  | _, [] => []
  | d, l :: ls => emit d l ++ occurrences next emit (next d l) ls

def step (next : D → L → D) (emit : D → L → List A)
    (add : A → A → A) (s : D × A) (l : L) : D × A :=
  (next s.1 l, (emit s.1 l).foldl add s.2)

/-- Every emitted item contributes in order; no associativity, commutativity,
    nonzero-denominator, or distinctness assumption is needed. -/
theorem fold_gain_occurrences (next : D → L → D) (emit : D → L → List A)
    (add : A → A → A) (ls : List L) (d : D) (acc : A) :
    (ls.foldl (step next emit add) (d, acc)).2 =
      (occurrences next emit d ls).foldl add acc := by
  induction ls generalizing d acc with
  | nil => rfl
  | cons l ls ih =>
    simp only [List.foldl_cons, step, ih, occurrences, List.foldl_append]

/-- The list fold is equivalently indexed by `Fin length`, preserving repeated
    values as distinct occurrences. -/
theorem fold_gain_fin (next : D → L → D) (emit : D → L → List A)
    (add : A → A → A) (ls : List L) (d : D) (acc : A) :
    (ls.foldl (step next emit add) (d, acc)).2 =
      (List.ofFn (fun i : Fin (occurrences next emit d ls).length =>
        (occurrences next emit d ls)[i.val])).foldl add acc := by
  rw [List.ofFn_getElem]
  exact fold_gain_occurrences next emit add ls d acc

/-- A state projection transports the expansion to an implementation with extra
    state fields.  The premise is a one-step simulation, not an aggregate
    gain equality. -/
theorem fold_project {S : Type _} (run : S → L → S) (project : S → D × A)
    (next : D → L → D) (emit : D → L → List A) (add : A → A → A)
    (hstep : ∀ s l, project (run s l) = step next emit add (project s) l)
    (ls : List L) (s : S) :
    (project (ls.foldl run s)).2 =
      (occurrences next emit (project s).1 ls).foldl add (project s).2 := by
  have hfold : ∀ (xs : List L) (s : S),
      project (xs.foldl run s) = xs.foldl (step next emit add) (project s) := by
    intro xs
    induction xs with
    | nil => intro s; rfl
    | cons x xs ih =>
      intro s
      simp only [List.foldl_cons, ih, hstep]
  rw [hfold]
  exact fold_gain_occurrences next emit add ls (project s).1 (project s).2

#print axioms fold_gain_occurrences
#print axioms fold_gain_fin
#print axioms fold_project
end GainFold
