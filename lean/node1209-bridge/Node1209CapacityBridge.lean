import Node1209CapacityAll
import PackRule
import Mathlib.Algebra.BigOperators.Fin

/-! Candidate bridge: every list position remains a distinct Fin index. -/
open Finset
open scoped BigOperators
namespace Node1209CapacityBridge

def load (rows : List (Finset ℕ × ℕ)) (x : ℕ) : ℕ :=
  (rows.map (fun r => if x ∈ r.1 then r.2 else 0)).sum

theorem load_eq_indexed (rows : List (Finset ℕ × ℕ)) (x : ℕ) :
    load rows x = ∑ i ∈ Finset.univ.filter (fun i : Fin rows.length =>
      x ∈ (rows.get i).1), (rows.get i).2 := by
  rw [Finset.sum_filter]
  simpa [load, List.get_eq_getElem] using
    (Fin.sum_univ_fun_getElem rows (fun r => if x ∈ r.1 then r.2 else 0)).symm

theorem valid_of_load (rows : List (Finset ℕ × ℕ))
    (r : Fin rows.length → ℕ) (D k : ℕ) (support : Finset ℕ)
    (hD : 0 < D)
    (hsub : ∀ i : Fin rows.length, (rows.get i).1 ⊆ support)
    (hcap : ∀ x ∈ support, load rows x ≤ D)
    (hround : D * (k - 1) < ∑ i : Fin rows.length, (rows.get i).2 * r i) :
    ArchivePack.Valid Finset.univ (fun i => (rows.get i).1)
      (fun i => (rows.get i).2) r D k support := by
  refine ⟨hD, ?_, ?_, hround⟩
  · intro i _
    exact hsub i
  · intro x hx
    rw [← load_eq_indexed]
    exact hcap x hx

/-- The capacity premise is supplied by the complete candidate capacity assembly;
    containment and strict rounding are explicit, not a validity assumption. -/
theorem node1209_valid
    (r : Fin Node1209CapacityData.rows.length → ℕ) (k : ℕ)
    (hsub : ∀ i : Fin Node1209CapacityData.rows.length,
      (Node1209CapacityData.rows.get i).1 ⊆ Node1209CapacityData.target)
    (hround : 1001 * (k - 1) < ∑ i : Fin Node1209CapacityData.rows.length,
      (Node1209CapacityData.rows.get i).2 * r i) :
    ArchivePack.Valid Finset.univ
      (fun i => (Node1209CapacityData.rows.get i).1)
      (fun i => (Node1209CapacityData.rows.get i).2)
      r 1001 k Node1209CapacityData.target := by
  apply valid_of_load Node1209CapacityData.rows r 1001 k Node1209CapacityData.target
  · decide
  · exact hsub
  · exact Node1209CapacityAll.capacity
  · exact hround

#print axioms load_eq_indexed
#print axioms valid_of_load
#print axioms node1209_valid
end Node1209CapacityBridge
