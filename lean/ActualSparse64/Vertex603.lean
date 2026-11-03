import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair603_full : SparseBoundaryFast.pairs S lookup D 603 = true := by decide

theorem shard603_full : SparseBoundaryShards.shard S D 603 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 603 source_lookup (by decide) pair603_full
#print axioms pair603_full
#print axioms shard603_full
end ActualSparse64
