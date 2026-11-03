import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair852_full : SparseBoundaryFast.pairs S lookup D 852 = true := by decide

theorem shard852_full : SparseBoundaryShards.shard S D 852 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 852 source_lookup (by decide) pair852_full
#print axioms pair852_full
#print axioms shard852_full
end ActualSparse64
