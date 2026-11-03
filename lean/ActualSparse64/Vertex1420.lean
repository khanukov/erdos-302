import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair1420_full : SparseBoundaryFast.pairs S lookup D 1420 = true := by decide

theorem shard1420_full : SparseBoundaryShards.shard S D 1420 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 1420 source_lookup (by decide) pair1420_full
#print axioms pair1420_full
#print axioms shard1420_full
end ActualSparse64
