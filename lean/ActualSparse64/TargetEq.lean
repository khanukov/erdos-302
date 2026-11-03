import ActualSparse64.Data
import ExtensionBoundaryData

namespace ActualSparse64
set_option maxRecDepth 100000
set_option maxHeartbeats 40000000

theorem target_eq : T.toFinset = ExtensionFirstArchive.target := by decide
#print axioms target_eq
end ActualSparse64
