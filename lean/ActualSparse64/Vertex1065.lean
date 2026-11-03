import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair1065_full : SparseBoundaryFast.pairs S lookup D 1065 = true := by decide

theorem shard1065_full : SparseBoundaryShards.shard S D 1065 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 1065 source_lookup (by decide) pair1065_full
#print axioms pair1065_full
#print axioms shard1065_full
end ActualSparse64
