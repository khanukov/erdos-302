import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_831 : Checked [33, 44, 60, 121, 132, 165, 660, 1210, 1452] [(0, 1, 4), (1, 2, 5), (3, 4, 8), (4, 5, 6), (6, 7, 8)] 3 := by decide
#print axioms bank_node_831
theorem bank_node_833 : Checked [63, 66, 70, 77, 462, 693, 770, 1155, 1386] [(0, 1, 8), (1, 2, 7), (1, 3, 4), (2, 3, 6), (4, 5, 8), (4, 6, 7)] 3 := by decide
#print axioms bank_node_833
end Archive
