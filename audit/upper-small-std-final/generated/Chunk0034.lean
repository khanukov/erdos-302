import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_748 : Checked [12, 13, 14, 117, 156, 182, 468, 819, 1092] [(0, 1, 4), (1, 2, 5), (3, 4, 6), (4, 5, 8), (6, 7, 8)] 3 := by decide
#print axioms bank_node_748
theorem bank_node_751 : Checked [33, 44, 55, 99, 132, 180, 220, 330, 396] [(0, 1, 4), (1, 2, 6), (3, 4, 8), (3, 5, 6), (4, 6, 7), (5, 7, 8)] 3 := by decide
#print axioms bank_node_751
end Archive
