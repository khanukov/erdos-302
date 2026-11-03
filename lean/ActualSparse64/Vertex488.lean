import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair488_full : SparseBoundaryFast.pairs S lookup D 488 = true := by decide

theorem shard488_full : SparseBoundaryShards.shard S D 488 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 488 source_lookup (by decide) pair488_full
#print axioms pair488_full
#print axioms shard488_full
end ActualSparse64
