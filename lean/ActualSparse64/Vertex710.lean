import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair710_full : SparseBoundaryFast.pairs S lookup D 710 = true := by decide

theorem shard710_full : SparseBoundaryShards.shard S D 710 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 710 source_lookup (by decide) pair710_full
#print axioms pair710_full
#print axioms shard710_full
end ActualSparse64
