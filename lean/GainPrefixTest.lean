import GainPrefix
open GainPrefix

def sample : List (Level Nat Nat) :=
  [⟨3, [2, 2]⟩, ⟨2, []⟩, ⟨5, [2]⟩]
def upd (d p : Nat) := d * p
def wt (d c : Nat) := d * c

example : entriesFrom [] sample = [([], 2), ([], 2), ([3, 2], 2)] := by decide
example : (entriesFrom [] sample).map (fun e => wt (e.1.foldl upd 1) e.2) = [2, 2, 12] := by decide
example : (sample.foldl (GainFold.step (next upd) (emit wt) Nat.add) (1, 0)).2 = 16 := by
  rw [show (1 : Nat) = ([] : List Nat).foldl upd 1 from rfl,
    fold_eq_prefix_entries]
  decide
example : entriesFrom [7] ([] : List (Level Nat Nat)) = [] := by decide
example : entriesFrom [] sample ≠ [([], 2), ([3, 2], 2)] := by decide
#print axioms GainPrefix.fold_eq_prefix_entries
