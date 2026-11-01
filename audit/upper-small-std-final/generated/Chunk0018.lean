import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_616 : Checked [180, 261, 348, 420, 580, 609, 812, 870, 1044] [(0, 1, 4), (1, 2, 8), (2, 4, 7), (2, 5, 6), (3, 6, 7)] 3 := by decide
#print axioms bank_node_616
theorem bank_node_617 : Checked [153, 180, 195, 234, 260, 442, 585, 780, 1020] [(0, 1, 8), (0, 3, 5), (1, 3, 7), (1, 4, 6), (2, 4, 7), (5, 7, 8)] 3 := by decide
#print axioms bank_node_617
end Archive
