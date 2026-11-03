import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair885_full : SparseBoundaryFast.pairs S lookup D 885 = true := by decide

theorem shard885_full : SparseBoundaryShards.shard S D 885 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 885 source_lookup (by decide) pair885_full
#print axioms pair885_full
#print axioms shard885_full
end ActualSparse64
