import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair1876_full : SparseBoundaryFast.pairs S lookup D 1876 = true := by decide

theorem shard1876_full : SparseBoundaryShards.shard S D 1876 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 1876 source_lookup (by decide) pair1876_full
#print axioms pair1876_full
#print axioms shard1876_full
end ActualSparse64
