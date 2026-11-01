import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_912 : Checked [16, 18, 21, 98, 126, 144, 441, 784, 1008] [(0, 1, 5), (1, 2, 4), (3, 4, 6), (4, 5, 8), (6, 7, 8)] 3 := by decide
#print axioms bank_node_912
theorem bank_node_913 : Checked [165, 171, 190, 198, 285, 570, 990, 1045, 1254] [(0, 2, 8), (0, 3, 6), (1, 3, 8), (2, 4, 5), (5, 7, 8)] 3 := by decide
#print axioms bank_node_913
end Archive
