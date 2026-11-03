import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair536_full : SparseBoundaryFast.pairs S lookup D 536 = true := by decide

theorem shard536_full : SparseBoundaryShards.shard S D 536 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 536 source_lookup (by decide) pair536_full
#print axioms pair536_full
#print axioms shard536_full
end ActualSparse64
