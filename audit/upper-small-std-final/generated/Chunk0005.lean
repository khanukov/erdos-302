import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_557 : Checked [35, 40, 44, 280, 286, 440, 455, 728, 770] [(0, 1, 3), (1, 2, 5), (3, 5, 8), (3, 6, 7), (4, 6, 8)] 3 := by decide
#print axioms bank_node_557
theorem bank_node_558 : Checked [9, 12, 20, 21, 28, 30, 36, 45, 70] [(0, 1, 6), (1, 2, 5), (1, 3, 4), (2, 4, 8), (2, 6, 7), (3, 5, 8)] 3 := by decide
#print axioms bank_node_558
end Archive
