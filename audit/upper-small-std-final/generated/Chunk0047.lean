import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_818 : Checked [231, 330, 429, 495, 585, 770, 990, 1386, 1430] [(0, 1, 5), (1, 2, 8), (1, 3, 6), (3, 5, 7), (4, 6, 8)] 3 := by decide
#print axioms bank_node_818
theorem bank_node_819 : Checked [55, 66, 78, 330, 429, 495, 585, 990, 1430] [(0, 1, 3), (1, 2, 4), (3, 4, 8), (3, 5, 7), (6, 7, 8)] 3 := by decide
#print axioms bank_node_819
end Archive
