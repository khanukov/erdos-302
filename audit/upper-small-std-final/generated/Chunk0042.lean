import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_792 : Checked [15, 18, 24, 32, 40, 72, 90, 96, 160] [(0, 1, 6), (0, 2, 4), (1, 2, 5), (2, 3, 7), (3, 4, 8), (4, 5, 6)] 3 := by decide
#print axioms bank_node_792
theorem bank_node_795 : Checked [65, 77, 90, 126, 165, 198, 234, 315, 910] [(0, 2, 6), (1, 3, 5), (2, 3, 7), (2, 4, 5), (6, 7, 8)] 3 := by decide
#print axioms bank_node_795
end Archive
