import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_845 : Checked [231, 280, 360, 495, 585, 936, 1092, 1260, 1320] [(0, 1, 8), (1, 2, 7), (2, 3, 8), (2, 4, 5), (4, 6, 7)] 3 := by decide
#print axioms bank_node_845
theorem bank_node_849 : Checked [490, 504, 585, 840, 882, 936, 1092, 1176, 1260] [(0, 3, 7), (1, 3, 8), (1, 4, 7), (1, 5, 6), (2, 6, 8)] 3 := by decide
#print axioms bank_node_849
end Archive
