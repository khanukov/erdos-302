import UpperBank
set_option maxRecDepth 8192
set_option maxHeartbeats 0
set_option linter.unusedSimpArgs false
open UpperBridge
namespace Extended

def Bound (U : Finset ℕ) (r : ℕ) : Prop :=
  ∀ S : Finset ℕ, OrderedCover U S → r ≤ S.card

-- Covers restrict to any vertex subset.
theorem cover_mono {U V S : Finset ℕ} (h : U ⊆ V) (hs : OrderedCover V S) :
    OrderedCover U S := by
  intro a b c he
  exact hs a b c ⟨h he.1, h he.2.1, h he.2.2.1, he.2.2.2⟩

theorem bound_mono {U V : Finset ℕ} {r : ℕ} (h : U ⊆ V) (hb : Bound U r) : Bound V r := by
  intro S hs
  exact hb S (cover_mono h hs)

-- A cover can be restricted to the vertices without losing coverage.
theorem cover_inter {U S : Finset ℕ} (h : OrderedCover U S) : OrderedCover U (S ∩ U) := by
  intro a b c he
  rcases h a b c he with ha | hb | hc
  · exact Or.inl (Finset.mem_inter.mpr ⟨ha, he.1⟩)
  · exact Or.inr (Or.inl (Finset.mem_inter.mpr ⟨hb, he.2.1⟩))
  · exact Or.inr (Or.inr (Finset.mem_inter.mpr ⟨hc, he.2.2.1⟩))

-- Packing lower bounds on two disjoint vertex regions; no independence of edges required.
theorem pack {U V : Finset ℕ} {r s : ℕ} (hd : Disjoint U V)
    (hu : Bound U r) (hv : Bound V s) : Bound (U ∪ V) (r+s) := by
  intro S hs
  have h₁ := hu (S ∩ U) (cover_inter (cover_mono Finset.subset_union_left hs))
  have h₂ := hv (S ∩ V) (cover_inter (cover_mono Finset.subset_union_right hs))
  have hdis : Disjoint (S ∩ U) (S ∩ V) := Finset.disjoint_left.mpr (by
    intro x hx hy
    exact Finset.disjoint_left.mp hd (Finset.mem_inter.mp hx).2 (Finset.mem_inter.mp hy).2)
  have hsub : (S ∩ U) ∪ (S ∩ V) ⊆ S := by
    intro x hx
    rcases Finset.mem_union.mp hx with hx | hx <;> exact (Finset.mem_inter.mp hx).1
  have hc := Finset.card_le_card hsub
  rw [Finset.card_union_of_disjoint hdis] at hc
  omega

-- Branch decomposition does not assume either branch is inhabited.
theorem branch {U : Finset ℕ} {r : ℕ} (x : ℕ)
    (hin : ∀ S, OrderedCover U S → x ∈ S → r ≤ S.card)
    (hout : ∀ S, OrderedCover U S → x ∉ S → r ≤ S.card) : Bound U r := by
  intro S hs
  by_cases hx : x ∈ S
  · exact hin S hs hx
  · exact hout S hs hx

-- Trim: dropping vertices that occur in no edge preserves the cover predicate.
theorem trim_cover {U V S : Finset ℕ} (hVU : V ⊆ U)
    (hkeep : ∀ a b c, OrderedEdge U a b c → a ∈ V ∧ b ∈ V ∧ c ∈ V) :
    OrderedCover V S ↔ OrderedCover U S := by
  constructor
  · intro h a b c he
    have hh := hkeep a b c he
    exact h a b c ⟨hh.1, hh.2.1, hh.2.2, he.2.2.2⟩
  · exact cover_mono hVU

theorem trim_bound {U V : Finset ℕ} {r : ℕ} (hVU : V ⊆ U)
    (hkeep : ∀ a b c, OrderedEdge U a b c → a ∈ V ∧ b ∈ V ∧ c ∈ V)
    (h : Bound U r) : Bound V r := by
  intro S hs
  exact h S ((trim_cover hVU hkeep).mp hs)

-- Explicit ordered edge certificate, checked by kernel arithmetic.
theorem edge_bound {a b c : ℕ} (he : OrderedEdge ({a,b,c} : Finset ℕ) a b c) :
    Bound ({a,b,c} : Finset ℕ) 1 := by
  intro S hs
  rcases hs a b c he with ha | hb | hc
  · exact Finset.card_pos.mpr ⟨a, ha⟩
  · exact Finset.card_pos.mpr ⟨b, hb⟩
  · exact Finset.card_pos.mpr ⟨c, hc⟩

theorem edge_0 : Bound ({2,3,6} : Finset ℕ) 1 := UpperBank.bank_node_0
theorem edge_2 : Bound ({4,5,20} : Finset ℕ) 1 := by
  apply edge_bound
  norm_num [OrderedEdge]
