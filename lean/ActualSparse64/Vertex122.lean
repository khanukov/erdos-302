import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair122_full : SparseBoundaryFast.pairs S lookup D 122 = true := by decide

theorem shard122_full : SparseBoundaryShards.shard S D 122 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 122 source_lookup (by decide) pair122_full
#print axioms pair122_full
#print axioms shard122_full
end ActualSparse64
