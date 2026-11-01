import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_915 : Checked [45, 72, 99, 120, 192, 220, 264, 320, 704] [(0, 1, 3), (1, 2, 6), (3, 4, 7), (3, 5, 6), (4, 6, 8), (5, 7, 8)] 3 := by decide
#print axioms bank_node_915
theorem bank_node_916 : Checked [39, 48, 66, 99, 176, 198, 208, 1144, 1584] [(0, 1, 6), (1, 2, 4), (2, 3, 5), (4, 5, 8), (4, 6, 7)] 3 := by decide
#print axioms bank_node_916
end Archive
