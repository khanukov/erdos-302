import ArchiveSmallPrefix
import SmoothRenewal

/-! Uncompiled candidate: the positive finite seed values are obtained from
    pinned bank nodes 0 and 1. Archive-byte transcription is external. -/
namespace ArchiveFirstSeedCandidate
open Finset UpperBridge RenewalNext SmoothRenewal

/-- Transport the ordered-cover certificate to the renewal hypergraph. -/
theorem ordered_to_demand {S : Finset ℕ} {r : ℕ} (h : Extended.Bound S r) :
    Demand Edge S r := by
  intro C hc
  apply h (C ∩ S)
  intro a b c he
  have hh := hc {a,b,c} ⟨a,b,c,he.2.2.2.1,he.2.2.2.2.1,
    he.2.2.2.2.2.1,he.2.2.2.2.2.2,rfl⟩ (by
      intro x hx
      simp only [mem_insert, mem_singleton] at hx
      rcases hx with rfl | rfl | rfl
      · exact he.1
      · exact he.2.1
      · exact he.2.2.1)
  rcases hh with ⟨x,hx,hxc⟩
  simp only [mem_insert, mem_singleton] at hx
  rcases hx with rfl | rfl | rfl
  · exact Or.inl (mem_inter.mpr ⟨hxc, he.1⟩)
  · exact Or.inr (Or.inl (mem_inter.mpr ⟨hxc, he.2.1⟩))
  · exact Or.inr (Or.inr (mem_inter.mpr ⟨hxc, he.2.2.1⟩))

/-- These are the nonzero positions of the independently replayed bounded
    seed operand; zero elsewhere is deliberate. -/
def seed (n : ℕ) : ℕ :=
  if n = 12 then 2 else if n = 6 ∨ n = 18 ∨ n = 24 then 1 else 0

private theorem smooth_dvd_twelve {Q : Finset ℕ} (h3 : 3 ∈ Q)
    {x : ℕ} (hx : x ∣ 12) : Smooth (insert 2 Q) x := by
  intro p hp hd
  have hp12 : p ∣ 12 := dvd_trans hd hx
  have hle : p ≤ 12 := Nat.le_of_dvd (by decide) hp12
  interval_cases p <;> norm_num at * <;> simp_all

private theorem embed0 {Q : Finset ℕ} (h3 : 3 ∈ Q) {n : ℕ} (hn : 6 ≤ n) :
    ({2,3,6} : Finset ℕ) ⊆ vertices (insert 2 Q) n := by
  intro x hx
  simp only [mem_insert, mem_singleton] at hx
  rcases hx with rfl | rfl | rfl <;>
    simp only [vertices, mem_filter, mem_Icc] <;>
    exact ⟨⟨by omega, by omega⟩, smooth_dvd_twelve h3 (by decide)⟩

private theorem embed1 {Q : Finset ℕ} (h3 : 3 ∈ Q) {n : ℕ} (hn : 12 ≤ n) :
    ({2,3,4,6,12} : Finset ℕ) ⊆ vertices (insert 2 Q) n := by
  intro x hx
  simp only [mem_insert, mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl <;>
    simp only [vertices, mem_filter, mem_Icc] <;>
    exact ⟨⟨by omega, by omega⟩, smooth_dvd_twelve h3 (by decide)⟩

/-- No graph seed bound is assumed: nodes 0 and 1 supply the demand. -/
theorem seed_demand (Q : Finset ℕ) (h3 : 3 ∈ Q) (n : ℕ) :
    Demand Edge (vertices (insert 2 Q) n) (seed n) := by
  have h0 : Demand Edge ({2,3,6} : Finset ℕ) 1 := by
    apply ordered_to_demand
    simpa [ArchiveSmallPrefix.nodes] using ArchiveSmallPrefix.sound 0 (by decide)
  have h1 : Demand Edge ({2,3,4,6,12} : Finset ℕ) 2 := by
    apply ordered_to_demand
    simpa [ArchiveSmallPrefix.nodes] using ArchiveSmallPrefix.sound 1 (by decide)
  unfold seed
  split_ifs with h12 hother
  · subst n
    exact demand_mono (embed1 h3 (by decide)) h1
  · exact demand_mono (embed0 h3 (by omega)) h0
  · intro C hc
    omega

example : seed 6 = 1 := by decide
example : seed 12 = 2 := by decide
example : seed 18 = 1 := by decide
example : seed 24 = 1 := by decide
example : seed 5 = 0 := by decide
example : seed 25 = 0 := by decide
#print axioms ordered_to_demand
#print axioms seed_demand
end ArchiveFirstSeedCandidate
