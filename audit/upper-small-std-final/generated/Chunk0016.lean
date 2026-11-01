import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_611 : Checked [33, 44, 60, 110, 132, 154, 165, 385, 924] [(0, 1, 4), (1, 2, 6), (2, 3, 4), (3, 5, 7), (4, 5, 8)] 3 := by decide
#print axioms bank_node_611
theorem bank_node_613 : Checked [11, 12, 13, 108, 132, 156, 351, 594, 858] [(0, 1, 4), (1, 2, 5), (3, 4, 7), (3, 5, 6), (4, 5, 8), (6, 7, 8)] 3 := by decide
#print axioms bank_node_613
end Archive
