import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair1652_full : SparseBoundaryFast.pairs S lookup D 1652 = true := by decide

theorem shard1652_full : SparseBoundaryShards.shard S D 1652 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 1652 source_lookup (by decide) pair1652_full
#print axioms pair1652_full
#print axioms shard1652_full
end ActualSparse64
