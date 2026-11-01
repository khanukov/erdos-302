import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_527 : Checked [165, 210, 286, 390, 429, 455, 715, 770, 858] [(0, 1, 7), (0, 2, 3), (1, 3, 5), (2, 4, 8), (2, 5, 7), (3, 6, 8)] 3 := by decide
#print axioms bank_node_527
theorem bank_node_539 : Checked [15, 18, 27, 54, 90, 110, 135, 495, 594] [(0, 1, 4), (1, 2, 3), (3, 4, 6), (4, 5, 7), (5, 6, 8)] 3 := by decide
#print axioms bank_node_539
end Archive
