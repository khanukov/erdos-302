import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair366_full : SparseBoundaryFast.pairs S lookup D 366 = true := by decide

theorem shard366_full : SparseBoundaryShards.shard S D 366 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 366 source_lookup (by decide) pair366_full
#print axioms pair366_full
#print axioms shard366_full
end ActualSparse64
