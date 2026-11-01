import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_929 : Checked [77, 90, 117, 126, 165, 198, 286, 315, 390] [(0, 3, 5), (1, 2, 8), (1, 3, 7), (1, 4, 5), (2, 5, 6), (4, 6, 8)] 3 := by decide
#print axioms bank_node_929
theorem bank_node_933 : Checked [55, 80, 130, 176, 182, 208, 455, 1144, 1456] [(0, 1, 3), (1, 2, 5), (2, 4, 6), (3, 5, 7), (4, 5, 8)] 3 := by decide
#print axioms bank_node_933
end Archive
