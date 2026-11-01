import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_1005 : Checked [209, 270, 330, 342, 513, 570, 855, 1026, 1485] [(0, 2, 5), (1, 2, 8), (1, 4, 5), (3, 4, 7), (3, 5, 6)] 3 := by decide
#print axioms bank_node_1005
theorem bank_node_1007 : Checked [135, 200, 216, 280, 360, 700, 945, 1260, 1575] [(0, 2, 4), (1, 3, 5), (2, 3, 6), (3, 4, 7), (5, 7, 8)] 3 := by decide
#print axioms bank_node_1007
end Archive
