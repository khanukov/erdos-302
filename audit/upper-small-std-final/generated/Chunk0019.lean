import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_618 : Checked [14, 18, 21, 42, 45, 63, 70, 105, 126] [(0, 1, 5), (0, 2, 3), (1, 2, 8), (3, 5, 8), (3, 6, 7), (4, 6, 8)] 3 := by decide
#print axioms bank_node_618
theorem bank_node_632 : Checked [84, 93, 124, 155, 372, 620, 651, 868, 930] [(0, 1, 7), (1, 2, 4), (2, 3, 5), (4, 5, 8), (4, 6, 7)] 3 := by decide
#print axioms bank_node_632
end Archive
