import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair244_full : SparseBoundaryFast.pairs S lookup D 244 = true := by decide

theorem shard244_full : SparseBoundaryShards.shard S D 244 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 244 source_lookup (by decide) pair244_full
#print axioms pair244_full
#print axioms shard244_full
end ActualSparse64
