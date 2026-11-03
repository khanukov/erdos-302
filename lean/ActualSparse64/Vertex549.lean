import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair549_full : SparseBoundaryFast.pairs S lookup D 549 = true := by decide

theorem shard549_full : SparseBoundaryShards.shard S D 549 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 549 source_lookup (by decide) pair549_full
#print axioms pair549_full
#print axioms shard549_full
end ActualSparse64
