import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair1220_full : SparseBoundaryFast.pairs S lookup D 1220 = true := by decide

theorem shard1220_full : SparseBoundaryShards.shard S D 1220 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 1220 source_lookup (by decide) pair1220_full
#print axioms pair1220_full
#print axioms shard1220_full
end ActualSparse64