theorem edge_3 : Bound ({6,10,15} : Finset ℕ) 1 := by
  apply edge_bound
  norm_num [OrderedEdge]
theorem edge_6 : Bound ({12,21,28} : Finset ℕ) 1 := by
  apply edge_bound
  norm_num [OrderedEdge]
theorem edge_aux : Bound ({8,12,24} : Finset ℕ) 1 := by
  apply edge_bound
  norm_num [OrderedEdge]
theorem edge_aux2 : Bound ({10,15,30} : Finset ℕ) 1 := by
  apply edge_bound
  norm_num [OrderedEdge]

theorem bank_node_4 : Bound ({2,3,4,5,6,7,8,10,12,14,15,16,20,21,24} : Finset ℕ) 3 := by
  apply bound_mono (U := (({4,5,20} : Finset ℕ) ∪ {6,10,15}) ∪ {8,12,24})
  · decide
  · apply pack (r := 2) (s := 1)
    · decide
    · exact pack (by decide) edge_2 edge_3
    · exact edge_aux

theorem bank_node_7 : Bound ({2,3,4,5,6,7,8,10,12,14,15,16,20,21,24,28,30} : Finset ℕ) 4 := by
  apply bound_mono (U := ((({2,3,6} : Finset ℕ) ∪ {4,5,20}) ∪ {10,15,30}) ∪ {12,21,28})
  · decide
  · apply pack (r := 3) (s := 1)
    · decide
    · apply pack (r := 2) (s := 1)
      · decide
      · exact pack (by decide) edge_0 edge_2
      · exact edge_aux2
    · exact edge_6

-- Trim outputs 5 and 8, independently witnessed by the same disjoint rows.
theorem bank_node_5 : Bound ({2,3,4,5,6,8,10,12,15,20,24} : Finset ℕ) 3 := by
  apply bound_mono (U := (({4,5,20} : Finset ℕ) ∪ {6,10,15}) ∪ {8,12,24})
  · decide
  · apply pack (r := 2) (s := 1)
    · decide
    · exact pack (by decide) edge_2 edge_3
    · exact edge_aux

theorem bank_node_8 : Bound ({2,3,4,5,6,8,10,12,15,20,21,24,28,30} : Finset ℕ) 4 := by
  apply bound_mono (U := ((({2,3,6} : Finset ℕ) ∪ {4,5,20}) ∪ {10,15,30}) ∪ {12,21,28})
  · decide
  · apply pack (r := 3) (s := 1)
    · decide
    · apply pack (r := 2) (s := 1)
      · decide
      · exact pack (by decide) edge_0 edge_2
      · exact edge_aux2
    · exact edge_6

