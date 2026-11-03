import Node1190DualData

/- This is a decomposition of the executable Boolean check, not an assertion
   that the concrete node satisfies its premises. Occurrences remain indexed. -/
namespace Node1190Dual
open Finset
open scoped BigOperators
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000

theorem leaf_from_components (rows : List (BankCase.Constraint ℕ))
    (T O Z : Finset ℕ) (k : ℕ) (es : List (BankCase.WeightedRow ℕ)) (D : ℤ)
    (hrows : ∀ i ∈ Finset.range es.length, (BankCase.dualEntry es i).1 ∈ rows)
    (hD : 0 < D)
    (hw : ∀ i ∈ Finset.range es.length, 0 < (BankCase.dualEntry es i).2)
    (hcap : ∀ x ∈ BankCase.Free T O Z,
      (∑ i ∈ (Finset.range es.length).filter
        (fun i => x ∈ (BankCase.dualEntry es i).1.1), (BankCase.dualEntry es i).2) ≤ D)
    (hobj : D * ((k : ℤ) - 1 - (O.card : ℤ)) <
      ∑ i ∈ Finset.range es.length, (BankCase.dualEntry es i).2 *
        BankCase.Remaining (BankCase.dualEntry es i).1.1 (BankCase.dualEntry es i).1.2 O) :
    BankCase.check rows T O Z k (.dual es D) = true := by
  simp only [BankCase.check, Bool.and_eq_true, BankCase.dualCheck, decide_eq_true_eq]
  exact ⟨hrows, hD, hw, hcap, hobj⟩
#print axioms leaf_from_components

example : BankCase.check [({0}, 1), ({1}, 1)] ({0, 1} : Finset ℕ) ∅ ∅ 2
    (.dual [(({0}, 1), 1), (({1}, 1), 1)] 1) = true := by
  apply leaf_from_components <;> decide

-- Duplicate occurrences count twice, so the shared vertex exceeds capacity.
example : BankCase.check [({0}, 1)] ({0} : Finset ℕ) ∅ ∅ 2
    (.dual [(({0}, 1), 1), (({0}, 1), 1)] 1) = false := by decide
end Node1190Dual
