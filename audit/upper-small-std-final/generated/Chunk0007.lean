import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_563 : Checked [231, 270, 352, 378, 495, 594, 672, 864, 945] [(0, 2, 6), (0, 3, 5), (1, 3, 8), (1, 4, 5), (2, 5, 7), (3, 6, 7)] 3 := by decide
#print axioms bank_node_563
theorem bank_node_564 : Checked [30, 32, 34, 51, 102, 170, 255, 480, 544] [(0, 1, 7), (0, 2, 6), (1, 2, 8), (2, 3, 4), (4, 5, 6), (6, 7, 8)] 3 := by decide
#print axioms bank_node_564
end Archive
