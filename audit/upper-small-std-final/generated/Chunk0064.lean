import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_909 : Checked [180, 204, 255, 595, 612, 1020, 1071, 1428, 1530] [(0, 1, 8), (0, 2, 4), (1, 2, 5), (3, 5, 7), (4, 5, 8), (4, 6, 7)] 3 := by decide
#print axioms bank_node_909
theorem bank_node_910 : Checked [90, 99, 105, 385, 506, 630, 990, 1035, 1610] [(0, 1, 6), (0, 2, 5), (3, 4, 8), (3, 5, 6), (4, 6, 7), (5, 7, 8)] 3 := by decide
#print axioms bank_node_910
end Archive
