import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair1464_full : SparseBoundaryFast.pairs S lookup D 1464 = true := by decide

theorem shard1464_full : SparseBoundaryShards.shard S D 1464 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 1464 source_lookup (by decide) pair1464_full
#print axioms pair1464_full
#print axioms shard1464_full
end ActualSparse64
