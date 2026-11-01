import UpperBridge

namespace UpperRenewal
open UpperBridge

/-- Archive PROOF.md 103--111: a boundary-hitting witness extends a cover.
The witness need not be minimal, disjoint, or even contained in the source. -/
theorem extension_projection {S T U : Finset ℕ} {r : ℕ}
    (_hT : T ⊆ S)
    (hbound : ∀ C, OrderedCover S C → r ≤ C.card)
    (hext : ∀ a b c, OrderedEdge S a b c →
      (a ∈ T ∧ b ∈ T ∧ c ∈ T) ∨ (a ∈ U ∨ b ∈ U ∨ c ∈ U))
    (C : Finset ℕ) (hc : OrderedCover T C) : r ≤ C.card + U.card := by
  have hcover : OrderedCover S (C ∪ U) := by
    intro a b c hedge
    rcases hext a b c hedge with ht | hu
    · have htarget : OrderedEdge T a b c :=
        ⟨ht.1, ht.2.1, ht.2.2, hedge.2.2.2⟩
      rcases hc a b c htarget with ha | hb | hc
      · exact Or.inl (Finset.mem_union_left _ ha)
      · exact Or.inr (Or.inl (Finset.mem_union_left _ hb))
      · exact Or.inr (Or.inr (Finset.mem_union_left _ hc))
    · rcases hu with ha | hb | hc
      · exact Or.inl (Finset.mem_union_right _ ha)
      · exact Or.inr (Or.inl (Finset.mem_union_right _ hb))
      · exact Or.inr (Or.inr (Finset.mem_union_right _ hc))
  exact le_trans (hbound (C ∪ U) hcover) (Finset.card_union_le _ _)

/-- A reciprocal edge has at most one odd vertex (PROOF.md 98). -/
theorem reciprocal_at_most_one_odd {a b c : ℕ} (h : b * c = a * (b + c)) :
    ¬ (a % 2 = 1 ∧ b % 2 = 1) ∧
    ¬ (a % 2 = 1 ∧ c % 2 = 1) ∧
    ¬ (b % 2 = 1 ∧ c % 2 = 1) := by
  have hm : ((b % 2) * (c % 2)) % 2 =
      ((a % 2) * ((b % 2 + c % 2) % 2)) % 2 := by
    calc
      _ = (b * c) % 2 := (Nat.mul_mod b c 2).symm
      _ = (a * (b + c)) % 2 := congrArg (fun x : ℕ => x % 2) h
      _ = _ := by rw [Nat.mul_mod a (b + c) 2, Nat.add_mod b c 2]
  have ha : a % 2 < 2 := Nat.mod_lt _ (by decide)
  have hb : b % 2 < 2 := Nat.mod_lt _ (by decide)
  have hc : c % 2 < 2 := Nat.mod_lt _ (by decide)
  interval_cases hA : a % 2 <;> interval_cases hB : b % 2 <;>
    interval_cases hC : c % 2 <;> norm_num [hA, hB, hC] at *

/-- The max step used at verify.py:243 is sound when each candidate is sound. -/
theorem renewal_max_sound {rec prev old seed target : ℕ}
    (hr : rec ≤ target) (hp : prev ≤ target)
    (ho : old ≤ target) (hs : seed ≤ target) :
    max (max (max rec prev) old) seed ≤ target := by
  exact max_le (max_le (max_le hr hp) ho) hs

/-- The same max makes the freshly computed correction nonnegative. -/
theorem renewal_correction {rec prev old seed : ℕ} :
    rec ≤ max (max (max rec prev) old) seed := by
  exact le_trans (le_trans (le_max_left _ _) (le_max_left _ _)) (le_max_left _ _)

#print axioms extension_projection
#print axioms renewal_max_sound
#print axioms renewal_correction
end UpperRenewal
