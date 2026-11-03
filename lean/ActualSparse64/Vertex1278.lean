import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair1278_full : SparseBoundaryFast.pairs S lookup D 1278 = true := by decide

theorem shard1278_full : SparseBoundaryShards.shard S D 1278 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 1278 source_lookup (by decide) pair1278_full
#print axioms pair1278_full
#print axioms shard1278_full
end ActualSparse64
