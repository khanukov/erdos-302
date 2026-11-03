import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair915_full : SparseBoundaryFast.pairs S lookup D 915 = true := by decide

theorem shard915_full : SparseBoundaryShards.shard S D 915 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 915 source_lookup (by decide) pair915_full
#print axioms pair915_full
#print axioms shard915_full
end ActualSparse64
