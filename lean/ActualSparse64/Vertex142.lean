import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair142_full : SparseBoundaryFast.pairs S lookup D 142 = true := by decide

theorem shard142_full : SparseBoundaryShards.shard S D 142 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 142 source_lookup (by decide) pair142_full
#print axioms pair142_full
#print axioms shard142_full
end ActualSparse64
