import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_1058 : Checked [105, 154, 182, 231, 330, 462, 858, 1001, 1155] [(0, 1, 4), (1, 2, 7), (1, 3, 5), (2, 3, 6), (4, 5, 8), (5, 6, 7)] 3 := by decide
#print axioms bank_node_1058
theorem bank_node_1063 : Checked [153, 180, 204, 255, 300, 425, 1020, 1530, 1700] [(0, 1, 6), (1, 2, 7), (2, 3, 6), (3, 4, 8), (4, 5, 6)] 3 := by decide
#print axioms bank_node_1063
end Archive
