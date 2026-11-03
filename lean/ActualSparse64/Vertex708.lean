import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair708_full : SparseBoundaryFast.pairs S lookup D 708 = true := by decide

theorem shard708_full : SparseBoundaryShards.shard S D 708 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 708 source_lookup (by decide) pair708_full
#print axioms pair708_full
#print axioms shard708_full
end ActualSparse64
