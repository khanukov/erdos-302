import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair236_full : SparseBoundaryFast.pairs S lookup D 236 = true := by decide

theorem shard236_full : SparseBoundaryShards.shard S D 236 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 236 source_lookup (by decide) pair236_full
#print axioms pair236_full
#print axioms shard236_full
end ActualSparse64
