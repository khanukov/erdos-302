import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair804_full : SparseBoundaryFast.pairs S lookup D 804 = true := by decide

theorem shard804_full : SparseBoundaryShards.shard S D 804 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 804 source_lookup (by decide) pair804_full
#print axioms pair804_full
#print axioms shard804_full
end ActualSparse64
