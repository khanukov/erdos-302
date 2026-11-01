import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_607 : Checked [27, 28, 29, 30, 420, 756, 812, 870, 945] [(0, 1, 5), (1, 2, 6), (1, 3, 4), (2, 3, 7), (4, 5, 8), (4, 6, 7)] 3 := by decide
#print axioms bank_node_607
theorem bank_node_608 : Checked [30, 31, 32, 33, 480, 880, 930, 992, 1056] [(0, 1, 6), (0, 2, 4), (1, 2, 7), (2, 3, 8), (4, 5, 8), (4, 6, 7)] 3 := by decide
#print axioms bank_node_608
end Archive
