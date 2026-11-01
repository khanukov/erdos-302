import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_544 : Checked [85, 102, 119, 126, 153, 306, 510, 714, 765] [(0, 1, 6), (1, 2, 7), (1, 4, 5), (3, 4, 7), (5, 6, 8)] 3 := by decide
#print axioms bank_node_544
theorem bank_node_545 : Checked [14, 15, 18, 63, 90, 110, 210, 231, 495] [(0, 1, 6), (0, 2, 3), (1, 2, 4), (3, 4, 6), (4, 5, 8), (5, 6, 7)] 3 := by decide
#print axioms bank_node_545
end Archive
