import GainFold

/-! Occurrence-preserving prefix instantiation, independent of algebraic laws. -/
namespace GainPrefix
universe u v w x
variable {P : Type u} {C : Type v} {D : Type w} {A : Type x}

structure Level (P : Type u) (C : Type v) where
  prime : P
  cells : List C

def entriesFrom (prior : List P) : List (Level P C) → List (List P × C)
  | [] => []
  | l :: ls => l.cells.map (fun c => (prior, c)) ++ entriesFrom (prior ++ [l.prime]) ls

def next (update : D → P → D) (d : D) (l : Level P C) : D := update d l.prime

def emit (weight : D → C → A) (d : D) (l : Level P C) : List A :=
  l.cells.map (weight d)

/-- The density carried by the fold equals the density obtained by folding the
    whole prior prefix, for arbitrary update, initial density, and cell lists. -/
theorem occurrences_eq_prefix_entries (update : D → P → D) (weight : D → C → A)
    (initial : D) (prior : List P) (levels : List (Level P C)) :
    GainFold.occurrences (next update) (emit weight) (prior.foldl update initial) levels =
      (entriesFrom prior levels).map (fun e => weight (e.1.foldl update initial) e.2) := by
  induction levels generalizing prior with
  | nil => rfl
  | cons l ls ih =>
    have h := ih (prior ++ [l.prime])
    simp only [List.foldl_append, List.foldl_cons, List.foldl_nil] at h
    simp only [GainFold.occurrences, entriesFrom, List.map_append, List.map_map,
      emit, next, h, Function.comp_def]

/-- The concrete fold is a fold over cell occurrences annotated with the full
    preceding prime prefix. No matching of aggregate gain is assumed. -/
theorem fold_eq_prefix_entries (update : D → P → D) (weight : D → C → A)
    (add : A → A → A) (initial : D) (prior : List P)
    (levels : List (Level P C)) (acc : A) :
    (levels.foldl (GainFold.step (next update) (emit weight) add)
      (prior.foldl update initial, acc)).2 =
      ((entriesFrom prior levels).map
        (fun e => weight (e.1.foldl update initial) e.2)).foldl add acc := by
  rw [GainFold.fold_gain_occurrences, occurrences_eq_prefix_entries]

#print axioms occurrences_eq_prefix_entries
#print axioms fold_eq_prefix_entries
end GainPrefix
