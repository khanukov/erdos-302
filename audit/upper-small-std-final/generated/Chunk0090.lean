import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_1029 : Checked [99, 126, 154, 182, 231, 462, 693, 858, 1001] [(0, 1, 5), (1, 2, 6), (2, 3, 8), (2, 4, 5), (3, 4, 7), (5, 7, 8)] 3 := by decide
#print axioms bank_node_1029
theorem bank_node_1033 : Checked [9, 10, 11, 90, 99, 110, 330, 495, 990] [(0, 1, 3), (1, 2, 5), (3, 4, 8), (3, 5, 7), (4, 5, 8), (6, 7, 8)] 3 := by decide
#print axioms bank_node_1033
end Archive
