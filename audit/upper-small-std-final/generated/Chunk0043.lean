import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_796 : Checked [63, 64, 68, 72, 357, 504, 576, 1088, 1224] [(0, 3, 5), (1, 2, 7), (1, 3, 6), (2, 3, 8), (4, 5, 8), (6, 7, 8)] 3 := by decide
#print axioms bank_node_796
theorem bank_node_797 : Checked [34, 36, 45, 153, 180, 204, 255, 612, 1020] [(0, 1, 7), (1, 2, 4), (3, 4, 8), (3, 5, 7), (4, 6, 7), (5, 6, 8)] 3 := by decide
#print axioms bank_node_797
end Archive
