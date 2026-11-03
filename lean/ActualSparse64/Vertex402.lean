import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair402_full : SparseBoundaryFast.pairs S lookup D 402 = true := by decide

theorem shard402_full : SparseBoundaryShards.shard S D 402 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 402 source_lookup (by decide) pair402_full
#print axioms pair402_full
#print axioms shard402_full
end ActualSparse64
