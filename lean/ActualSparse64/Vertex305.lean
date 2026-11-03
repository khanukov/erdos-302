import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair305_full : SparseBoundaryFast.pairs S lookup D 305 = true := by decide

theorem shard305_full : SparseBoundaryShards.shard S D 305 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 305 source_lookup (by decide) pair305_full
#print axioms pair305_full
#print axioms shard305_full
end ActualSparse64
