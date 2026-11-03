import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair183_full : SparseBoundaryFast.pairs S lookup D 183 = true := by decide

theorem shard183_full : SparseBoundaryShards.shard S D 183 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 183 source_lookup (by decide) pair183_full
#print axioms pair183_full
#print axioms shard183_full
end ActualSparse64
