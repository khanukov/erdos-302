import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_1087 : Checked [42, 45, 54, 63, 70, 105, 126, 189, 378] [(0, 2, 7), (0, 3, 6), (0, 4, 5), (1, 4, 6), (2, 3, 8), (6, 7, 8)] 3 := by decide
#print axioms bank_node_1087
end Archive
