import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_565 : Checked [14, 18, 27, 45, 54, 63, 270, 378, 945] [(0, 1, 5), (1, 2, 4), (3, 4, 6), (4, 5, 7), (6, 7, 8)] 3 := by decide
#print axioms bank_node_565
theorem bank_node_571 : Checked [3, 4, 5, 12, 20, 25, 30, 100, 150] [(0, 1, 3), (1, 2, 4), (3, 4, 6), (4, 5, 7), (5, 6, 8)] 3 := by decide
#print axioms bank_node_571
end Archive
