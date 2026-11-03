import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair610_full : SparseBoundaryFast.pairs S lookup D 610 = true := by decide

theorem shard610_full : SparseBoundaryShards.shard S D 610 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 610 source_lookup (by decide) pair610_full
#print axioms pair610_full
#print axioms shard610_full
end ActualSparse64
