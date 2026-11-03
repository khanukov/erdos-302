import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair118_full : SparseBoundaryFast.pairs S lookup D 118 = true := by decide

theorem shard118_full : SparseBoundaryShards.shard S D 118 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 118 source_lookup (by decide) pair118_full
#print axioms pair118_full
#print axioms shard118_full
end ActualSparse64
