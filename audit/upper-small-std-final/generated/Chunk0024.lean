import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_703 : Checked [54, 55, 57, 60, 297, 540, 660, 1026, 1140] [(0, 2, 7), (0, 3, 5), (1, 3, 6), (2, 3, 8), (4, 5, 6), (5, 7, 8)] 3 := by decide
#print axioms bank_node_703
theorem bank_node_704 : Checked [42, 63, 112, 126, 128, 144, 896, 1008, 1152] [(0, 1, 3), (1, 2, 5), (2, 3, 7), (2, 4, 6), (3, 5, 7), (4, 5, 8)] 3 := by decide
#print axioms bank_node_704
end Archive
