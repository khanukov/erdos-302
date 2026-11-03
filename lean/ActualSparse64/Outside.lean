import ActualSparse64.Data

namespace ActualSparse64
set_option maxRecDepth 100000
set_option maxHeartbeats 40000000

theorem outside_eq : SparseBoundary.outside S T = V := by decide

#print axioms outside_eq
end ActualSparse64
