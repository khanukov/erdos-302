import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_950 : Checked [77, 84, 132, 140, 154, 165, 231, 924, 1540] [(0, 1, 7), (1, 2, 6), (2, 4, 7), (3, 4, 8), (3, 5, 7)] 3 := by decide
#print axioms bank_node_950
theorem bank_node_951 : Checked [18, 21, 30, 45, 55, 66, 70, 126, 1155] [(0, 1, 7), (0, 2, 3), (1, 2, 6), (2, 4, 5), (3, 6, 7), (5, 6, 8)] 3 := by decide
#print axioms bank_node_951
end Archive
