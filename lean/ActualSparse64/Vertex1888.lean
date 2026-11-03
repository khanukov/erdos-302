import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair1888_full : SparseBoundaryFast.pairs S lookup D 1888 = true := by decide

theorem shard1888_full : SparseBoundaryShards.shard S D 1888 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 1888 source_lookup (by decide) pair1888_full
#print axioms pair1888_full
#print axioms shard1888_full
end ActualSparse64
