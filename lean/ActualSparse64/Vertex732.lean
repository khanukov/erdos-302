import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair732_full : SparseBoundaryFast.pairs S lookup D 732 = true := by decide

theorem shard732_full : SparseBoundaryShards.shard S D 732 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 732 source_lookup (by decide) pair732_full
#print axioms pair732_full
#print axioms shard732_full
end ActualSparse64
