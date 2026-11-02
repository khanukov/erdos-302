import Erdos302ReflectiveChainTopFC
import ReciprocalBridge
import SmoothRenewal

/- Candidate semantic bridge; no assertion about archive transcription. -/
namespace ReflectiveProfileBridge
open Finset

theorem upstream_to_demand (Q : Finset ℕ) (n r : ℕ)
    (h : Erdos302CoverRowsFC.CoverLowerBound
      (Erdos302PrimeBlockFC.smoothSet Q n) r) :
    RenewalNext.Demand SmoothRenewal.Edge (SmoothRenewal.vertices Q n) r := by
  classical
  have hs : Erdos302PrimeBlockFC.smoothSet Q n = SmoothRenewal.vertices Q n := by
    rfl
  rw [hs] at h
  intro C hc
  apply h (C ∩ SmoothRenewal.vertices Q n)
  apply UpperBridge.orderedCover_to_upstream
  · intro x hx
    exact (Finset.mem_Icc.mp (Finset.mem_filter.mp hx).1).1
  · intro a b c he
    have hedge : SmoothRenewal.Edge {a,b,c} := ⟨a,b,c,he.2.2.2.1, he.2.2.2.2.1, he.2.2.2.2.2.1, he.2.2.2.2.2.2, rfl⟩
    have hin : ({a,b,c} : Finset ℕ) ⊆ SmoothRenewal.vertices Q n := by
      simp only [Finset.insert_subset_iff, Finset.singleton_subset_iff]
      exact ⟨he.1, he.2.1, he.2.2.1⟩
    obtain ⟨x, hx, hxc⟩ := hc _ hedge hin
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl
    · exact Or.inl (Finset.mem_inter.mpr ⟨hxc, he.1⟩)
    · exact Or.inr (Or.inl (Finset.mem_inter.mpr ⟨hxc, he.2.1⟩))
    · exact Or.inr (Or.inr (Finset.mem_inter.mpr ⟨hxc, he.2.2.1⟩))

theorem profile19 (n : ℕ) : RenewalNext.Demand SmoothRenewal.Edge
    (SmoothRenewal.vertices {3} n) (Erdos302ReflectiveChain.chainSol_19 n) :=
  upstream_to_demand _ _ _ (Erdos302ReflectiveChain.chain_19.2 n)

#print axioms upstream_to_demand
#print axioms profile19
end ReflectiveProfileBridge
