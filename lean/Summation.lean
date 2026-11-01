import Mathlib.Data.Real.Basic
import Mathlib.Order.Interval.Finset.Nat
import Mathlib.Tactic

/-! A finite aggregation step for the archive's global renewal sum.
The analytic rough-count estimate and the renewal expansion are explicit inputs,
not proved here. Every sum is finite and heights are nonnegative. -/
namespace ArchiveSummation
open Finset

variable {ι : Type*} [DecidableEq ι]

noncomputable def weightedCount (s : Finset ι) (h : ι → ℝ) (count : ι → ℝ) : ℝ :=
  ∑ i ∈ s, h i * count i

noncomputable def weightedIdeal (s : Finset ι) (h ideal : ι → ℝ) : ℝ :=
  ∑ i ∈ s, h i * ideal i

noncomputable def weightedError (s : Finset ι) (h error : ι → ℝ) : ℝ :=
  ∑ i ∈ s, h i * error i

/-- Independent per-cell lower error estimates aggregate with nonnegative heights.
No independence, distinctness or completeness of cells is assumed here. -/
theorem weightedCount_lower (s : Finset ι) (h count ideal error : ι → ℝ)
    (hh : ∀ i ∈ s, 0 ≤ h i)
    (hc : ∀ i ∈ s, ideal i - error i ≤ count i) :
    weightedIdeal s h ideal - weightedError s h error ≤ weightedCount s h count := by
  unfold weightedIdeal weightedError weightedCount
  rw [← Finset.sum_sub_distrib]
  apply Finset.sum_le_sum
  intro i hi
  have hmul := mul_le_mul_of_nonneg_left (hc i hi) (hh i hi)
  simpa only [mul_sub] using hmul

/-- An abstract cover accounting inequality plus cell estimates yields the
finite global upper bound. `hcover` is precisely the missing renewal/block
lower-bound input; it is not the desired upper bound with the same ledger. -/
theorem global_upper (s : Finset ι) (h count ideal error : ι → ℝ) (N f : ℝ)
    (hh : ∀ i ∈ s, 0 ≤ h i)
    (hc : ∀ i ∈ s, ideal i - error i ≤ count i)
    (hcover : f + weightedCount s h count ≤ N) :
    f ≤ N - weightedIdeal s h ideal + weightedError s h error := by
  have hb := weightedCount_lower s h count ideal error hh hc
  linarith

/-- Roughness is supplied as a decidable predicate. Endpoints follow the
archive's N/b < q ≤ N/a convention. -/
noncomputable def cellCount (N a b : ℕ) (rough : ℕ → Prop := fun _ => True)
    [DecidablePred rough] : ℕ :=
  ((Finset.range (N+1)).filter (fun q => N/b < q ∧ q ≤ N/a ∧ rough q)).card

/-- Restricting the ambient search to [0,N] loses no integer in the cell,
provided the lower endpoint a is positive. This is not yet the floor-quotient
cell equivalence or the rough-number discrepancy bound. -/
theorem count_cell_eq (N a b : ℕ) (rough : ℕ → Prop) [DecidablePred rough]
    (ha : 0 < a) :
    cellCount N a b rough = ((Finset.Ioc (N/b) (N/a)).filter rough).card := by
  unfold cellCount
  congr 1
  ext q
  simp only [Finset.mem_filter, Finset.mem_range, Finset.mem_Ioc]
  have hbound : N / a ≤ N := Nat.div_le_self N a
  omega

#print axioms weightedCount_lower
#print axioms global_upper
#print axioms count_cell_eq
end ArchiveSummation
