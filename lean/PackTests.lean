import PackRule

open Finset UpperBridge
open scoped BigOperators
namespace ArchivePackTests

-- Image 4 in the baseline archive is [node 0, 1, 1]. Its weight in
-- pack node 1094 (the fourth pack node) is 158, and its demand is 1.
def row4 : Finset ℕ := ArchiveScaling.image {2, 3, 6} 1 1

theorem image4_bound : Extended.Bound row4 1 := by
  apply ArchivePack.scaled_bound (U := {2, 3, 6}) (m := 1) (d := 1)
  · decide
  · decide
  · intro x hx
    simp
  · exact Extended.edge_0

def rows : Fin 1 → Finset ℕ := fun _ => row4

theorem one_row_valid : ArchivePack.Valid Finset.univ rows (fun _ => 158)
    (fun _ => 1) 1000 1 row4 := by
  decide

theorem image4_pack : Extended.Bound row4 1 := by
  apply ArchivePack.sound Finset.univ rows (fun _ => 158) (fun _ => 1) 1000 1 row4
  · exact one_row_valid
  · intro i hi
    exact image4_bound

-- The demand is essential: changing it from 1 to 0 invalidates rounding.
example : ¬ ArchivePack.Valid Finset.univ rows (fun _ => 158)
    (fun _ => 0) 1000 1 row4 := by decide
-- Capacity must be checked on the row support, even if a selected set misses it.
example : ¬ ArchivePack.Valid Finset.univ rows (fun _ => 1001)
    (fun _ => 1) 1000 1 row4 := by decide
example : ¬ ArchivePack.Valid Finset.univ rows (fun _ => 158)
    (fun _ => 1) 0 1 row4 := by decide

#print axioms image4_pack
end ArchivePackTests
