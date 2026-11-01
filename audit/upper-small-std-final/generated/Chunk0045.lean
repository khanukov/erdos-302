import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_805 : Checked [51, 60, 64, 68, 85, 204, 510, 960, 1088] [(0, 3, 5), (1, 2, 7), (1, 3, 6), (1, 4, 5), (2, 3, 8), (6, 7, 8)] 3 := by decide
#print axioms bank_node_805
theorem bank_node_811 : Checked [45, 60, 105, 108, 140, 180, 189, 252, 270] [(0, 1, 5), (1, 2, 4), (2, 5, 7), (3, 5, 8), (3, 6, 7)] 3 := by decide
#print axioms bank_node_811
end Archive
