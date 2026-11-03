import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair1593_full : SparseBoundaryFast.pairs S lookup D 1593 = true := by decide

theorem shard1593_full : SparseBoundaryShards.shard S D 1593 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 1593 source_lookup (by decide) pair1593_full
#print axioms pair1593_full
#print axioms shard1593_full
end ActualSparse64
