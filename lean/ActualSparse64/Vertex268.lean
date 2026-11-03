import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair268_full : SparseBoundaryFast.pairs S lookup D 268 = true := by decide

theorem shard268_full : SparseBoundaryShards.shard S D 268 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 268 source_lookup (by decide) pair268_full
#print axioms pair268_full
#print axioms shard268_full
end ActualSparse64
