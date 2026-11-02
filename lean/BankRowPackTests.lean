import BankRowPack
open Finset UpperBridge ArchiveDag BankRowPack

-- One genuine edge; two distinct occurrences of it, one scaled by 4.
def nodes : ℕ → ArchiveDag.Node := fun _ => ⟨{2,3,6}, 1, .edge 2 3 6⟩
def rows (i : Fin 2) : Row := if i.val = 0 then ⟨0,1,1,1⟩ else ⟨0,4,1,1⟩
def overlap (i : Fin 2) : Row := ⟨0,1,1,1⟩
example : ArchiveDag.Check nodes 0 := by decide
example : BankRowPack.Check nodes 1 2 rows 1 2 {2,3,6,8,12,24} := by decide
example : Extended.Bound {2,3,6,8,12,24} 2 := by
  apply BankRowPack.sound nodes 1 2 rows 1 2 {2,3,6,8,12,24} (by decide) (by decide)
-- Exact nontrivial division preserves the edge.
example : BankRowPack.Check nodes 1 1 (fun _ => ⟨0,2,2,1⟩) 1 1 {2,3,6} := by decide
-- Repeated rows must consume capacity twice, not be deduplicated.
example : BankRowPack.Check nodes 1 2 overlap 2 1 {2,3,6} := by decide
example : ¬ BankRowPack.Check nodes 1 2 overlap 1 1 {2,3,6} := by decide
-- Strict rounding, support, integrality, positivity, and backward reference.
example : ¬ BankRowPack.Check nodes 1 1 (fun _ => ⟨0,1,0,1⟩) 1 1 {2,3,6} := by decide
example : ¬ BankRowPack.Check nodes 1 1 (fun _ => ⟨0,1,1,1⟩) 0 1 {2,3,6} := by decide
example : ¬ BankRowPack.Check nodes 1 2 rows 1 3 {2,3,6,8,12,24} := by decide
example : ¬ BankRowPack.Check nodes 1 2 rows 1 2 {2,3,4,6} := by decide
example : ¬ BankRowPack.Check nodes 0 2 rows 1 2 {2,3,6,8,12,24} := by decide
example : ¬ BankRowPack.Check nodes 1 1 (fun _ => ⟨0,1,2,1⟩) 1 1 {1,2,3} := by decide
example : ¬ BankRowPack.Check nodes 1 1 (fun _ => ⟨0,0,1,1⟩) 1 1 {0} := by decide
example : ¬ BankRowPack.Check nodes 1 0 (fun i => Fin.elim0 i) 1 1 ∅ := by decide
#print axioms BankRowPack.sound
