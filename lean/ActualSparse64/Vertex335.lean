import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair335_full : SparseBoundaryFast.pairs S lookup D 335 = true := by decide

theorem shard335_full : SparseBoundaryShards.shard S D 335 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 335 source_lookup (by decide) pair335_full
#print axioms pair335_full
#print axioms shard335_full
end ActualSparse64
