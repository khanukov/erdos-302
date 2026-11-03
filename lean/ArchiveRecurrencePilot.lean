import ArchiveLedger

/-! Bounded data-only candidate. The profile literals were reconstructed from
archive correction cells, not independently proved graph demands. The checker
uses the actual ArchiveLedger.ledger cells; no recurrence hypothesis occurs.
External archive correspondence is checked by Python, not by Lean. -/
namespace ArchiveRecurrencePilot
open ArchiveLedger

set_option maxRecDepth 100000
set_option maxHeartbeats 8000000

def parent : List Nat := List.replicate 81 0

def current : List Nat := [0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5]

def level : ArchiveLedger.Level := ArchiveLedger.ledger.getD 1 ⟨0, []⟩
def correction (n : Nat) : Nat :=
  (level.cells.map fun c => if c.a ≤ n ∧ n < c.b then c.height else 0).sum

def equation (n : Nat) : Prop :=
  current.getD n 0 = parent.getD n 0 + current.getD (n / level.prime) 0 + correction n

instance (n : Nat) : Decidable (equation n) := by
  unfold equation
  infer_instance

/-- Includes all indices used by quotient lookups, excluding default padding. -/
theorem input_shape : parent.length = 81 ∧ current.length = 81 ∧
    level.prime = 2 ∧ current.getD 0 0 = 0 ∧ parent.getD 0 0 = 0 := by
  decide +kernel

/-- All 80 positive inputs in the shard, including gaps and cell boundaries. -/
theorem recurrence : ∀ n ∈ Finset.Icc 1 80, equation n := by
  decide +kernel

#print axioms input_shape
#print axioms recurrence
end ArchiveRecurrencePilot
