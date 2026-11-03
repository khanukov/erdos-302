import ActualSparse64.Data
import ExtensionBoundaryData

namespace ActualSparse64
set_option maxRecDepth 100000
set_option maxHeartbeats 40000000

theorem source_eq : S.toFinset = ExtensionFirstArchive.source := by decide
#print axioms source_eq
end ActualSparse64
