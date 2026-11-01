import Extended

open Finset UpperBridge
open scoped BigOperators
namespace Weighted

/-- Integer-scaled fractional packing: every row has a lower bound on the
number of selected vertices; each vertex has total row-weight at most D. -/
theorem weighted_inequality {ι α : Type*} [DecidableEq ι] [DecidableEq α]
    (I : Finset ι) (T : ι → Finset α) (w r : ι → ℕ) (D : ℕ)
    (S : Finset α)
    (hrow : ∀ i ∈ I, r i ≤ (S ∩ T i).card)
    (hcap : ∀ x ∈ S, (∑ i ∈ I.filter (fun i => x ∈ T i), w i) ≤ D) :
    (∑ i ∈ I, w i * r i) ≤ D * S.card := by
  calc
    (∑ i ∈ I, w i * r i) ≤ ∑ i ∈ I, w i * (S ∩ T i).card := by
      exact Finset.sum_le_sum (fun i hi => Nat.mul_le_mul_left _ (hrow i hi))
    _ = ∑ x ∈ S, ∑ i ∈ I.filter (fun i => x ∈ T i), w i := by
      simp only [Finset.sum_filter]
      rw [Finset.sum_comm]
      apply Finset.sum_congr rfl
      intro i hi
      rw [← Finset.sum_filter]
      have heq : S.filter (fun x => x ∈ T i) = S ∩ T i := by ext x; simp
      rw [heq]
      simp [Nat.mul_comm]
    _ ≤ ∑ _x ∈ S, D := Finset.sum_le_sum hcap
    _ = D * S.card := by simp [Nat.mul_comm]

/-- Exact integer rounding, without division or any assumption that D is positive:
D*(k-1) < objective forces k selected vertices. -/
theorem weighted_bound {ι α : Type*} [DecidableEq ι] [DecidableEq α]
    (I : Finset ι) (T : ι → Finset α) (w r : ι → ℕ) (D k : ℕ)
    (S : Finset α)
    (hrow : ∀ i ∈ I, r i ≤ (S ∩ T i).card)
    (hcap : ∀ x ∈ S, (∑ i ∈ I.filter (fun i => x ∈ T i), w i) ≤ D)
    (hround : D * (k - 1) < ∑ i ∈ I, w i * r i) : k ≤ S.card := by
  have h := weighted_inequality I T w r D S hrow hcap
  by_contra hn
  have hk : S.card ≤ k - 1 := by omega
  have := Nat.mul_le_mul_left D hk
  omega

/-- The seven arithmetic edges are the images referenced by baseline qpack 1090:
image IDs [4,8,159,0,39,208,209], all with rational weight 1. -/
def node1090Rows : Fin 7 → Finset ℕ := ![
  {2,3,6}, {14,21,42}, {16,24,48}, {4,5,20},
  {8,10,40}, {18,30,45}, {9,12,36}]

def node1090Vertices : Finset ℕ :=
  {2,3,6,14,21,42,16,24,48,4,5,20,8,10,40,18,30,45,9,12,36}

set_option maxRecDepth 8192 in
set_option maxHeartbeats 0 in
theorem node1090 (S : Finset ℕ) (h : OrderedCover node1090Vertices S) : 7 ≤ S.card := by
  apply weighted_bound Finset.univ node1090Rows (fun _ => 1) (fun _ => 1) 1 7 S
  · intro i hi
    have hsub : node1090Rows i ⊆ node1090Vertices := by
      fin_cases i <;> decide
    have hb : Extended.Bound (node1090Rows i) 1 := by
      fin_cases i <;> apply Extended.edge_bound <;> norm_num [node1090Rows, OrderedEdge]
    exact hb (S ∩ node1090Rows i) (Extended.cover_inter (Extended.cover_mono hsub h))
  · intro x hx
    by_cases hxU : x ∈ node1090Vertices
    · have hc : ∀ x ∈ node1090Vertices,
          (∑ i ∈ Finset.univ.filter (fun i => x ∈ node1090Rows i), 1) ≤ 1 := by decide
      exact hc x hxU
    · have hz : ∀ i : Fin 7, x ∉ node1090Rows i := by
        intro i hxi
        apply hxU
        have hs : node1090Rows i ⊆ node1090Vertices := by fin_cases i <;> decide
        exact hs hxi
      simp [hz]
  · decide

end Weighted
