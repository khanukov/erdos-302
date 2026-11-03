import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair1829_full : SparseBoundaryFast.pairs S lookup D 1829 = true := by decide

theorem shard1829_full : SparseBoundaryShards.shard S D 1829 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 1829 source_lookup (by decide) pair1829_full
#print axioms pair1829_full
#print axioms shard1829_full
end ActualSparse64
