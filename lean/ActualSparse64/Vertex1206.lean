import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair1206_full : SparseBoundaryFast.pairs S lookup D 1206 = true := by decide

theorem shard1206_full : SparseBoundaryShards.shard S D 1206 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 1206 source_lookup (by decide) pair1206_full
#print axioms pair1206_full
#print axioms shard1206_full
end ActualSparse64
