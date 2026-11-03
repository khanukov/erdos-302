import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair1281_full : SparseBoundaryFast.pairs S lookup D 1281 = true := by decide

theorem shard1281_full : SparseBoundaryShards.shard S D 1281 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 1281 source_lookup (by decide) pair1281_full
#print axioms pair1281_full
#print axioms shard1281_full
end ActualSparse64
