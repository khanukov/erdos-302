import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair1062_full : SparseBoundaryFast.pairs S lookup D 1062 = true := by decide

theorem shard1062_full : SparseBoundaryShards.shard S D 1062 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 1062 source_lookup (by decide) pair1062_full
#print axioms pair1062_full
#print axioms shard1062_full
end ActualSparse64
