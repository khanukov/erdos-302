import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_1085 : Checked [105, 114, 150, 250, 350, 375, 475, 875, 1330] [(0, 1, 8), (0, 2, 4), (1, 2, 6), (2, 3, 5), (3, 4, 7), (4, 6, 8)] 3 := by decide
#print axioms bank_node_1085
theorem bank_node_1086 : Checked [25, 26, 30, 39, 78, 130, 150, 195, 975] [(0, 2, 6), (1, 2, 7), (1, 3, 4), (2, 3, 5), (4, 5, 7), (5, 6, 8)] 3 := by decide
#print axioms bank_node_1086
end Archive
