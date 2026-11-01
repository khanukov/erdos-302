import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_994 : Checked [51, 60, 105, 140, 180, 238, 252, 315, 340] [(0, 1, 8), (1, 2, 3), (2, 4, 6), (3, 5, 8), (3, 6, 7)] 3 := by decide
#print axioms bank_node_994
theorem bank_node_995 : Checked [231, 275, 330, 525, 750, 770, 1375, 1650, 1750] [(0, 2, 5), (1, 2, 7), (3, 4, 8), (3, 5, 7), (4, 6, 7), (5, 6, 8)] 3 := by decide
#print axioms bank_node_995
end Archive
