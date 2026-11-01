import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_725 : Checked [15, 18, 21, 65, 90, 126, 234, 315, 910] [(0, 1, 4), (1, 2, 5), (3, 4, 6), (4, 5, 7), (6, 7, 8)] 3 := by decide
#print axioms bank_node_725
theorem bank_node_727 : Checked [42, 51, 54, 81, 162, 189, 238, 918, 1134] [(0, 1, 6), (0, 2, 5), (1, 2, 7), (2, 3, 4), (4, 5, 8), (5, 6, 7)] 3 := by decide
#print axioms bank_node_727
end Archive
