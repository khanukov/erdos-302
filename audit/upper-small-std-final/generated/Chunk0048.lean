import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_820 : Checked [7, 8, 9, 40, 56, 72, 140, 252, 315] [(0, 1, 4), (1, 2, 5), (3, 4, 6), (4, 5, 7), (6, 7, 8)] 3 := by decide
#print axioms bank_node_820
theorem bank_node_824 : Checked [225, 270, 378, 525, 621, 945, 966, 1150, 1350] [(0, 1, 8), (1, 2, 5), (2, 3, 8), (2, 4, 6), (3, 6, 7), (4, 7, 8)] 3 := by decide
#print axioms bank_node_824
end Archive
