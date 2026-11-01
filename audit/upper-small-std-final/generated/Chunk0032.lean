import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_743 : Checked [42, 45, 63, 105, 114, 126, 630, 1197, 1330] [(0, 1, 6), (0, 2, 5), (3, 4, 8), (3, 5, 6), (4, 5, 7), (6, 7, 8)] 3 := by decide
#print axioms bank_node_743
theorem bank_node_744 : Checked [90, 99, 105, 114, 385, 630, 990, 1197, 1330] [(0, 1, 6), (0, 2, 5), (2, 3, 8), (4, 5, 6), (5, 7, 8)] 3 := by decide
#print axioms bank_node_744
end Archive
