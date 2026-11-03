import LiteralFactorMatchingCandidate

/-! Candidate only, not compiled. The finite graph hypothesis is a joint
independence bound for the *actual* literal multiplicity sum. It is not a
family of per-cell bounds and is not an asserted allocation to a demand. -/
namespace JointIndependenceCandidate
open Finset RenewalNext LiteralFactorMatchingCandidate
open scoped Classical

/-- A finite hypergraph independent set contains no edge in its entirety. -/
def Independent {α : Type*} [DecidableEq α]
    (E : Finset α → Prop) (B : Finset α) : Prop :=
  ∀ e, E e → e ⊆ B → False

/-- A joint independence-number certificate implies the corresponding cover
    demand. The same bound is imposed once on the whole vertex set. -/
theorem demand_of_independence {α : Type*} [DecidableEq α]
    (E : Finset α → Prop) (S : Finset α) (r : ℕ)
    (h : ∀ B, B ⊆ S → Independent E B → B.card + r ≤ S.card) :
    Demand E S r := by
  classical
  intro C hc
  let D := C ∩ S
  let B := S \ D
  have hBS : B ⊆ S := Finset.sdiff_subset
  have hB : Independent E B := by
    intro e he heb
    have heS : e ⊆ S := heb.trans hBS
    obtain ⟨x, hxe, hxC⟩ := hc e he heS
    have hxB := heb hxe
    have hxD : x ∈ D := Finset.mem_inter.mpr ⟨hxC, heS hxe⟩
    exact (Finset.mem_sdiff.mp hxB).2 hxD
  have hD : D ⊆ S := Finset.inter_subset_right
  have hc' : B.card + D.card = S.card := Finset.card_sdiff_add_card_eq_card hD
  have hb := h B hBS hB
  change r ≤ D.card
  omega

/-- Conversely, any genuine demand gives the joint independence bound.
    Hence this certificate is exact, not merely an edge-packing relaxation. -/
theorem independence_of_demand {α : Type*} [DecidableEq α]
    (E : Finset α → Prop) (S : Finset α) (r : ℕ)
    (h : Demand E S r) :
    ∀ B, B ⊆ S → Independent E B → B.card + r ≤ S.card := by
  classical
  intro B hBS hB
  let C := S \ B
  have hcover : Cover E S C := by
    intro e he heS
    have hx : ∃ x ∈ e, x ∉ B := by
      by_contra hn
      have heb : e ⊆ B := by
        intro x hxe
        by_contra hxB
        exact hn ⟨x, hxe, hxB⟩
      exact hB e he heb
    obtain ⟨x, hxe, hxB⟩ := hx
    exact ⟨x, hxe, Finset.mem_sdiff.mpr ⟨heS hxe, hxB⟩⟩
  have hc := h C hcover
  have hCS : C ⊆ S := Finset.sdiff_subset
  have hi : C ∩ S = C := Finset.inter_eq_left.mpr hCS
  rw [hi] at hc
  have hs : C.card + B.card = S.card := Finset.card_sdiff_add_card_eq_card hBS
  omega

/-- All literal cell occurrences contribute simultaneously. This replaces the
    separate demand and allocation hypotheses by one concrete finite-graph
    independence certificate for each actual rough block. -/
theorem literal_hcover_of_joint_independence (N : ℕ) (A : Finset ℕ)
    (hA : A ⊆ Icc 1 N)
    (hfree : ∀ x y z, SmoothRenewal.Triple x y z → x ∈ A → y ∈ A → z ∈ A → False)
    (hind : ∀ q ∈ support N, ∀ B,
      B ⊆ SmoothRenewal.vertices Q (N / q) →
      Independent SmoothRenewal.Edge B →
      B.card + (∑ i : Fin 4705, height i * mult N i q) ≤
        (SmoothRenewal.vertices Q (N / q)).card) :
    (A.card : ℝ) + ArchiveSummation.weightedCount Finset.univ
      (fun i : Fin 4705 => (height i : ℝ)) (fun i => (count N i : ℝ)) ≤ N := by
  apply literal_hcover N A (fun q => ∑ i : Fin 4705, height i * mult N i q) hA hfree
  · intro q hq
    exact demand_of_independence _ _ _ (hind q hq)
  · intro q hq
    exact le_refl _

#print axioms demand_of_independence
#print axioms independence_of_demand
#print axioms literal_hcover_of_joint_independence
end JointIndependenceCandidate
