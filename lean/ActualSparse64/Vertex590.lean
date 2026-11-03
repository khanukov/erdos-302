import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair590_full : SparseBoundaryFast.pairs S lookup D 590 = true := by decide

theorem shard590_full : SparseBoundaryShards.shard S D 590 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 590 source_lookup (by decide) pair590_full
#print axioms pair590_full
#print axioms shard590_full
end ActualSparse64
