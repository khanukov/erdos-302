import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_1079 : Checked [11, 12, 14, 15, 84, 132, 140, 210, 231] [(0, 1, 5), (1, 2, 4), (2, 3, 7), (4, 5, 8), (4, 6, 7)] 3 := by decide
#print axioms bank_node_1079
theorem bank_node_1081 : Checked [55, 58, 60, 62, 660, 899, 1023, 1740, 1860] [(0, 2, 4), (1, 2, 7), (1, 3, 5), (2, 3, 8), (4, 6, 8), (5, 7, 8)] 3 := by decide
#print axioms bank_node_1081
end Archive
