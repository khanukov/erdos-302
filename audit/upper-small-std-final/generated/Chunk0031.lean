import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_735 : Checked [10, 14, 21, 35, 42, 49, 210, 294, 735] [(0, 1, 3), (1, 2, 4), (3, 4, 6), (4, 5, 7), (6, 7, 8)] 3 := by decide
#print axioms bank_node_735
theorem bank_node_736 : Checked [270, 342, 345, 513, 570, 855, 874, 1026, 1242] [(0, 2, 8), (0, 3, 4), (1, 3, 7), (1, 4, 5), (2, 4, 6), (3, 6, 8)] 3 := by decide
#print axioms bank_node_736
end Archive
