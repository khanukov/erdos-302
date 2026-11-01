import Mathlib.Data.Nat.Factorization.Basic
import Mathlib.Data.Nat.Prime.Basic
import Mathlib.Order.Interval.Finset.Nat
import Mathlib.Tactic

namespace RenewalNext
open Finset

variable {α : Type*} [DecidableEq α]

/-- Every graph/hypergraph edge in S meets C. Edges may be arbitrary finite sets. -/
def Cover (E : Finset α → Prop) (S C : Finset α) : Prop :=
  ∀ e, E e → e ⊆ S → ∃ x ∈ e, x ∈ C

/-- A cover lower bound, measured inside the vertex set. -/
def Demand (E : Finset α → Prop) (S : Finset α) (r : ℕ) : Prop :=
  ∀ C, Cover E S C → r ≤ (C ∩ S).card

theorem cover_mono {E : Finset α → Prop} {S T C : Finset α}
    (h : S ⊆ T) (hc : Cover E T C) : Cover E S C := by
  intro e he hes
  exact hc e he (hes.trans h)

theorem demand_mono {E : Finset α → Prop} {S T : Finset α} {r : ℕ}
    (h : S ⊆ T) (hd : Demand E S r) : Demand E T r := by
  intro C hc
  exact (hd C (cover_mono h hc)).trans (card_le_card (by intro x hx; exact mem_inter.mpr ⟨(mem_inter.mp hx).1, h (mem_inter.mp hx).2⟩))

theorem demand_disjoint {E : Finset α → Prop} {S T : Finset α} {r s : ℕ}
    (h : Disjoint S T) (hs : Demand E S r) (ht : Demand E T s) :
    Demand E (S ∪ T) (r + s) := by
  intro C hc
  have a := hs C (cover_mono (subset_union_left) hc)
  have b := ht C (cover_mono (subset_union_right) hc)
  have hd : Disjoint (C ∩ S) (C ∩ T) := disjoint_left.mpr (by
    intro x hx hy
    exact (disjoint_left.mp h) (mem_inter.mp hx).2 (mem_inter.mp hy).2)
  have he : (C ∩ S) ∪ (C ∩ T) = C ∩ (S ∪ T) := by ext x; simp [and_or_left]
  rw [← he, card_union_of_disjoint hd]
  omega

/-- Injective embeddings preserving edges transport arbitrary cover bounds. -/
theorem demand_image {E : Finset α → Prop} (S : Finset α) (r : ℕ)
    (f : α → α) (hf : Function.Injective f)
    (hedge : ∀ e, E e → E (e.image f)) (h : Demand E S r) :
    Demand E (S.image f) r := by
  classical
  intro C hc
  let D := S.filter (fun x => f x ∈ C)
  have hcover : Cover E S D := by
    intro e he hes
    have himage : e.image f ⊆ S.image f := image_subset_image hes
    obtain ⟨y, hy, hyC⟩ := hc (e.image f) (hedge e he) himage
    obtain ⟨x, hx, rfl⟩ := mem_image.mp hy
    exact ⟨x, hx, mem_filter.mpr ⟨hes hx, hyC⟩⟩
  have hbound := h D hcover
  have hDS : D ⊆ S := filter_subset _ _
  have hcard : (D ∩ S).card = (D.image f).card := by
    rw [inter_eq_left.mpr hDS, card_image_of_injective _ hf]
  rw [hcard] at hbound
  apply hbound.trans (card_le_card ?_)
  intro y hy
  obtain ⟨x, hx, rfl⟩ := mem_image.mp hy
  exact mem_inter.mpr ⟨(mem_filter.mp hx).2, mem_image.mpr ⟨x, hDS hx, rfl⟩⟩

/-- Prefixes that exclude p-multiples are disjoint from p-scaled sets. -/
theorem disjoint_scaled (S T : Finset ℕ) (p : ℕ)
    (h : ∀ x ∈ S, ¬ p ∣ x) : Disjoint S (T.image (fun x => p*x)) := by
  apply disjoint_left.mpr
  intro x hx hy
  obtain ⟨y, _, rfl⟩ := mem_image.mp hy
  exact h (p*y) hx ⟨y, rfl⟩

/-- Archive update for a fixed level; n=0 is explicitly zero. -/
noncomputable def update (p : ℕ) (parent old seed : ℕ → ℕ) : ℕ → ℕ :=
  fun n => Nat.strongRecOn n (fun n ih =>
    if h : n = 0 then 0 else
      max (max (max (parent n + (if hd : n / p < n then ih (n / p) hd else 0))
        (ih (n-1) (by omega))) (old n)) (seed n))

theorem update_zero (p : ℕ) (parent old seed : ℕ → ℕ) :
    update p parent old seed 0 = 0 := by
  rw [update, Nat.strongRecOn_eq]
  simp

theorem update_pos (p : ℕ) (parent old seed : ℕ → ℕ) {n : ℕ}
    (hn : 0 < n) (hp : 1 < p) :
    update p parent old seed n =
      max (max (max (parent n + update p parent old seed (n/p))
        (update p parent old seed (n-1))) (old n)) (seed n) := by
  have hd : n / p < n := Nat.div_lt_self hn hp
  rw [update, Nat.strongRecOn_eq]
  simp only [ne_of_gt hn, ↓reduceDIte, hd]
  rfl

