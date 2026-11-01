import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_854 : Checked [5, 6, 9, 18, 21, 30, 45, 70, 126] [(0, 1, 5), (1, 2, 3), (3, 4, 8), (3, 5, 6), (4, 5, 7), (6, 7, 8)] 3 := by decide
#print axioms bank_node_854
theorem bank_node_858 : Checked [144, 208, 260, 468, 585, 819, 1040, 1092, 1260] [(0, 1, 3), (1, 2, 6), (2, 3, 4), (3, 5, 7), (4, 7, 8)] 3 := by decide
#print axioms bank_node_858
end Archive
