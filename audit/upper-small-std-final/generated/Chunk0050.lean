import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_828 : Checked [108, 117, 156, 182, 351, 468, 819, 1092, 1404] [(0, 1, 8), (0, 2, 4), (1, 2, 5), (2, 3, 7), (4, 5, 8), (5, 6, 7)] 3 := by decide
#print axioms bank_node_828
theorem bank_node_830 : Checked [44, 55, 60, 121, 132, 165, 660, 1210, 1452] [(0, 2, 5), (1, 2, 6), (3, 4, 8), (4, 5, 6), (6, 7, 8)] 3 := by decide
#print axioms bank_node_830
end Archive
