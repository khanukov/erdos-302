import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair639_full : SparseBoundaryFast.pairs S lookup D 639 = true := by decide

theorem shard639_full : SparseBoundaryShards.shard S D 639 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 639 source_lookup (by decide) pair639_full
#print axioms pair639_full
#print axioms shard639_full
end ActualSparse64
