import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair295_full : SparseBoundaryFast.pairs S lookup D 295 = true := by decide

theorem shard295_full : SparseBoundaryShards.shard S D 295 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 295 source_lookup (by decide) pair295_full
#print axioms pair295_full
#print axioms shard295_full
end ActualSparse64
