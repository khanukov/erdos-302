import Renewal

namespace SmoothRenewal
open Finset RenewalNext

def Edge (e : Finset ℕ) : Prop :=
  ∃ a b c, 0 < a ∧ a < b ∧ b < c ∧ b*c = a*(b+c) ∧ e = {a,b,c}

theorem mul_inj {p : ℕ} (hp : 0 < p) : Function.Injective (fun x : ℕ => p*x) := by
  intro a b h
  exact Nat.eq_of_mul_eq_mul_left hp h

theorem edge_image {p : ℕ} (hp : 0 < p) {e : Finset ℕ} (he : Edge e) :
    Edge (e.image (fun x => p*x)) := by
  rcases he with ⟨a,b,c,ha,hab,hbc,he,rfl⟩
  refine ⟨p*a,p*b,p*c, Nat.mul_pos hp ha, ?_, ?_, ?_, ?_⟩
  · exact Nat.mul_lt_mul_of_pos_left hab hp
  · exact Nat.mul_lt_mul_of_pos_left hbc hp
  · calc
      p*b*(p*c) = p*p*(b*c) := by ring
      _ = p*p*(a*(b+c)) := by rw [he]
      _ = p*a*(p*b+p*c) := by ring
  · simp

def Triple (a b c : ℕ) : Prop :=
  0 < a ∧ a < b ∧ b < c ∧ b*c = a*(b+c)

theorem triple_scale_iff {p a b c : ℕ} (hp : 0 < p) :
    Triple (p*a) (p*b) (p*c) ↔ Triple a b c := by
  unfold Triple
  have heq : p*b*(p*c) = p*a*(p*b+p*c) ↔ b*c = a*(b+c) := by
    have h1 : p*b*(p*c) = (p*p)*(b*c) := by ring
    have h2 : p*a*(p*b+p*c) = (p*p)*(a*(b+c)) := by ring
    rw [h1, h2]
    exact Nat.mul_left_cancel_iff (Nat.mul_pos hp hp)
  have hpos : 0 < p*a ↔ 0 < a := by
    constructor
    · intro h
      by_contra ha
      have hz : a = 0 := by omega
      simp [hz] at h
    · exact Nat.mul_pos hp
  simp only [hpos, Nat.mul_lt_mul_left hp, heq]

theorem demand_scaled (S : Finset ℕ) (r p : ℕ) (hp : 0 < p)
    (h : Demand Edge S r) : Demand Edge (S.image (fun x => p*x)) r :=
  demand_image S r _ (mul_inj hp) (fun _ he => edge_image hp he) h

def Smooth (Q : Finset ℕ) (n : ℕ) : Prop :=
  ∀ q, q.Prime → q ∣ n → q ∈ Q

noncomputable def vertices (Q : Finset ℕ) (n : ℕ) : Finset ℕ := by
  classical
  exact (Finset.Icc 1 n).filter (Smooth Q)

theorem smooth_mul {Q : Finset ℕ} {p x : ℕ} (hp : p.Prime)
    (h : Smooth Q x) : Smooth (insert p Q) (p*x) := by
  intro q hq hd
  rcases hq.dvd_mul.mp hd with hqp | hqx
  · have : q = p := (Nat.dvd_prime hp).mp hqp |>.resolve_left hq.ne_one
    simp [this]
  · simp [h q hq hqx]

theorem smooth_divisor {Q : Finset ℕ} {x y : ℕ} (h : Smooth Q x)
    (hd : y ∣ x) : Smooth Q y := by
  intro q hq hqy
  exact h q hq (dvd_trans hqy hd)

theorem smooth_without {Q : Finset ℕ} {p x : ℕ}
    (h : Smooth (insert p Q) x) (hx : ¬ p ∣ x) : Smooth Q x := by
  intro q hq hd
  have hmem := h q hq hd
  rcases Finset.mem_insert.mp hmem with he | he
  · subst q; exact (hx hd).elim
  · exact he

theorem vertices_partition (Q : Finset ℕ) (p n : ℕ) (hp : p.Prime)
    (hpQ : p ∉ Q) :
    vertices (insert p Q) n = vertices Q n ∪
      (vertices (insert p Q) (n/p)).image (fun x => p*x) := by
  classical
  ext x
  simp only [mem_union, mem_image, vertices, mem_filter, mem_Icc]
  constructor
  · rintro ⟨⟨hxpos, hxn⟩, hs⟩
    by_cases hd : p ∣ x
    · right
      refine ⟨x/p, ⟨⟨?_, ?_⟩, ?_⟩, ?_⟩
      · have := Nat.div_pos (Nat.le_of_dvd (by omega) hd) hp.pos
        omega
      · exact Nat.div_le_div_right hxn
      · exact smooth_divisor hs (Nat.div_dvd_of_dvd hd)
      · exact Nat.mul_div_cancel' hd
    · exact Or.inl ⟨⟨hxpos,hxn⟩, smooth_without hs hd⟩
  · rintro (⟨⟨hxpos,hxn⟩, hs⟩ | ⟨y, ⟨⟨hypos,hyn⟩, hs⟩, rfl⟩)
    · exact ⟨⟨hxpos,hxn⟩, fun q hq hd => Finset.mem_insert_of_mem (hs q hq hd)⟩
    · refine ⟨⟨Nat.mul_pos hp.pos (by omega), ?_⟩, ?_⟩
      · exact (Nat.mul_le_mul_left p hyn).trans (Nat.mul_div_le n p)
      · simpa using (smooth_mul hp hs)

theorem vertices_disjoint (Q : Finset ℕ) (p n : ℕ) (hp : p.Prime)
    (hpQ : p ∉ Q) : Disjoint (vertices Q n)
      ((vertices (insert p Q) (n/p)).image (fun x => p*x)) := by
  classical
  apply disjoint_scaled
  intro x hx hd
  apply hpQ
  exact (Finset.mem_filter.mp hx).2 p hp hd

theorem demand_recurrence (Q : Finset ℕ) (p n r s : ℕ)
    (hp : p.Prime) (hpQ : p ∉ Q)
    (ha : Demand Edge (vertices Q n) r)
    (hb : Demand Edge (vertices (insert p Q) (n/p)) s) :
    Demand Edge (vertices (insert p Q) n) (r+s) := by
  rw [vertices_partition Q p n hp hpQ]
  exact demand_disjoint (vertices_disjoint Q p n hp hpQ) ha
    (demand_scaled _ _ _ hp.pos hb)

theorem cover_pullback (S C : Finset ℕ) (p : ℕ) (hp : 0 < p)
    (hc : Cover Edge (S.image (fun x => p*x)) C) :
    Cover Edge S (S.filter (fun x => p*x ∈ C)) := by
  intro e he hes
  obtain ⟨y, hy, hyc⟩ := hc (e.image (fun x => p*x)) (edge_image hp he)
    (Finset.image_subset_image hes)
  obtain ⟨x, hx, rfl⟩ := Finset.mem_image.mp hy
  exact ⟨x, hx, Finset.mem_filter.mpr ⟨hes hx, hyc⟩⟩

#print axioms triple_scale_iff
#print axioms vertices_partition
#print axioms vertices_disjoint
#print axioms demand_recurrence
#print axioms cover_pullback
#print axioms edge_image
#print axioms demand_scaled
end SmoothRenewal
