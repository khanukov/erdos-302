import Dag

/-! A mixed, ordered DAG kernel with occurrence-indexed scaled packing.
The extension constructor is conditional on a semantic soundness contract;
case and trim rules are not implemented by this module. -/
open Finset UpperBridge
namespace MixedDag

structure Row where
  source : ℕ
  mul : ℕ
  div : ℕ
  weight : ℕ

inductive Rule (ε : Type) where
  | edge (a b c : ℕ)
  | small
  | image (source mul div : ℕ)
  | pack (n : ℕ) (rows : Fin n → Row) (denom : ℕ)
  | extra (payload : ε)

structure Node (ε : Type) where
  support : Finset ℕ
  demand : ℕ
  rule : Rule ε

def rowImage {ε : Type} (nodes : ℕ → Node ε) (r : Row) : Finset ℕ :=
  ArchiveScaling.image (nodes r.source).support r.mul r.div

def Check {ε : Type} (extraCheck : (ℕ → Node ε) → ℕ → ε → Prop)
    (nodes : ℕ → Node ε) (i : ℕ) : Prop :=
  let n := nodes i
  match n.rule with
  | .edge a b c =>
      n.support = {a,b,c} ∧ n.demand ≤ 1 ∧ OrderedEdge {a,b,c} a b c
  | .small => ArchiveDag.SmallCheck n.support n.demand
  | .image j m d =>
      j < i ∧ 0 < m ∧ 0 < d ∧
      (∀ x ∈ (nodes j).support, d ∣ x * m) ∧
      n.support = ArchiveScaling.image (nodes j).support m d ∧
      n.demand ≤ (nodes j).demand
  | .pack count rows D =>
      (∀ r, (rows r).source < i ∧ 0 < (rows r).mul ∧ 0 < (rows r).div ∧
        (∀ x ∈ (nodes (rows r).source).support,
          (rows r).div ∣ x * (rows r).mul)) ∧
      ArchivePack.Valid Finset.univ (fun r => rowImage nodes (rows r))
        (fun r => (rows r).weight) (fun r => (nodes (rows r).source).demand)
        D n.demand n.support
  | .extra e => extraCheck nodes i e

instance {ε : Type} (extraCheck : (ℕ → Node ε) → ℕ → ε → Prop)
    [∀ nodes i e, Decidable (extraCheck nodes i e)]
    (nodes : ℕ → Node ε) (i : ℕ) : Decidable (Check extraCheck nodes i) := by
  unfold Check
  dsimp only
  cases (nodes i).rule <;> dsimp only [ArchivePack.Valid, OrderedEdge] <;> infer_instance

/-- An extension may use prior semantic bounds, but must prove its own rule
sound. No old-checker assumption or assumed soundness of a pack row is used. -/
theorem sound {ε : Type} (extraCheck : (ℕ → Node ε) → ℕ → ε → Prop)
    (extraSound : ∀ nodes i e, extraCheck nodes i e →
      (∀ j < i, Extended.Bound (nodes j).support (nodes j).demand) →
      Extended.Bound (nodes i).support (nodes i).demand)
    (nodes : ℕ → Node ε) (count : ℕ)
    (valid : ∀ i < count, Check extraCheck nodes i) :
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
      exact ArchiveDag.small_sound chk
    | image j m d =>
      simp only [hr] at chk
      rcases chk with ⟨hj, hm, hd, hex, hu, hk⟩
      have hb := ih j hj (lt_trans hj hi)
      have him := ArchivePack.scaled_bound hm hd hex hb
      rw [hu]
      intro S hs
      exact le_trans hk (him S hs)
    | pack count rows D =>
      simp only [hr] at chk
      rcases chk with ⟨hrows, hpack⟩
      apply ArchivePack.sound Finset.univ (fun r => rowImage nodes (rows r))
        (fun r => (rows r).weight) (fun r => (nodes (rows r).source).demand)
        D (nodes i).demand (nodes i).support hpack
      intro r _
      obtain ⟨href, hm, hd, hex⟩ := hrows r
      exact ArchivePack.scaled_bound hm hd hex
        (ih (rows r).source href (lt_trans href hi))
    | extra e =>
      simp only [hr] at chk
      apply extraSound nodes i e chk
      intro j hj
      exact ih j hj (lt_trans hj hi)

#print axioms MixedDag.sound
end MixedDag
