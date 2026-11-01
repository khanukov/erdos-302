import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_715 : Checked [45, 48, 63, 72, 80, 84, 112, 120, 144] [(0, 3, 7), (1, 3, 8), (1, 4, 7), (1, 5, 6), (2, 6, 8)] 3 := by decide
#print axioms bank_node_715
theorem bank_node_716 : Checked [14, 15, 21, 34, 35, 42, 210, 255, 1190] [(0, 1, 6), (0, 2, 5), (3, 4, 8), (4, 5, 6), (6, 7, 8)] 3 := by decide
#print axioms bank_node_716
end Archive
