import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_559 : Checked [161, 165, 210, 286, 390, 455, 690, 770, 897] [(0, 2, 6), (1, 2, 7), (1, 3, 4), (2, 4, 5), (3, 5, 7), (4, 6, 8)] 3 := by decide
#print axioms bank_node_559
theorem bank_node_562 : Checked [51, 54, 55, 60, 297, 340, 540, 660, 918] [(0, 1, 8), (0, 3, 5), (1, 3, 6), (2, 3, 7), (4, 6, 7), (5, 6, 8)] 3 := by decide
#print axioms bank_node_562
end Archive
