import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_1047 : Checked [138, 150, 200, 250, 375, 600, 920, 1000, 1725] [(0, 1, 8), (1, 2, 5), (1, 3, 4), (2, 3, 7), (4, 5, 7), (5, 6, 8)] 3 := by decide
#print axioms bank_node_1047
theorem bank_node_1049 : Checked [207, 234, 273, 315, 322, 585, 910, 1638, 1794] [(0, 1, 8), (1, 2, 7), (1, 3, 6), (2, 4, 8), (5, 6, 7)] 3 := by decide
#print axioms bank_node_1049
end Archive
