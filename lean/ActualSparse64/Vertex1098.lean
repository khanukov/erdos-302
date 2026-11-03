import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair1098_full : SparseBoundaryFast.pairs S lookup D 1098 = true := by decide

theorem shard1098_full : SparseBoundaryShards.shard S D 1098 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 1098 source_lookup (by decide) pair1098_full
#print axioms pair1098_full
#print axioms shard1098_full
end ActualSparse64
