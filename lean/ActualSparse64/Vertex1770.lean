import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair1770_full : SparseBoundaryFast.pairs S lookup D 1770 = true := by decide

theorem shard1770_full : SparseBoundaryShards.shard S D 1770 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 1770 source_lookup (by decide) pair1770_full
#print axioms pair1770_full
#print axioms shard1770_full
end ActualSparse64
