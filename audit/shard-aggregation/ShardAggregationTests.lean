import ShardAggregation
open ShardAggregation

def toy (i : Nat) : Prop := i ≠ 3

theorem toy_first : Segment toy 0 2 := by
  intro i _ hi
  simp only [toy]
  omega

theorem toy_second : Segment toy 2 3 := by
  intro i _ hi
  simp only [toy]
  omega

theorem toy_chain : Chain toy 0 3 :=
  .append (.append (.empty 0) toy_first) toy_second

example : ∀ i < 3, toy i := prefix_sound toy_chain

-- A false element cannot be smuggled through either a shard or the chain.
example : ¬ Segment toy 3 4 := by
  intro h
  have bad := h 3 (by omega) (by omega)
  exact bad rfl

example : ¬ Chain toy 0 4 := by
  intro h
  have bad := prefix_sound h 3 (by omega)
  exact bad rfl

-- Adjacent construction does not bridge an uncovered index.
example : ¬ Chain toy 0 5 := by
  intro h
  have bad := prefix_sound h 3 (by omega)
  exact bad rfl

#print axioms toy_chain
