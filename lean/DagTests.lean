import Dag

open Finset UpperBridge ArchiveDag

-- A real edge, then an exact image, then a one-row weighted pack.
def sample : ℕ → Node
  | 0 => ⟨{2,3,6}, 1, .edge 2 3 6⟩
  | 1 => ⟨{2,3,6}, 1, .image 0 1 1⟩
  | _ => ⟨{2,3,6}, 1, .pack {1} (fun _ => 1) 1⟩

example : Check sample 0 := by decide
example : Check sample 1 := by decide
example : Check sample 2 := by decide
example : Extended.Bound (sample 2).support (sample 2).demand := by
  apply sound sample 3 (by decide) 2 (by decide)

-- Forward and self references must not be accepted.
def badSelf : ℕ → Node := fun _ => ⟨{2,3,6}, 1, .image 0 1 1⟩
example : ¬ Check badSelf 0 := by decide

def badImage : ℕ → Node
  | 0 => ⟨{2,3,6}, 1, .edge 2 3 6⟩
  | _ => ⟨{1,2,3}, 1, .image 0 1 2⟩
example : ¬ Check badImage 1 := by decide

def badPack : ℕ → Node
  | 0 => ⟨{2,3,6}, 1, .edge 2 3 6⟩
  | _ => ⟨{2,3,6}, 1, .pack {0} (fun _ => 2) 1⟩
example : ¬ Check badPack 1 := by decide

def futurePack : ℕ → Node := fun _ => ⟨{2,3,6}, 1, .pack {1} (fun _ => 1) 1⟩
example : ¬ Check futurePack 0 := by decide

-- Exhaustive finite cover leaf and an impossible advertised demand.
def smallGood : ℕ → Node := fun _ => ⟨{2,3,6}, 1, .small⟩
def smallBad : ℕ → Node := fun _ => ⟨{2,3,6}, 2, .small⟩
example : Check smallGood 0 := by decide
example : ¬ Check smallBad 0 := by decide

#print axioms ArchiveDag.sound
