import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_825 : Checked [48, 63, 72, 80, 84, 112, 120, 144, 180] [(0, 2, 7), (0, 3, 6), (0, 4, 5), (1, 5, 7), (2, 6, 8), (3, 7, 8)] 3 := by decide
#print axioms bank_node_825
theorem bank_node_827 : Checked [140, 175, 300, 420, 425, 525, 700, 714, 1020] [(0, 1, 6), (1, 2, 3), (2, 4, 8), (2, 5, 6), (3, 7, 8)] 3 := by decide
#print axioms bank_node_827
end Archive
