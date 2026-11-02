import ArchiveNextSmall

/-! The translator validates structure, not truth: the exaggerated demand 2
    must be rejected by the finite Lean checker. -/
namespace ArchiveNextSmallTest

theorem overstated_rejected :
    ¬ ArchiveDag.SmallCheck (ArchiveNextSmall.nodes 6).support 2 := by
  unfold ArchiveDag.SmallCheck UpperBridge.OrderedEdge ArchiveNextSmall.nodes
  decide

#print axioms overstated_rejected
end ArchiveNextSmallTest
