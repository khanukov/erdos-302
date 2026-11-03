import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair134_full : SparseBoundaryFast.pairs S lookup D 134 = true := by decide

theorem shard134_full : SparseBoundaryShards.shard S D 134 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 134 source_lookup (by decide) pair134_full
#print axioms pair134_full
#print axioms shard134_full
end ActualSparse64
