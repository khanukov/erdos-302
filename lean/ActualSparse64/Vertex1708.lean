import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair1708_full : SparseBoundaryFast.pairs S lookup D 1708 = true := by decide

theorem shard1708_full : SparseBoundaryShards.shard S D 1708 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 1708 source_lookup (by decide) pair1708_full
#print axioms pair1708_full
#print axioms shard1708_full
end ActualSparse64
