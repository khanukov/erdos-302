import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_671 : Checked [34, 36, 45, 180, 255, 340, 612, 765, 1020] [(0, 1, 6), (1, 2, 3), (3, 4, 6), (4, 5, 8), (5, 6, 7)] 3 := by decide
#print axioms bank_node_671
theorem bank_node_673 : Checked [14, 18, 21, 33, 42, 63, 126, 154, 693] [(0, 1, 5), (0, 2, 4), (1, 2, 6), (3, 4, 7), (4, 5, 6), (6, 7, 8)] 3 := by decide
#print axioms bank_node_673
end Archive
