import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_1064 : Checked [180, 192, 255, 288, 320, 480, 544, 576, 612] [(0, 2, 8), (0, 3, 5), (1, 3, 7), (1, 4, 5), (2, 5, 6), (3, 6, 8)] 3 := by decide
#print axioms bank_node_1064
theorem bank_node_1065 : Checked [126, 135, 189, 210, 315, 378, 390, 455, 1638] [(0, 2, 5), (0, 3, 4), (1, 3, 5), (3, 6, 7), (4, 6, 8)] 3 := by decide
#print axioms bank_node_1065
end Archive
