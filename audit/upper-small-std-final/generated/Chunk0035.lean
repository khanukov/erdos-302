import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_753 : Checked [15, 18, 21, 90, 126, 234, 273, 315, 910] [(0, 1, 3), (1, 2, 4), (3, 4, 7), (4, 5, 6), (5, 7, 8)] 3 := by decide
#print axioms bank_node_753
theorem bank_node_754 : Checked [55, 80, 88, 176, 220, 396, 495, 720, 880] [(0, 1, 3), (1, 2, 8), (3, 4, 8), (4, 5, 6), (5, 7, 8)] 3 := by decide
#print axioms bank_node_754
end Archive
