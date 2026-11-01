import Weighted
import Scaling

open Finset UpperBridge
open scoped BigOperators

namespace ArchivePack

/-- A finite, integer-weighted packing certificate. The target `k` is explicit;
    the strict rounding inequality checks it without division. `support` may
    contain extra vertices, but must contain every row. -/
def Valid {ι : Type*} [DecidableEq ι] (I : Finset ι)
    (T : ι → Finset ℕ) (w r : ι → ℕ) (D k : ℕ)
    (support : Finset ℕ) : Prop :=
  0 < D ∧
  (∀ i ∈ I, T i ⊆ support) ∧
  (∀ x ∈ support, (∑ i ∈ I.filter (fun i => x ∈ T i), w i) ≤ D) ∧
  D * (k - 1) < ∑ i ∈ I, w i * r i

/-- Soundness for arbitrary covers, including vertices outside the finite support.
    Bounds for the individual rows are the only semantic inputs. -/
theorem sound {ι : Type*} [DecidableEq ι] (I : Finset ι)
    (T : ι → Finset ℕ) (w r : ι → ℕ) (D k : ℕ)
    (support : Finset ℕ) (hv : Valid I T w r D k support)
    (hb : ∀ i ∈ I, Extended.Bound (T i) (r i)) :
    Extended.Bound support k := by
  rcases hv with ⟨_, hsub, hcap, hround⟩
  intro S hS
  apply Weighted.weighted_bound I T w r D k S
  · intro i hi
    exact hb i hi (S ∩ T i)
      (Extended.cover_inter (Extended.cover_mono (hsub i hi) hS))
  · intro x hx
    by_cases hxs : x ∈ support
    · exact hcap x hxs
    · have hz : ∀ i ∈ I, x ∉ T i := by
        intro i hi hxi
        exact hxs (hsub i hi hxi)
      have hf : I.filter (fun i => x ∈ T i) = ∅ := by
        apply Finset.eq_empty_iff_forall_not_mem.mpr
        intro i hi
        exact hz i (Finset.mem_filter.mp hi).1 (Finset.mem_filter.mp hi).2
      simp [hf]
  · exact hround

/-- Connect the packing row hypothesis to the separately developed exact
    rational-image theorem. Coprimality is not needed for semantic soundness. -/
theorem scaled_bound {U : Finset ℕ} {m d r : ℕ}
    (hm : 0 < m) (hd : 0 < d)
    (hex : ∀ x ∈ U, d ∣ x * m) (hb : Extended.Bound U r) :
    Extended.Bound (ArchiveScaling.image U m d) r := by
  exact ArchiveScaling.bound_image hm hd hex hb

#print axioms sound
#print axioms scaled_bound
end ArchivePack
