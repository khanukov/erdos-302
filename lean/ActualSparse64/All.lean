import ActualSparse64.Checked
import ActualSparse64.SourceEq
import ActualSparse64.TargetEq
import ActualSparse64.DeleteEq
import SparseBoundaryMathlib

namespace ActualSparse64
set_option maxRecDepth 100000
set_option maxHeartbeats 40000000

theorem boundary : ExtensionSeedCandidate.Boundary ExtensionFirstArchive.source
    ExtensionFirstArchive.target ExtensionFirstArchive.firstDelete := by
  have h := (SparseBoundary.check_iff S T D).mp checked
  have h' : SparseBoundary.Boundary S.toFinset.toList T.toFinset.toList D.toFinset.toList := by
    simpa only [SparseBoundary.Boundary, Finset.mem_toList, List.mem_toFinset] using h
  have h'' := (SparseBoundaryMathlib.list_boundary_iff S.toFinset T.toFinset D.toFinset).mp h'
  simpa only [source_eq, target_eq, delete_eq] using h''

#print axioms boundary
end ActualSparse64
