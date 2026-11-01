import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_668 : Checked [66, 110, 165, 210, 231, 294, 735, 770, 1078] [(0, 1, 2), (1, 3, 4), (2, 3, 7), (3, 5, 6), (4, 5, 8)] 3 := by decide
#print axioms bank_node_668
theorem bank_node_669 : Checked [44, 55, 80, 176, 220, 396, 495, 720, 880] [(0, 1, 4), (1, 2, 3), (3, 4, 8), (4, 5, 6), (5, 7, 8)] 3 := by decide
#print axioms bank_node_669
end Archive
