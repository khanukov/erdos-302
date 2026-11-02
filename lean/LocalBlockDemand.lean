import SmoothPartition

/-! Transfer genuine smooth-prefix graph demands to the complement of a
triple-free set inside each bounded rough block. -/
namespace SmoothPartition
open Finset SmoothRenewal RenewalNext

/-- Triple-freeness makes the interval complement a cover of every edge
whose vertices lie in the interval. -/
theorem complement_covers {N : ℕ} {A : Finset ℕ}
    (hfree : ∀ x y z, Triple x y z → x ∈ A → y ∈ A → z ∈ A → False) :
    Cover Edge (Icc 1 N) (Icc 1 N \ A) := by
  classical
  intro e he hes
  rcases he with ⟨x, y, z, hx, hxy, hyz, heq, rfl⟩
  have hxi : x ∈ Icc 1 N := hes (by simp)
  have hyi : y ∈ Icc 1 N := hes (by simp)
  have hzi : z ∈ Icc 1 N := hes (by simp)
  by_cases hxa : x ∈ A
  · by_cases hya : y ∈ A
    · by_cases hza : z ∈ A
      · exact False.elim (hfree x y z ⟨hx, hxy, hyz, heq⟩ hxa hya hza)
      · exact ⟨z, by simp, Finset.mem_sdiff.mpr ⟨hzi, hza⟩⟩
    · exact ⟨y, by simp, Finset.mem_sdiff.mpr ⟨hyi, hya⟩⟩
  · exact ⟨x, by simp, Finset.mem_sdiff.mpr ⟨hxi, hxa⟩⟩

/-- The scaled prefix of length N/a is contained in the bounded block. -/
theorem scaled_prefix_subset_block (Q : Finset ℕ) (N a : ℕ) (ha : 0 < a) :
    (vertices Q (N / a)).image (fun x => a * x) ⊆ block Q N a := by
  classical
  intro z hz
  obtain ⟨x, hx, rfl⟩ := Finset.mem_image.mp hz
  have hx' := Finset.mem_filter.mp hx
  have hxb := Finset.mem_Icc.mp hx'.1
  have hxN : x ≤ N := hxb.2.trans (Nat.div_le_self N a)
  have hxv : x ∈ vertices Q N := Finset.mem_filter.mpr
    ⟨Finset.mem_Icc.mpr ⟨hxb.1, hxN⟩, hx'.2⟩
  apply Finset.mem_inter.mpr
  refine ⟨Finset.mem_image.mpr ⟨x, hxv, rfl⟩, Finset.mem_Icc.mpr ⟨?_, ?_⟩⟩
  · exact Nat.mul_pos ha (by omega)
  · exact (Nat.mul_le_mul_left a hxb.2).trans (Nat.mul_div_le N a)

/-- A certified smooth-prefix demand remains valid in the complement of A
within its scaled block. This does not assert a demand certificate exists. -/
theorem local_block_demand {Q A : Finset ℕ} {N a r : ℕ} (ha : 0 < a)
    (hfree : ∀ x y z, Triple x y z → x ∈ A → y ∈ A → z ∈ A → False)
    (hd : Demand Edge (vertices Q (N / a)) r) :
    r ≤ (block Q N a ∩ (Icc 1 N \ A)).card := by
  classical
  have hs := demand_scaled (vertices Q (N / a)) r a ha hd
  have hb : Demand Edge (block Q N a) r :=
    demand_mono (scaled_prefix_subset_block Q N a ha) hs
  have hc : Cover Edge (block Q N a) (Icc 1 N \ A) :=
    cover_mono (block_subset Q N a) (complement_covers hfree)
  simpa only [Finset.inter_comm] using hb (Icc 1 N \ A) hc

/-- Prefix certificates, triple-freeness, and rough disjointness give the
finite global ledger directly; no global inequality is assumed. -/
theorem global_from_prefix_demands {Q A s : Finset ℕ} {N : ℕ} {r : ℕ → ℕ}
    (hA : A ⊆ Icc 1 N)
    (hfree : ∀ x y z, Triple x y z → x ∈ A → y ∈ A → z ∈ A → False)
    (hrough : ∀ a ∈ s, Rough Q a)
    (hd : ∀ a ∈ s, Demand Edge (vertices Q (N / a)) (r a)) :
    A.card + ∑ a ∈ s, r a ≤ N := by
  have h := global_accounting (weight := r) (count := fun _ => 1) hA hrough
    (fun a ha => by simpa using local_block_demand (hrough a ha).1 hfree (hd a ha))
  simpa using h

#print axioms local_block_demand
#print axioms global_from_prefix_demands
end SmoothPartition
