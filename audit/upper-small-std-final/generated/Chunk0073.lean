import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_952 : Checked [44, 55, 60, 165, 220, 260, 429, 660, 1430] [(0, 1, 4), (0, 2, 3), (1, 2, 7), (3, 4, 7), (4, 5, 8), (5, 6, 7)] 3 := by decide
#print axioms bank_node_952
theorem bank_node_954 : Checked [231, 315, 330, 462, 495, 770, 990, 1155, 1386] [(0, 2, 5), (1, 3, 6), (2, 3, 7), (2, 4, 6), (3, 5, 7), (4, 5, 8)] 3 := by decide
#print axioms bank_node_954
end Archive
