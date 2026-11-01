import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_1050 : Checked [77, 126, 162, 198, 297, 567, 594, 891, 1782] [(0, 1, 3), (1, 2, 5), (2, 3, 7), (3, 4, 6), (6, 7, 8)] 3 := by decide
#print axioms bank_node_1050
theorem bank_node_1053 : Checked [315, 390, 495, 585, 715, 858, 910, 1170, 1638] [(0, 1, 8), (1, 3, 7), (1, 4, 5), (2, 5, 7), (3, 6, 8)] 3 := by decide
#print axioms bank_node_1053
end Archive
