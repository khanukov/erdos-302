import MixedDag
open Finset UpperBridge MixedDag

-- Two occurrences of the same predecessor survive indexing; node 2 uses node 1.
def testRows (i : Fin 2) : Row := if i.val = 0 then ⟨0,1,1,1⟩ else ⟨0,4,1,1⟩
def testNodes (i : ℕ) : Node PUnit :=
  if i = 0 then ⟨{2,3,6}, 1, .edge 2 3 6⟩ else
  if i = 1 then ⟨{2,3,6,8,12,24}, 2, .pack 2 testRows 1⟩ else
  ⟨{2,3,6,8,12,24}, 2, .pack 1 (fun _ => ⟨1,1,1,1⟩) 1⟩
def noExtra (_ : ℕ → Node PUnit) (_ : ℕ) (_ : PUnit) : Prop := False
instance (ns : ℕ → Node PUnit) (i : ℕ) (e : PUnit) : Decidable (noExtra ns i e) := isFalse id
example : ∀ i < 3, Check noExtra testNodes i := by decide
example : Extended.Bound {2,3,6,8,12,24} 2 := by
  have h := sound noExtra (by intro ns i e h; exact False.elim h) testNodes 3 (by decide) 2 (by decide)
  simpa [testNodes] using h

def overlap (_ : Fin 2) : Row := ⟨0,1,1,1⟩
def single (r : Row) (D : ℕ) : ℕ → Node PUnit := fun i =>
  if i = 0 then ⟨{2,3,6}, 1, .edge 2 3 6⟩ else ⟨{2,3,6}, 1, .pack 1 (fun _ => r) D⟩
def repeated (D : ℕ) : ℕ → Node PUnit := fun i =>
  if i = 0 then ⟨{2,3,6}, 1, .edge 2 3 6⟩ else ⟨{2,3,6}, 1, .pack 2 overlap D⟩
example : Check noExtra (repeated 2) 1 := by decide
example : ¬ Check noExtra (repeated 1) 1 := by decide
example : Check noExtra (single ⟨0,2,2,1⟩ 1) 1 := by decide
example : ¬ Check noExtra (single ⟨0,1,2,1⟩ 1) 1 := by decide
example : ¬ Check noExtra (single ⟨0,0,1,1⟩ 1) 1 := by decide
example : ¬ Check noExtra (single ⟨0,1,0,1⟩ 1) 1 := by decide
example : ¬ Check noExtra (single ⟨1,1,1,1⟩ 1) 1 := by decide
example : ¬ Check noExtra (single ⟨2,1,1,1⟩ 1) 1 := by decide
example : ¬ Check noExtra (single ⟨0,1,1,1⟩ 0) 1 := by decide
#print axioms MixedDag.sound
