import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_971 : Checked [44, 66, 84, 132, 147, 196, 231, 308, 539] [(0, 1, 3), (1, 2, 7), (2, 3, 6), (2, 4, 5), (3, 6, 7), (5, 7, 8)] 3 := by decide
#print axioms bank_node_971
theorem bank_node_982 : Checked [35, 42, 54, 63, 126, 189, 210, 315, 378] [(0, 1, 6), (1, 2, 5), (1, 3, 4), (2, 3, 8), (4, 5, 8), (4, 6, 7)] 3 := by decide
#print axioms bank_node_982
end Archive
