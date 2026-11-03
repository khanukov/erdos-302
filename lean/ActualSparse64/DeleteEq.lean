import ActualSparse64.Data
import ExtensionBoundaryData

namespace ActualSparse64
set_option maxRecDepth 100000
set_option maxHeartbeats 40000000

theorem delete_eq : D.toFinset = ExtensionFirstArchive.firstDelete := by decide

#print axioms delete_eq
end ActualSparse64
