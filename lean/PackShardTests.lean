import Pack1094Shard

open Finset UpperBridge
open scoped BigOperators

namespace PackShardTests

def rows (_ : ℕ) : Finset ℕ := {2, 3}

theorem composed_valid : ArchivePack.Valid ({0} : Finset ℕ)
    rows (fun _ => 2) (fun _ => 1) 2 1 {2, 3} := by
  apply ArchivePack.valid_of_capacity_shards ({0} : Finset ℕ)
    rows (fun _ => 2) (fun _ => 1) 2 1 {2, 3} (fun s x : ℕ => s = x)
  · decide
  · decide
  · intro x hx
    exact ⟨x, rfl⟩
  · intro s x hs
    by_cases hx : x = 2 ∨ x = 3 <;> simp [rows, hx]
  · decide

-- A capacity smaller than the weight must not validate the certificate.
example : ¬ ArchivePack.Valid ({0} : Finset ℕ)
    rows (fun _ => 2) (fun _ => 1) 1 1 {2, 3} := by
  unfold ArchivePack.Valid
  decide

#print axioms composed_valid
end PackShardTests
