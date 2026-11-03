import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair426_full : SparseBoundaryFast.pairs S lookup D 426 = true := by decide

theorem shard426_full : SparseBoundaryShards.shard S D 426 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 426 source_lookup (by decide) pair426_full
#print axioms pair426_full
#print axioms shard426_full
end ActualSparse64
