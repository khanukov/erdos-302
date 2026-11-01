import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_917 : Checked [165, 171, 190, 198, 297, 594, 990, 1254, 1485] [(0, 2, 7), (0, 3, 6), (1, 3, 7), (3, 4, 5), (5, 6, 8)] 3 := by decide
#print axioms bank_node_917
theorem bank_node_918 : Checked [57, 76, 84, 92, 133, 228, 437, 798, 966] [(0, 1, 5), (1, 2, 7), (1, 3, 6), (2, 3, 8), (2, 4, 5), (6, 7, 8)] 3 := by decide
#print axioms bank_node_918
end Archive
