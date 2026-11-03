import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair1416_full : SparseBoundaryFast.pairs S lookup D 1416 = true := by decide

theorem shard1416_full : SparseBoundaryShards.shard S D 1416 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 1416 source_lookup (by decide) pair1416_full
#print axioms pair1416_full
#print axioms shard1416_full
end ActualSparse64
