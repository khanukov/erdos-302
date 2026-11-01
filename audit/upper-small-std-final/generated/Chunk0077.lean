import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_967 : Checked [105, 114, 126, 189, 378, 630, 945, 1197, 1330] [(0, 1, 8), (0, 2, 5), (1, 2, 7), (2, 3, 4), (4, 5, 6), (5, 7, 8)] 3 := by decide
#print axioms bank_node_967
theorem bank_node_968 : Checked [374, 390, 495, 585, 663, 715, 858, 1170, 1530] [(0, 2, 8), (0, 4, 6), (1, 3, 7), (1, 5, 6), (2, 6, 7), (4, 7, 8)] 3 := by decide
#print axioms bank_node_968
end Archive
