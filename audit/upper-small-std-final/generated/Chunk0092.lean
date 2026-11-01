import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_1037 : Checked [9, 10, 11, 85, 90, 110, 374, 495, 1530] [(0, 1, 4), (1, 2, 5), (3, 4, 8), (3, 5, 6), (4, 5, 7), (6, 7, 8)] 3 := by decide
#print axioms bank_node_1037
theorem bank_node_1038 : Checked [99, 110, 135, 594, 810, 891, 990, 1485, 1782] [(0, 1, 6), (1, 2, 3), (3, 5, 8), (3, 6, 7), (4, 7, 8)] 3 := by decide
#print axioms bank_node_1038
end Archive
