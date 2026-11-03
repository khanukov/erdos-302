import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair1239_full : SparseBoundaryFast.pairs S lookup D 1239 = true := by decide

theorem shard1239_full : SparseBoundaryShards.shard S D 1239 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 1239 source_lookup (by decide) pair1239_full
#print axioms pair1239_full
#print axioms shard1239_full
end ActualSparse64
