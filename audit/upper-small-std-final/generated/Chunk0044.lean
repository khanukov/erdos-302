import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_799 : Checked [270, 351, 455, 468, 780, 819, 1092, 1170, 1404] [(0, 1, 7), (1, 3, 8), (2, 4, 6), (3, 4, 7), (3, 5, 6)] 3 := by decide
#print axioms bank_node_799
theorem bank_node_804 : Checked [65, 90, 126, 147, 234, 315, 490, 882, 910] [(0, 1, 4), (1, 2, 5), (2, 3, 7), (4, 5, 8), (5, 6, 7)] 3 := by decide
#print axioms bank_node_804
end Archive
