import ShardAggregation
import MixedCaseTrimCandidate

/-! Candidate bridge: shard proofs themselves must be provided and checked. -/
namespace MixedPrefixShards
open ShardAggregation

theorem checked {nodes : ℕ → MixedDag.Node MixedCaseTrimCandidate.Payload}
    {count : ℕ}
    (shards : Chain (MixedDag.Check MixedCaseTrimCandidate.extraCheck nodes) 0 count) :
    ∀ i < count, MixedDag.Check MixedCaseTrimCandidate.extraCheck nodes i :=
  prefix_sound shards

theorem sound {nodes : ℕ → MixedDag.Node MixedCaseTrimCandidate.Payload}
    {count : ℕ}
    (shards : Chain (MixedDag.Check MixedCaseTrimCandidate.extraCheck nodes) 0 count) :
    ∀ i < count, Extended.Bound (nodes i).support (nodes i).demand :=
  MixedCaseTrimCandidate.sound nodes count (checked shards)

#print axioms MixedPrefixShards.checked
#print axioms MixedPrefixShards.sound
end MixedPrefixShards
