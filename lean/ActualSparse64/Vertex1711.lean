import ActualSparse64.FastSample

namespace ActualSparse64
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000

theorem pair1711_full : SparseBoundaryFast.pairs S lookup D 1711 = true := by decide

theorem shard1711_full : SparseBoundaryShards.shard S D 1711 = true :=
  SparseBoundaryFast.pairs_to_shard S D lookup 1711 source_lookup (by decide) pair1711_full
#print axioms pair1711_full
#print axioms shard1711_full
end ActualSparse64
