import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_600 : Checked [51, 60, 68, 153, 204, 340, 510, 612, 765] [(0, 1, 5), (0, 2, 4), (1, 2, 6), (3, 4, 7), (4, 5, 6), (5, 7, 8)] 3 := by decide
#print axioms bank_node_600
theorem bank_node_603 : Checked [55, 60, 69, 78, 260, 429, 460, 598, 660] [(0, 1, 8), (1, 2, 6), (1, 3, 4), (2, 3, 7), (4, 5, 8), (4, 6, 7)] 3 := by decide
#print axioms bank_node_603
end Archive
