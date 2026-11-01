import UpperBridge

namespace UpperBank

variable {α : Type*} [DecidableEq α]

/-- Finite hypergraph cover. Edges are arbitrary finite sets. -/
def Cover (E : Finset (Finset α)) (S : Finset α) : Prop :=
  ∀ e ∈ E, ∃ x ∈ e, x ∈ S

instance (E : Finset (Finset α)) (S : Finset α) : Decidable (Cover E S) := by
  unfold Cover
  infer_instance

/-- Exhaustively check every subset of U: each cover has size at least r. -/
def check (U : Finset α) (E : Finset (Finset α)) (r : ℕ) : Bool :=
  decide (∀ S ∈ U.powerset, Cover E S → r ≤ S.card)

/-- The enumeration is sound for covers contained in the vertex set. -/
theorem check_sound_subset {U : Finset α} {E : Finset (Finset α)} {r : ℕ}
    (h : check U E r = true) {S : Finset α} (hs : S ⊆ U) (hc : Cover E S) :
    r ≤ S.card := by
  have h' : ∀ S ∈ U.powerset, Cover E S → r ≤ S.card := of_decide_eq_true h
  exact h' S (Finset.mem_powerset.mpr hs) hc

/-- Edges must lie in U, permitting an arbitrary cover to be restricted to U. -/
theorem check_sound {U : Finset α} {E : Finset (Finset α)} {r : ℕ}
    (h : check U E r = true) (hedges : ∀ e ∈ E, e ⊆ U)
    {S : Finset α} (hc : Cover E S) : r ≤ S.card := by
  apply le_trans (check_sound_subset h (Finset.inter_subset_left) ?_) (Finset.card_le_card Finset.inter_subset_right)
  intro e he
  obtain ⟨x, hxe, hxS⟩ := hc e he
  exact ⟨x, hxe, Finset.mem_inter.mpr ⟨hedges e he hxe, hxS⟩⟩

/-- Every listed edge must be a genuine ordered arithmetic edge. The list may be incomplete. -/
theorem ordered_sound {U : Finset ℕ} {E : Finset (Finset ℕ)} {r : ℕ}
    (h : check U E r = true)
    (hvalid : ∀ e ∈ E, ∃ a b c, UpperBridge.OrderedEdge U a b c ∧ e = {a,b,c}) :
    ∀ S : Finset ℕ, UpperBridge.OrderedCover U S → r ≤ S.card := by
  have hedges : ∀ e ∈ E, e ⊆ U := by
    intro e he
    obtain ⟨a,b,c,habc,rfl⟩ := hvalid e he
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl
    · exact habc.1
    · exact habc.2.1
    · exact habc.2.2.1
  intro S hs
  apply check_sound h hedges
  intro e he
  obtain ⟨a,b,c,habc,rfl⟩ := hvalid e he
  rcases hs a b c habc with ha | hb | hc
  · exact ⟨a, by simp, ha⟩
  · exact ⟨b, by simp, hb⟩
  · exact ⟨c, by simp, hc⟩

/-- Bank node 0: {"t":"small","v":[2,3,6],"r":1}. -/
theorem bank_node_0 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2,3,6} : Finset ℕ) S → 1 ≤ S.card := by
  apply ordered_sound (E := {{2,3,6}})
  · decide
  · intro e he
    have : e = ({2,3,6} : Finset ℕ) := by simpa using he
    subst e
    exact ⟨2,3,6, by norm_num [UpperBridge.OrderedEdge], rfl⟩

/-- Bank node 1: the three real edges force at least two deletions. -/
theorem bank_node_1 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2,3,4,6,12} : Finset ℕ) S → 2 ≤ S.card := by
  apply ordered_sound (E := {{2,3,6}, {3,4,12}, {4,6,12}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    rcases he with rfl | rfl | rfl
    · exact ⟨2,3,6, by norm_num [UpperBridge.OrderedEdge], rfl⟩
    · exact ⟨3,4,12, by norm_num [UpperBridge.OrderedEdge], rfl⟩
    · exact ⟨4,6,12, by norm_num [UpperBridge.OrderedEdge], rfl⟩

#print axioms bank_node_1
#print axioms check_sound
#print axioms ordered_sound
#print axioms bank_node_0
end UpperBank
