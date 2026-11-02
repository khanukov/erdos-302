import Lean

/-! Generic adjacent interval aggregation. A shard proves the actual predicate at
    each index; the chain contains no assumption that an earlier prefix passed. -/
namespace ShardAggregation

def Segment (P : Nat → Prop) (lo hi : Nat) : Prop :=
  ∀ i, lo ≤ i → i < hi → P i

inductive Chain (P : Nat → Prop) : Nat → Nat → Prop where
  | empty (a : Nat) : Chain P a a
  | append {a b c : Nat} : Chain P a b → Segment P b c → Chain P a c

theorem chain_sound {P : Nat → Prop} {a b : Nat} (h : Chain P a b) :
    Segment P a b := by
  induction h with
  | empty =>
      intro i ha hb
      omega
  | @append b c left right ih =>
      intro i ha hc
      by_cases hib : i < b
      · exact ih i ha hib
      · exact right i (by omega) hc

theorem prefix_sound {P : Nat → Prop} {count : Nat}
    (h : Chain P 0 count) : ∀ i < count, P i := by
  intro i hi
  exact chain_sound h i (Nat.zero_le i) hi

#print axioms chain_sound
#print axioms prefix_sound
end ShardAggregation
