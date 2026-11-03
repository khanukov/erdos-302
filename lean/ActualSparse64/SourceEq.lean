import ActualSparse64.Data
import ExtensionBoundaryData

namespace ActualSparse64
set_option maxRecDepth 100000
set_option maxHeartbeats 40000000

/-- A literal-shaped fold: unlike `toFinset`, it does not decide membership. -/
def literalFinset {α : Type} [DecidableEq α] : List α → Finset α
  | [] => ∅
  | [a] => {a}
  | a :: b :: xs => insert a (literalFinset (b :: xs))

/-- The literal-shaped fold and `List.toFinset` represent the same set. -/
theorem literalFinset_eq_toFinset {α : Type} [DecidableEq α] (xs : List α) :
    literalFinset xs = xs.toFinset := by
  induction xs with
  | nil => simp [literalFinset]
  | cons a xs ih =>
      cases xs with
      | nil => simp [literalFinset]
      | cons b xs =>
          simpa only [literalFinset, List.toFinset_cons] using congrArg (insert a) ih

theorem source_eq : S.toFinset = ExtensionFirstArchive.source := by
  rw [← literalFinset_eq_toFinset]
  rfl
#print axioms source_eq
end ActualSparse64
