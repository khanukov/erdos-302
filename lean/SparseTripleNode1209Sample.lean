import SparseTriple

/-! Bounded literal sample from the node-1209 extension data. This is not a
proof that these literals correspond to the archive or that the full node is
covered. -/
namespace SparseTripleNode1209Sample
open SparseTriple

def source : List Nat := [118, 122, 177, 183, 354, 366]
def outside : List Nat := [118, 122, 177, 183]
def cover : List Nat := [354, 366]

example : (118,177,354) ∈ candidates source outside := by decide
example : (122,183,366) ∈ candidates source outside := by decide
example : (118,177,366) ∉ candidates source outside := by decide
example : ∀ t ∈ candidates source outside,
    t.1 ∈ cover ∨ t.2.1 ∈ cover ∨ t.2.2 ∈ cover := by decide
example : ¬ (∀ t ∈ candidates source outside,
    t.1 ∈ [366] ∨ t.2.1 ∈ [366] ∨ t.2.2 ∈ [366]) := by decide
end SparseTripleNode1209Sample
