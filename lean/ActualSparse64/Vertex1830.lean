import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair1830_full : SparseBoundaryFast.pairs S lookup D 1830 = true := by decide

theorem shard1830_full : SparseBoundaryShards.shard S D 1830 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 1830 source_lookup (by decide) pair1830_full
#print axioms pair1830_full
#print axioms shard1830_full
end ActualSparse64
