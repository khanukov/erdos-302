import UpperRenewal

namespace UpperProjection
open UpperBridge UpperRenewal

/-- Divisibility of any vertex forces divisibility of another vertex. -/
theorem prime_shared {p a b c : ℕ} (hp : p.Prime)
    (h : b * c = a * (b + c)) :
    (p ∣ a → p ∣ b ∨ p ∣ c) ∧
    (p ∣ b → p ∣ a ∨ p ∣ c) ∧
    (p ∣ c → p ∣ a ∨ p ∣ b) := by
  constructor
  · intro ha
    apply hp.dvd_mul.mp
    rw [h]
    exact dvd_mul_of_dvd_left ha _
  constructor
  · intro hb
    have hdiv : p ∣ a * (b + c) := by
      rw [← h]
      exact dvd_mul_of_dvd_left hb _
    rcases hp.dvd_mul.mp hdiv with ha | hbc
    · exact Or.inl ha
    · exact Or.inr ((Nat.dvd_add_iff_left hb).mpr (by simpa [Nat.add_comm] using hbc))
  · intro hc
    have hdiv : p ∣ a * (b + c) := by
      rw [← h]
      exact dvd_mul_of_dvd_right hc _
    rcases hp.dvd_mul.mp hdiv with ha | hbc
    · exact Or.inl ha
    · exact Or.inr ((Nat.dvd_add_iff_left hc).mpr hbc)

/-- Smoothness means all prime divisors belong to Q. -/
def Smooth (Q : Finset ℕ) (n : ℕ) : Prop :=
  ∀ p, p.Prime → p ∣ n → p ∈ Q

/-- Every edge not entirely Q-smooth has an even, non-smooth vertex. -/
theorem outside_smooth_even {Q : Finset ℕ} {a b c : ℕ}
    (h : b * c = a * (b + c))
    (hout : ¬ (Smooth Q a ∧ Smooth Q b ∧ Smooth Q c)) :
    (¬ Smooth Q a ∧ a % 2 = 0) ∨
    (¬ Smooth Q b ∧ b % 2 = 0) ∨
    (¬ Smooth Q c ∧ c % 2 = 0) := by
  classical
  have odd := reciprocal_at_most_one_odd h
  have ha : a % 2 < 2 := Nat.mod_lt _ (by decide)
  have hb : b % 2 < 2 := Nat.mod_lt _ (by decide)
  have hc : c % 2 < 2 := Nat.mod_lt _ (by decide)
  simp only [Smooth, not_and_or, not_forall] at hout ⊢
  -- Each outside vertex carries a prime outside Q; that prime divides another vertex.
  rcases hout with ⟨p, hp, hpa, hpQ⟩ | ⟨p, hp, hpb, hpQ⟩ | ⟨p, hp, hpc, hpQ⟩
  · rcases (prime_shared hp h).1 hpa with hpb | hpc
    · by_cases he : a % 2 = 0
      · exact Or.inl ⟨⟨p, hp, hpa, hpQ⟩, he⟩
      · exact Or.inr (Or.inl ⟨⟨p, hp, hpb, hpQ⟩, by omega⟩)
    · by_cases he : a % 2 = 0
      · exact Or.inl ⟨⟨p, hp, hpa, hpQ⟩, he⟩
      · exact Or.inr (Or.inr ⟨⟨p, hp, hpc, hpQ⟩, by omega⟩)
  · rcases (prime_shared hp h).2.1 hpb with hpa | hpc
    · by_cases he : b % 2 = 0
      · exact Or.inr (Or.inl ⟨⟨p, hp, hpb, hpQ⟩, he⟩)
      · exact Or.inl ⟨⟨p, hp, hpa, hpQ⟩, by omega⟩
    · by_cases he : b % 2 = 0
      · exact Or.inr (Or.inl ⟨⟨p, hp, hpb, hpQ⟩, he⟩)
      · exact Or.inr (Or.inr ⟨⟨p, hp, hpc, hpQ⟩, by omega⟩)
  · rcases (prime_shared hp h).2.2 hpc with hpa | hpb
    · by_cases he : c % 2 = 0
      · exact Or.inr (Or.inr ⟨⟨p, hp, hpc, hpQ⟩, he⟩)
      · exact Or.inl ⟨⟨p, hp, hpa, hpQ⟩, by omega⟩
    · by_cases he : c % 2 = 0
      · exact Or.inr (Or.inr ⟨⟨p, hp, hpc, hpQ⟩, he⟩)
      · exact Or.inr (Or.inl ⟨⟨p, hp, hpb, hpQ⟩, by omega⟩)

noncomputable local instance (Q : Finset ℕ) : DecidablePred (Smooth Q) := Classical.decPred _

/-- Archive projection bound: extend a smooth cover by all even outside vertices. -/
theorem smooth_projection (S Q : Finset ℕ) (r : ℕ)
    (hbound : ∀ C, OrderedCover S C → r ≤ C.card) :
    let T := S.filter (Smooth Q)
    let U := S.filter (fun n => ¬ Smooth Q n ∧ n % 2 = 0)
    ∀ C, OrderedCover T C → r ≤ C.card + U.card := by
  classical
  dsimp only
  apply extension_projection (Finset.filter_subset _ _) hbound
  intro a b c edge
  by_cases ht : Smooth Q a ∧ Smooth Q b ∧ Smooth Q c
  · left
    exact ⟨Finset.mem_filter.mpr ⟨edge.1, ht.1⟩,
      Finset.mem_filter.mpr ⟨edge.2.1, ht.2.1⟩,
      Finset.mem_filter.mpr ⟨edge.2.2.1, ht.2.2⟩⟩
  · right
    rcases outside_smooth_even edge.2.2.2.2.2.2 ht with ha | hb | hc
    · exact Or.inl (Finset.mem_filter.mpr ⟨edge.1, ha⟩)
    · exact Or.inr (Or.inl (Finset.mem_filter.mpr ⟨edge.2.1, hb⟩))
    · exact Or.inr (Or.inr (Finset.mem_filter.mpr ⟨edge.2.2.1, hc⟩))

#print axioms smooth_projection
#print axioms prime_shared
#print axioms outside_smooth_even
end UpperProjection
