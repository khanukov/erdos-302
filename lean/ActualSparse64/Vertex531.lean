import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair531_full : SparseBoundaryFast.pairs S lookup D 531 = true := by decide

theorem shard531_full : SparseBoundaryShards.shard S D 531 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 531 source_lookup (by decide) pair531_full
#print axioms pair531_full
#print axioms shard531_full
end ActualSparse64
