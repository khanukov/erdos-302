import BankRowPack

/- Generated from pinned archive node 1090; see audit/bank-row-pack/ARCHIVE1090.md. -/
open Finset UpperBridge
namespace BankRowPackArchive1090

def nodes (i : ℕ) : ArchiveDag.Node :=
  if i = 0 then ⟨{2,3,6}, 1, .edge 2 3 6⟩ else
  if i = 2 then ⟨{4,5,20}, 1, .edge 4 5 20⟩ else
  if i = 3 then ⟨{6,10,15}, 1, .edge 6 10 15⟩ else
  if i = 17 then ⟨{3,4,12}, 1, .edge 3 4 12⟩ else
  ⟨{2,3,6}, 1, .edge 2 3 6⟩

def rows (i : Fin 7) : BankRowPack.Row :=
  if i.val = 0 then ⟨0,1,1,1⟩ else -- archive image 4
  if i.val = 1 then ⟨0,7,1,1⟩ else -- archive image 8
  if i.val = 2 then ⟨0,8,1,1⟩ else -- archive image 159
  if i.val = 3 then ⟨2,1,1,1⟩ else -- archive image 0
  if i.val = 4 then ⟨2,2,1,1⟩ else -- archive image 39
  if i.val = 5 then ⟨3,3,1,1⟩ else -- archive image 208
  ⟨17,3,1,1⟩ -- archive image 209

def support : Finset ℕ := {2,3,4,5,6,8,9,10,12,14,16,18,20,21,24,30,36,40,42,45,48}

theorem prior (i : ℕ) : ArchiveDag.Check nodes i := by
  unfold ArchiveDag.Check nodes
  split_ifs <;> decide

theorem checked : BankRowPack.Check nodes 1090 7 rows 1 7 support := by
  decide

theorem bound : Extended.Bound support 7 := by
  apply BankRowPack.sound nodes 1090 7 rows 1 7 support
  · intro i hi; exact prior i
  · exact checked

#print axioms BankRowPackArchive1090.prior
#print axioms BankRowPackArchive1090.checked
#print axioms BankRowPackArchive1090.bound
end BankRowPackArchive1090
