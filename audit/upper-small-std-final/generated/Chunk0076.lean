import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_962 : Checked [14, 21, 30, 42, 55, 66, 70, 105, 1155] [(0, 1, 3), (1, 2, 6), (2, 3, 7), (2, 4, 5), (3, 6, 7), (5, 6, 8)] 3 := by decide
#print axioms bank_node_962
theorem bank_node_963 : Checked [48, 60, 64, 85, 192, 204, 240, 960, 1360] [(0, 1, 6), (0, 2, 4), (1, 2, 7), (1, 3, 5), (4, 6, 7), (5, 6, 8)] 3 := by decide
#print axioms bank_node_963
end Archive
