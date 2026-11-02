import BankProfile

open Finset UpperBridge

/-! The first archived edge is a genuine source bound, not a synthetic
assumption. Dropping its largest vertex loses exactly one unit. -/
example : Extended.Bound ({2, 3} : Finset ℕ) 0 := by
  classical
  have h := BankProfile.restrict_bound
    (S := ({2, 3, 6} : Finset ℕ)) (T := ({2, 3} : Finset ℕ))
    (r := 1) (by decide) Extended.edge_0
  simpa [Finset.sdiff_eq_filter, Finset.filter_insert] using h

/-- A seed cannot keep the original bound when a necessary vertex is removed. -/
example : ¬ Extended.Bound ({2, 3} : Finset ℕ) 1 := by
  intro h
  have hc : OrderedCover ({2, 3} : Finset ℕ) ∅ := by
    intro a b c he
    simp only [OrderedEdge, mem_insert, mem_singleton] at he
    omega
  have h' := h ∅ hc
  simp at h'

namespace BankProfileConcrete

-- A complete one-node DAG: no semantic bound is assumed.
def nodes : ℕ → ArchiveDag.Node
  | 0 => ⟨{2, 3, 6}, 1, .edge 2 3 6⟩
  | _ => ⟨∅, 0, .small⟩

theorem valid : ∀ i < 1, ArchiveDag.Check nodes i := by
  intro i hi
  have : i = 0 := by omega
  subst i
  decide

private theorem smooth_of_dvd_six {x : ℕ} (hx : x ∣ 6) :
    UpperProjection.Smooth ({2, 3} : Finset ℕ) x := by
  intro p hp hpx
  have hp6 : p ∣ 6 := dvd_trans hpx hx
  have hle : p ≤ 6 := Nat.le_of_dvd (by decide) hp6
  interval_cases p <;> norm_num at *

private theorem smooth2 : UpperProjection.Smooth ({2, 3} : Finset ℕ) 2 :=
  smooth_of_dvd_six (by decide)
private theorem smooth3 : UpperProjection.Smooth ({2, 3} : Finset ℕ) 3 :=
  smooth_of_dvd_six (by decide)
private theorem smooth6 : UpperProjection.Smooth ({2, 3} : Finset ℕ) 6 :=
  smooth_of_dvd_six (by decide)

/-- Nonzero result from the full checked-node theorem, with no hypotheses. -/
theorem full_prefix : Extended.Bound ({2, 3, 6} : Finset ℕ) 1 := by
  classical
  have h := BankProfile.checked_node_seed nodes 1 0 valid (by decide) {2, 3} 6
  simpa [nodes, Finset.sdiff_eq_filter, Finset.filter_insert,
    smooth2, smooth3, smooth6] using h

/-- Just below the final vertex the prefix loses one unit. -/
theorem before_last : Extended.Bound ({2, 3} : Finset ℕ) 0 := by
  classical
  have h := BankProfile.checked_node_seed nodes 1 0 valid (by decide) {2, 3} 5
  simpa [nodes, Finset.sdiff_eq_filter, Finset.filter_insert,
    smooth2, smooth3, smooth6] using h

/-- At the final vertex the positive bound is restored. -/
theorem at_last : Extended.Bound ({2, 3, 6} : Finset ℕ) 1 :=
  full_prefix

/-- The lower boundary has an empty prefix and truncated zero demand. -/
theorem empty_prefix : Extended.Bound (∅ : Finset ℕ) 0 := by
  classical
  have h := BankProfile.checked_node_seed nodes 1 0 valid (by decide) {2, 3} 0
  simpa [nodes, Finset.sdiff_eq_filter, Finset.filter_insert,
    smooth2, smooth3, smooth6] using h

private theorem smooth3_only : UpperProjection.Smooth ({3} : Finset ℕ) 3 := by
  intro p hp hd
  have hle : p ≤ 3 := Nat.le_of_dvd (by decide) hd
  interval_cases p <;> norm_num at *

private theorem nonsmooth2 : ¬ UpperProjection.Smooth ({3} : Finset ℕ) 2 := by
  intro h
  have hmem := h 2 (by norm_num) (by norm_num)
  norm_num at hmem

private theorem nonsmooth6 : ¬ UpperProjection.Smooth ({3} : Finset ℕ) 6 := by
  intro h
  have hmem := h 2 (by norm_num) (by norm_num)
  norm_num at hmem

/-- Both even non-smooth vertices are charged, saturating subtraction at zero. -/
theorem outside_loss : Extended.Bound ({3} : Finset ℕ) 0 := by
  classical
  have h := BankProfile.checked_node_seed nodes 1 0 valid (by decide) {3} 6
  simpa [nodes, Finset.sdiff_eq_filter, Finset.filter_insert,
    smooth3_only, nonsmooth2, nonsmooth6] using h

#print axioms full_prefix
#print axioms before_last
#print axioms empty_prefix
#print axioms outside_loss
end BankProfileConcrete

#print axioms BankProfile.checked_node_seed
