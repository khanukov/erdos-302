import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_1074 : Checked [18, 21, 30, 45, 50, 70, 75, 126, 175] [(0, 1, 7), (0, 2, 3), (1, 2, 5), (2, 4, 6), (3, 5, 7), (4, 5, 8)] 3 := by decide
#print axioms bank_node_1074
theorem bank_node_1075 : Checked [322, 420, 660, 736, 1056, 1155, 1265, 1380, 1760] [(0, 1, 7), (1, 2, 5), (2, 4, 8), (2, 6, 7), (3, 6, 8)] 3 := by decide
#print axioms bank_node_1075
end Archive
