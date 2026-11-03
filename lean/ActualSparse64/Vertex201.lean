import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair201_full : SparseBoundaryFast.pairs S lookup D 201 = true := by decide

theorem shard201_full : SparseBoundaryShards.shard S D 201 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 201 source_lookup (by decide) pair201_full
#print axioms pair201_full
#print axioms shard201_full
end ActualSparse64
