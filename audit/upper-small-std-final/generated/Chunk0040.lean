import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_782 : Checked [77, 90, 126, 165, 198, 234, 273, 315, 910] [(0, 2, 4), (1, 2, 7), (1, 3, 4), (2, 5, 6), (5, 7, 8)] 3 := by decide
#print axioms bank_node_782
theorem bank_node_785 : Checked [54, 63, 90, 117, 135, 210, 378, 390, 455] [(0, 1, 6), (0, 2, 4), (1, 2, 5), (2, 3, 7), (4, 5, 6), (5, 7, 8)] 3 := by decide
#print axioms bank_node_785
end Archive
