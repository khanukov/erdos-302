import ActualSparse64.Outside
import ActualSparse64.Subsets
import ActualSparse64.Coverage

namespace ActualSparse64
set_option maxRecDepth 100000
set_option maxHeartbeats 40000000

theorem checked : SparseBoundary.check S T D = true := by
  apply SparseBoundaryShards.assemble S T D V target_subset delete_subset
  · intro x hx; rw [outside_eq] at hx; exact hx
  · exact all_shards

end ActualSparse64
