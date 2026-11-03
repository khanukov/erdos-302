import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair284_full : SparseBoundaryFast.pairs S lookup D 284 = true := by decide

theorem shard284_full : SparseBoundaryShards.shard S D 284 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 284 source_lookup (by decide) pair284_full
#print axioms pair284_full
#print axioms shard284_full
end ActualSparse64
