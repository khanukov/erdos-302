import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_1055 : Checked [45, 60, 65, 180, 207, 234, 780, 1380, 1794] [(0, 1, 3), (1, 2, 6), (3, 4, 7), (3, 5, 6), (4, 5, 8), (6, 7, 8)] 3 := by decide
#print axioms bank_node_1055
theorem bank_node_1057 : Checked [45, 70, 98, 105, 126, 210, 245, 441, 1470] [(0, 1, 4), (1, 2, 6), (1, 3, 5), (2, 3, 8), (2, 4, 7), (5, 6, 8)] 3 := by decide
#print axioms bank_node_1057
end Archive
