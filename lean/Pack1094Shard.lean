import Pack1094
import PackShard

open Finset UpperBridge
open scoped BigOperators

namespace ArchivePack1094

/- One bounded capacity shard: vertex 2 against *all 436 rows*. This is
    only one capacity check, not the full node certificate. -/
set_option maxRecDepth 65536 in
set_option maxHeartbeats 0 in
theorem capacity_vertex_two :
    (∑ i ∈ indices.filter (fun i => 2 ∈ T i), w i) ≤ 1000 := by
  decide

set_option maxRecDepth 8192 in
/-- Interface for future shards; no assertion that these hypotheses have yet
    been established for node 1094. -/
theorem valid_from_shards {σ : Type*} (shard : σ → ℕ → Prop)
    (hsub : ∀ i ∈ indices, T i ⊆ support)
    (hcover : ∀ x ∈ support, ∃ s, shard s x)
    (hcap : ∀ s x, shard s x →
      (∑ i ∈ indices.filter (fun i => x ∈ T i), w i) ≤ 1000)
    (hround : 1000 * (217 - 1) < ∑ i ∈ indices, w i * r i) :
    ArchivePack.Valid indices T w r 1000 217 support := by
  apply ArchivePack.valid_of_capacity_shards indices T w r 1000 217 support shard
  · decide
  · exact hsub
  · exact hcover
  · exact hcap
  · exact hround

#print axioms capacity_vertex_two
#print axioms valid_from_shards
end ArchivePack1094
