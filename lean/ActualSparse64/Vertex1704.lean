import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair1704_full : SparseBoundaryFast.pairs S lookup D 1704 = true := by decide

theorem shard1704_full : SparseBoundaryShards.shard S D 1704 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 1704 source_lookup (by decide) pair1704_full
#print axioms pair1704_full
#print axioms shard1704_full
end ActualSparse64
