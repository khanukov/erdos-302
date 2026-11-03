import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair177_full : SparseBoundaryFast.pairs S lookup D 177 = true := by decide

theorem shard177_full : SparseBoundaryShards.shard S D 177 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 177 source_lookup (by decide) pair177_full
#print axioms pair177_full
#print axioms shard177_full
end ActualSparse64
