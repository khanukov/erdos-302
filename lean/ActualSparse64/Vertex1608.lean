import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair1608_full : SparseBoundaryFast.pairs S lookup D 1608 = true := by decide

theorem shard1608_full : SparseBoundaryShards.shard S D 1608 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 1608 source_lookup (by decide) pair1608_full
#print axioms pair1608_full
#print axioms shard1608_full
end ActualSparse64
