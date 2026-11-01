import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_1000 : Checked [209, 270, 330, 345, 513, 570, 874, 1242, 1485] [(0, 2, 5), (1, 2, 8), (1, 3, 7), (1, 4, 5), (3, 5, 6), (4, 6, 7)] 3 := by decide
#print axioms bank_node_1000
theorem bank_node_1001 : Checked [14, 15, 18, 27, 54, 63, 90, 135, 210] [(0, 1, 8), (0, 2, 5), (1, 2, 6), (2, 3, 4), (4, 6, 7), (5, 6, 8)] 3 := by decide
#print axioms bank_node_1001
end Archive
