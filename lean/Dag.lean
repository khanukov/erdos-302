import PackRule

/-! A finite, ordered certificate checker. The only leaf assumptions are checked
edge arithmetic and an exhaustive finite cover check; no external profile is
assumed. All references are strictly earlier node numbers. -/
open Finset UpperBridge
namespace ArchiveDag

inductive Rule where
  | edge (a b c : ℕ)
  | small
  | image (source m d : ℕ)
  | pack (refs : Finset ℕ) (weight : ℕ → ℕ) (denom : ℕ)

structure Node where
  support : Finset ℕ
  demand : ℕ
  rule : Rule

/-- Only finite sets and bounded quantifiers occur in this exhaustive check. -/
def SmallCheck (U : Finset ℕ) (k : ℕ) : Prop :=
  ∀ S ∈ U.powerset,
    (∀ a ∈ U, ∀ b ∈ U, ∀ c ∈ U,
      OrderedEdge U a b c → a ∈ S ∨ b ∈ S ∨ c ∈ S) → k ≤ S.card

instance (U : Finset ℕ) (k : ℕ) : Decidable (SmallCheck U k) := by
  unfold SmallCheck OrderedEdge
  infer_instance

theorem small_sound {U : Finset ℕ} {k : ℕ} (h : SmallCheck U k) :
    Extended.Bound U k := by
  intro S hs
  have hp : S ∩ U ∈ U.powerset := Finset.mem_powerset.mpr Finset.inter_subset_right
  have hc := h (S ∩ U) hp (by
    intro a ha b hb c hc he
    exact Extended.cover_inter hs a b c he)
  exact le_trans hc (Finset.card_le_card Finset.inter_subset_left)

/-- The environment contains only the input nodes, never asserted bounds. -/
def Check (nodes : ℕ → Node) (i : ℕ) : Prop :=
  let n := nodes i
  match n.rule with
  | .edge a b c =>
      n.support = {a,b,c} ∧ n.demand ≤ 1 ∧ OrderedEdge {a,b,c} a b c
  | .small => SmallCheck n.support n.demand
  | .image j m d =>
      j < i ∧ 0 < m ∧ 0 < d ∧
      (∀ x ∈ (nodes j).support, d ∣ x * m) ∧
      n.support = ArchiveScaling.image (nodes j).support m d ∧
      n.demand ≤ (nodes j).demand
  | .pack refs w D =>
      (∀ j ∈ refs, j < i) ∧
      ArchivePack.Valid refs (fun j => (nodes j).support) w
        (fun j => (nodes j).demand) D n.demand n.support

instance (nodes : ℕ → Node) (i : ℕ) : Decidable (Check nodes i) := by
  unfold Check
  dsimp only
  cases (nodes i).rule <;> dsimp only [ArchivePack.Valid, OrderedEdge] <;> infer_instance

/-- Strong induction establishes the prior-node invariant at each index. -/
theorem sound (nodes : ℕ → Node) (count : ℕ)
    (valid : ∀ i < count, Check nodes i) :
    ∀ i < count, Extended.Bound (nodes i).support (nodes i).demand := by
  intro i
  induction i using Nat.strong_induction_on with
  | h i ih =>
    intro hi
    have chk := valid i hi
    unfold Check at chk
    dsimp only at chk
    cases hr : (nodes i).rule with
    | edge a b c =>
      simp only [hr] at chk
      rcases chk with ⟨hu, hk, he⟩
      rw [hu]
      intro S hs
      exact le_trans hk (Extended.edge_bound he S hs)
    | small =>
      simp only [hr] at chk
      exact small_sound chk
    | image j m d =>
      simp only [hr] at chk
      rcases chk with ⟨hj, hm, hd, hex, hu, hk⟩
      have hb := ih j hj (lt_trans hj hi)
      have him := ArchivePack.scaled_bound hm hd hex hb
      rw [hu]
      intro S hs
      exact le_trans hk (him S hs)
    | pack refs w D =>
      simp only [hr] at chk
      rcases chk with ⟨prior, hp⟩
      apply ArchivePack.sound refs (fun j => (nodes j).support) w
        (fun j => (nodes j).demand) D (nodes i).demand (nodes i).support hp
      intro j hj
      have hji := prior j hj
      exact ih j hji (lt_trans hji hi)

#print axioms sound
end ArchiveDag
