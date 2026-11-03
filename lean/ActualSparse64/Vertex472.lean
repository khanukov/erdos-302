import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair472_full : SparseBoundaryFast.pairs S lookup D 472 = true := by decide

theorem shard472_full : SparseBoundaryShards.shard S D 472 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 472 source_lookup (by decide) pair472_full
#print axioms pair472_full
#print axioms shard472_full
end ActualSparse64
