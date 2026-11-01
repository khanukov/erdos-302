import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_955 : Checked [18, 21, 22, 33, 66, 77, 99, 126, 462] [(0, 1, 7), (0, 2, 6), (1, 2, 8), (2, 3, 4), (4, 5, 8), (6, 7, 8)] 3 := by decide
#print axioms bank_node_955
theorem bank_node_956 : Checked [3, 4, 5, 12, 18, 20, 30, 36, 45] [(0, 1, 3), (1, 2, 5), (3, 4, 7), (3, 5, 6), (4, 6, 8), (5, 7, 8)] 3 := by decide
#print axioms bank_node_956
end Archive
