import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair1407_full : SparseBoundaryFast.pairs S lookup D 1407 = true := by decide

theorem shard1407_full : SparseBoundaryShards.shard S D 1407 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 1407 source_lookup (by decide) pair1407_full
#print axioms pair1407_full
#print axioms shard1407_full
end ActualSparse64