theorem bank_node_9 : Bound ({10,14,35} : Finset ℕ) 1 := by
  apply UpperBank.ordered_sound (E := {{10,14,35}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    rcases he with rfl
    · exact ⟨10,14,35, by norm_num [OrderedEdge], rfl⟩

theorem bank_node_10 : Bound ({15,24,40} : Finset ℕ) 1 := by
  apply UpperBank.ordered_sound (E := {{15,24,40}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    rcases he with rfl
    · exact ⟨15,24,40, by norm_num [OrderedEdge], rfl⟩

theorem bank_node_11 : Bound ({2,3,4,5,6,12,20,30} : Finset ℕ) 3 := by
  apply UpperBank.ordered_sound (E := {{2,3,6},{3,4,12},{4,5,20},{4,6,12},{5,6,30},{12,20,30}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    rcases he with rfl | rfl | rfl | rfl | rfl | rfl
    · exact ⟨2,3,6, by norm_num [OrderedEdge], rfl⟩
    · exact ⟨3,4,12, by norm_num [OrderedEdge], rfl⟩
    · exact ⟨4,5,20, by norm_num [OrderedEdge], rfl⟩
    · exact ⟨4,6,12, by norm_num [OrderedEdge], rfl⟩
    · exact ⟨5,6,30, by norm_num [OrderedEdge], rfl⟩
    · exact ⟨12,20,30, by norm_num [OrderedEdge], rfl⟩

theorem bank_node_12 : Bound ({8,10,15,24,30,40} : Finset ℕ) 2 := by
  apply UpperBank.ordered_sound (E := {{8,10,40},{10,15,30},{15,24,40}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    rcases he with rfl | rfl | rfl
    · exact ⟨8,10,40, by norm_num [OrderedEdge], rfl⟩
    · exact ⟨10,15,30, by norm_num [OrderedEdge], rfl⟩
    · exact ⟨15,24,40, by norm_num [OrderedEdge], rfl⟩

theorem bank_node_13 : Bound ({8,10,12,15,24,40} : Finset ℕ) 2 := by
  apply UpperBank.ordered_sound (E := {{8,10,40},{8,12,24},{15,24,40}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    rcases he with rfl | rfl | rfl
    · exact ⟨8,10,40, by norm_num [OrderedEdge], rfl⟩
    · exact ⟨8,12,24, by norm_num [OrderedEdge], rfl⟩
    · exact ⟨15,24,40, by norm_num [OrderedEdge], rfl⟩

theorem bank_node_16 : Bound ({7,8,56} : Finset ℕ) 1 := by
  apply UpperBank.ordered_sound (E := {{7,8,56}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    rcases he with rfl
    · exact ⟨7,8,56, by norm_num [OrderedEdge], rfl⟩

theorem bank_node_17 : Bound ({3,4,12} : Finset ℕ) 1 := by
  apply UpperBank.ordered_sound (E := {{3,4,12}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    rcases he with rfl
    · exact ⟨3,4,12, by norm_num [OrderedEdge], rfl⟩

theorem bank_node_18 : Bound ({7,8,12,16,24,42,48,56} : Finset ℕ) 3 := by
  apply UpperBank.ordered_sound (E := {{7,8,56},{8,12,24},{12,16,48},{16,24,48},{24,42,56}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    rcases he with rfl | rfl | rfl | rfl | rfl
    · exact ⟨7,8,56, by norm_num [OrderedEdge], rfl⟩
    · exact ⟨8,12,24, by norm_num [OrderedEdge], rfl⟩
    · exact ⟨12,16,48, by norm_num [OrderedEdge], rfl⟩
    · exact ⟨16,24,48, by norm_num [OrderedEdge], rfl⟩
    · exact ⟨24,42,56, by norm_num [OrderedEdge], rfl⟩

theorem bank_node_19 : Bound ({21,30,70} : Finset ℕ) 1 := by
  apply UpperBank.ordered_sound (E := {{21,30,70}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    rcases he with rfl
    · exact ⟨21,30,70, by norm_num [OrderedEdge], rfl⟩

theorem bank_node_20 : Bound ({35,60,84} : Finset ℕ) 1 := by
  apply UpperBank.ordered_sound (E := {{35,60,84}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    rcases he with rfl
    · exact ⟨35,60,84, by norm_num [OrderedEdge], rfl⟩

theorem bank_node_21 : Bound ({8,10,12,15,16,24,40,48} : Finset ℕ) 3 := by
  apply UpperBank.ordered_sound (E := {{8,10,40},{8,12,24},{12,16,48},{15,24,40},{16,24,48}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    rcases he with rfl | rfl | rfl | rfl | rfl
    · exact ⟨8,10,40, by norm_num [OrderedEdge], rfl⟩
    · exact ⟨8,12,24, by norm_num [OrderedEdge], rfl⟩
    · exact ⟨12,16,48, by norm_num [OrderedEdge], rfl⟩
    · exact ⟨15,24,40, by norm_num [OrderedEdge], rfl⟩
    · exact ⟨16,24,48, by norm_num [OrderedEdge], rfl⟩

theorem bank_node_22 : Bound ({5,6,10,12,15,30,60} : Finset ℕ) 3 := by
  apply UpperBank.ordered_sound (E := {{5,6,30},{6,10,15},{10,12,60},{10,15,30},{12,15,60}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    rcases he with rfl | rfl | rfl | rfl | rfl
    · exact ⟨5,6,30, by norm_num [OrderedEdge], rfl⟩
    · exact ⟨6,10,15, by norm_num [OrderedEdge], rfl⟩
    · exact ⟨10,12,60, by norm_num [OrderedEdge], rfl⟩
    · exact ⟨10,15,30, by norm_num [OrderedEdge], rfl⟩
    · exact ⟨12,15,60, by norm_num [OrderedEdge], rfl⟩

theorem bank_node_23 : Bound ({15,20,24,40,60} : Finset ℕ) 2 := by
  apply UpperBank.ordered_sound (E := {{15,20,60},{15,24,40},{24,40,60}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    rcases he with rfl | rfl | rfl
    · exact ⟨15,20,60, by norm_num [OrderedEdge], rfl⟩
    · exact ⟨15,24,40, by norm_num [OrderedEdge], rfl⟩
    · exact ⟨24,40,60, by norm_num [OrderedEdge], rfl⟩

theorem bank_node_24 : Bound ({5,6,10,15,30} : Finset ℕ) 2 := by
  apply UpperBank.ordered_sound (E := {{5,6,30},{6,10,15},{10,15,30}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    rcases he with rfl | rfl | rfl
    · exact ⟨5,6,30, by norm_num [OrderedEdge], rfl⟩
    · exact ⟨6,10,15, by norm_num [OrderedEdge], rfl⟩
    · exact ⟨10,15,30, by norm_num [OrderedEdge], rfl⟩

#print axioms bank_node_5
#print axioms bank_node_8
#print axioms bank_node_24
#print axioms bank_node_18
#print axioms bank_node_4
#print axioms bank_node_7
#check pack
#print axioms pack
#print axioms trim_bound
#print axioms branch
end Extended
