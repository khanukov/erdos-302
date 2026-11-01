import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_604 : Checked [105, 120, 176, 220, 264, 385, 528, 840, 880] [(0, 1, 7), (1, 3, 4), (2, 3, 8), (2, 4, 6), (4, 5, 7)] 3 := by decide
#print axioms bank_node_604
theorem bank_node_605 : Checked [35, 42, 45, 147, 210, 315, 490, 630, 882] [(0, 1, 4), (1, 2, 7), (3, 4, 6), (4, 5, 7), (5, 6, 8)] 3 := by decide
#print axioms bank_node_605
end Archive
