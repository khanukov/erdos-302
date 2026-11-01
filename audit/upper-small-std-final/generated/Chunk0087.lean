import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_1019 : Checked [45, 51, 60, 105, 140, 180, 238, 252, 340] [(0, 2, 5), (1, 2, 8), (2, 3, 4), (3, 5, 7), (4, 6, 8)] 3 := by decide
#print axioms bank_node_1019
theorem bank_node_1021 : Checked [75, 84, 100, 255, 300, 525, 700, 1190, 1700] [(0, 1, 6), (0, 2, 4), (1, 2, 5), (3, 4, 8), (4, 5, 6), (6, 7, 8)] 3 := by decide
#print axioms bank_node_1021
end Archive