/-- Strong-induction engine: only the stated cover recurrence and seed bounds are needed. -/
theorem update_sound (p : ℕ) (parent old seed target : ℕ → ℕ)
    (hp : 1 < p)
    (hrec : ∀ n, 0 < n → parent n + target (n/p) ≤ target n)
    (hprev : ∀ n, 0 < n → target (n-1) ≤ target n)
    (hold : ∀ n, old n ≤ target n)
    (hseed : ∀ n, seed n ≤ target n) :
    ∀ n, update p parent old seed n ≤ target n := by
  intro n
  induction n using Nat.strong_induction_on with
  | h n ih =>
    by_cases hn : n = 0
    · subst n; simp [update_zero]
    · have hn' : 0 < n := Nat.pos_of_ne_zero hn
      rw [update_pos p parent old seed hn' hp]
      apply max_le (max_le (max_le ?_ ?_) (hold n)) (hseed n)
      · exact (Nat.add_le_add_left (ih (n/p) (Nat.div_lt_self hn' hp)) _).trans (hrec n hn')
      · exact (ih (n-1) (by omega)).trans (hprev n hn')

/-- The fresh recurrence increment is nonnegative and reconstructs the table. -/
theorem correction_identity (p : ℕ) (parent old seed : ℕ → ℕ) {n : ℕ}
    (hn : 0 < n) (hp : 1 < p) :
    let u := update p parent old seed
    let base := parent n + u (n/p)
    base + (u n - base) = u n := by
  dsimp only
  apply Nat.add_sub_of_le
  rw [update_pos p parent old seed hn hp]
  exact le_trans (le_trans (le_max_left _ _) (le_max_left _ _)) (le_max_left _ _)

/-- Direct graph-cover version of the j,n induction step.  The scaled block's
cover bound is supplied by the graph's dilation invariance. -/
theorem update_demand {E : Finset α → Prop} (S A B : ℕ → Finset α)
    (p : ℕ) (parent old seed : ℕ → ℕ) (hp : 1 < p)
    (hprev : ∀ n, 0 < n → S (n-1) ⊆ S n)
    (hsub : ∀ n, A n ∪ B n ⊆ S n)
    (hdis : ∀ n, Disjoint (A n) (B n))
    (hparent : ∀ n, Demand E (A n) (parent n))
    (hscale : ∀ n r, Demand E (S (n/p)) r → Demand E (B n) r)
    (hold : ∀ n, Demand E (S n) (old n))
    (hseed : ∀ n, Demand E (S n) (seed n)) :
    ∀ n, Demand E (S n) (update p parent old seed n) := by
  intro n
  induction n using Nat.strong_induction_on with
  | h n ih =>
    by_cases hz : n = 0
    · subst n
      rw [update_zero]
      intro C hc
      exact Nat.zero_le _
    · have hn : 0 < n := Nat.pos_of_ne_zero hz
      rw [update_pos p parent old seed hn hp]
      intro C hc
      apply max_le (max_le (max_le ?_ ?_) (hold n C hc)) (hseed n C hc)
      · exact demand_mono (hsub n)
          (demand_disjoint (hdis n) (hparent n)
            (hscale n _ (ih (n/p) (Nat.div_lt_self hn hp)))) C hc
      · exact demand_mono (hprev n hn) (ih (n-1) (by omega)) C hc

/-- Continue an already computed finite table with zero correction. -/
noncomputable def tail (p X : ℕ) (parent table : ℕ → ℕ) : ℕ → ℕ :=
  fun n => Nat.strongRecOn n (fun n ih =>
    if n ≤ X then table n else
      parent n + (if hd : n/p < n then ih (n/p) hd else 0))

theorem tail_small (p X : ℕ) (parent table : ℕ → ℕ) {n : ℕ} (h : n ≤ X) :
    tail p X parent table n = table n := by
  rw [tail, Nat.strongRecOn_eq]
  simp [h]

theorem tail_large (p X : ℕ) (parent table : ℕ → ℕ) {n : ℕ}
    (h : X < n) (hp : 1 < p) :
    tail p X parent table n = parent n + tail p X parent table (n/p) := by
  have hn : 0 < n := by omega
  have hd : n/p < n := Nat.div_lt_self hn hp
  rw [tail, Nat.strongRecOn_eq]
  simp only [not_le_of_gt h, ↓reduceIte, hd, ↓reduceDIte]
  rfl

theorem tail_sound (p X : ℕ) (parent table target : ℕ → ℕ) (hp : 1 < p)
    (hsmall : ∀ n, n ≤ X → table n ≤ target n)
    (hrec : ∀ n, X < n → parent n + target (n/p) ≤ target n) :
    ∀ n, tail p X parent table n ≤ target n := by
  intro n
  induction n using Nat.strong_induction_on with
  | h n ih =>
    by_cases hs : n ≤ X
    · rw [tail_small p X parent table hs]; exact hsmall n hs
    · have hl : X < n := Nat.lt_of_not_ge hs
      rw [tail_large p X parent table hl hp]
      exact (Nat.add_le_add_left (ih (n/p) (Nat.div_lt_self (by omega) hp)) _).trans (hrec n hl)

#print axioms demand_image
#print axioms disjoint_scaled
#print axioms update_demand
#print axioms tail_sound
#print axioms demand_disjoint
#print axioms update_sound
#print axioms correction_identity
end RenewalNext
