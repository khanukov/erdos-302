import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair1180_full : SparseBoundaryFast.pairs S lookup D 1180 = true := by decide

theorem shard1180_full : SparseBoundaryShards.shard S D 1180 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 1180 source_lookup (by decide) pair1180_full
#print axioms pair1180_full
#print axioms shard1180_full
end ActualSparse64
