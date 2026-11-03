import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair354_full : SparseBoundaryFast.pairs S lookup D 354 = true := by decide

theorem shard354_full : SparseBoundaryShards.shard S D 354 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 354 source_lookup (by decide) pair354_full
#print axioms pair354_full
#print axioms shard354_full
end ActualSparse64
