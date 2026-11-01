import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_1071 : Checked [77, 117, 126, 198, 242, 286, 1089, 1573, 1638] [(0, 2, 3), (1, 2, 8), (1, 3, 5), (3, 4, 6), (4, 5, 7)] 3 := by decide
#print axioms bank_node_1071
theorem bank_node_1072 : Checked [45, 56, 72, 105, 108, 120, 189, 216, 252] [(0, 2, 5), (1, 2, 8), (1, 3, 5), (2, 4, 7), (4, 6, 8)] 3 := by decide
#print axioms bank_node_1072
end Archive
