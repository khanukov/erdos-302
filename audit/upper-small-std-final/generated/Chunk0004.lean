import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_554 : Checked [8, 12, 15, 24, 40, 44, 60, 165, 440] [(0, 1, 3), (1, 2, 6), (2, 3, 4), (3, 4, 6), (4, 5, 8), (5, 6, 7)] 3 := by decide
#print axioms bank_node_554
theorem bank_node_556 : Checked [45, 50, 55, 66, 75, 150, 225, 450, 550] [(0, 1, 7), (1, 2, 8), (1, 4, 5), (3, 4, 8), (5, 6, 7)] 3 := by decide
#print axioms bank_node_556
end Archive
