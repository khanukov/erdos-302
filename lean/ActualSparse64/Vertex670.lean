import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair670_full : SparseBoundaryFast.pairs S lookup D 670 = true := by decide

theorem shard670_full : SparseBoundaryShards.shard S D 670 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 670 source_lookup (by decide) pair670_full
#print axioms pair670_full
#print axioms shard670_full
end ActualSparse64
