import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_1034 : Checked [44, 66, 84, 91, 132, 231, 308, 429, 1092] [(0, 1, 4), (1, 2, 6), (2, 3, 8), (2, 4, 5), (4, 5, 6), (6, 7, 8)] 3 := by decide
#print axioms bank_node_1034
theorem bank_node_1035 : Checked [50, 52, 60, 65, 195, 260, 325, 780, 1300] [(0, 1, 8), (1, 3, 5), (2, 3, 7), (4, 5, 7), (5, 6, 8)] 3 := by decide
#print axioms bank_node_1035
end Archive
