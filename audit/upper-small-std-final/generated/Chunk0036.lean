import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_755 : Checked [21, 22, 33, 66, 70, 77, 462, 770, 1155] [(0, 1, 6), (1, 2, 3), (3, 4, 8), (3, 5, 6), (4, 5, 7), (6, 7, 8)] 3 := by decide
#print axioms bank_node_755
theorem bank_node_760 : Checked [75, 120, 136, 153, 180, 200, 425, 1020, 1224] [(0, 1, 5), (1, 2, 7), (2, 3, 8), (2, 5, 6), (3, 4, 7)] 3 := by decide
#print axioms bank_node_760
end Archive
