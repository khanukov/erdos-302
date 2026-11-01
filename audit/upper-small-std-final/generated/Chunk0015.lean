import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_609 : Checked [420, 425, 442, 700, 714, 780, 910, 1020, 1050] [(0, 3, 8), (0, 4, 7), (0, 5, 6), (1, 4, 8), (2, 5, 7)] 3 := by decide
#print axioms bank_node_609
theorem bank_node_610 : Checked [9, 12, 20, 25, 30, 36, 45, 100, 150] [(0, 1, 5), (1, 2, 4), (2, 3, 7), (2, 5, 6), (3, 4, 8)] 3 := by decide
#print axioms bank_node_610
end Archive
