import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair355_full : SparseBoundaryFast.pairs S lookup D 355 = true := by decide

theorem shard355_full : SparseBoundaryShards.shard S D 355 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 355 source_lookup (by decide) pair355_full
#print axioms pair355_full
#print axioms shard355_full
end ActualSparse64
