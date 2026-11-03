import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair568_full : SparseBoundaryFast.pairs S lookup D 568 = true := by decide

theorem shard568_full : SparseBoundaryShards.shard S D 568 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 568 source_lookup (by decide) pair568_full
#print axioms pair568_full
#print axioms shard568_full
end ActualSparse64
