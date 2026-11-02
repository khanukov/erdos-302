import Dag
import Projection

/-! A semantic bridge from a checked DAG node to one profile seed.  It does
not assert that any archive bytes were translated correctly, nor that the
archive's rank computation agrees with `Smooth`. -/
namespace BankProfile
open Finset UpperBridge
noncomputable local instance (Q : Finset ℕ) : DecidablePred (UpperProjection.Smooth Q) := Classical.decPred _

/-- Deleting arbitrary vertices from a support loses at most their number. -/
theorem restrict_bound {S T : Finset ℕ} {r : ℕ} (hTS : T ⊆ S)
    (h : Extended.Bound S r) : Extended.Bound T (r - (S \ T).card) := by
  intro C hc
  have hext : ∀ a b c, OrderedEdge S a b c →
      (a ∈ T ∧ b ∈ T ∧ c ∈ T) ∨
      (a ∈ S \ T ∨ b ∈ S \ T ∨ c ∈ S \ T) := by
    intro a b c e
    by_cases ha : a ∈ T <;> by_cases hb : b ∈ T <;> by_cases hc : c ∈ T
    · exact Or.inl ⟨ha, hb, hc⟩
    all_goals simp_all [Finset.mem_sdiff, OrderedEdge]
  have h' := UpperRenewal.extension_projection hTS h hext C hc
  omega

/-- Every checked node can supply a sound seed at every prefix.  The outside
cost is precisely the number of even non-smooth support vertices; the second
cost counts smooth support vertices above the prefix threshold. -/
theorem checked_node_seed (nodes : ℕ → ArchiveDag.Node) (count j : ℕ)
    (valid : ∀ i < count, ArchiveDag.Check nodes i) (hj : j < count)
    (Q : Finset ℕ) (n : ℕ) :
    let S := (nodes j).support
    let T := S.filter (UpperProjection.Smooth Q)
    let U := S.filter (fun x => ¬ UpperProjection.Smooth Q x ∧ x % 2 = 0)
    let P := T.filter (fun x => x ≤ n)
    Extended.Bound P ((nodes j).demand - U.card - (T \ P).card) := by
  classical
  dsimp only
  let S := (nodes j).support
  let T := S.filter (UpperProjection.Smooth Q)
  let U := S.filter (fun x => ¬ UpperProjection.Smooth Q x ∧ x % 2 = 0)
  let P := T.filter (fun x => x ≤ n)
  have hb : Extended.Bound S (nodes j).demand := ArchiveDag.sound nodes count valid j hj
  have ht : Extended.Bound T ((nodes j).demand - U.card) := by
    intro C hc
    have h := UpperProjection.smooth_projection S Q (nodes j).demand hb C hc
    change (nodes j).demand ≤ C.card + U.card at h
    omega
  exact restrict_bound (Finset.filter_subset _ _) ht

#print axioms restrict_bound
#print axioms checked_node_seed
end BankProfile
