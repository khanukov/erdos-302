import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_1076 : Checked [15, 20, 36, 45, 60, 85, 180, 204, 1530] [(0, 1, 4), (1, 2, 3), (2, 3, 6), (3, 4, 6), (4, 5, 7), (6, 7, 8)] 3 := by decide
#print axioms bank_node_1076
theorem bank_node_1077 : Checked [360, 665, 684, 760, 1140, 1197, 1368, 1596, 1710] [(0, 2, 3), (1, 4, 7), (2, 4, 8), (2, 5, 7), (3, 6, 8)] 3 := by decide
#print axioms bank_node_1077
end Archive
