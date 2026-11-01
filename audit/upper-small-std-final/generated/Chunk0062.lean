import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_900 : Checked [600, 616, 715, 975, 1100, 1155, 1320, 1400, 1560] [(0, 3, 8), (0, 4, 6), (1, 4, 7), (1, 5, 6), (2, 6, 8)] 3 := by decide
#print axioms bank_node_900
theorem bank_node_905 : Checked [429, 495, 504, 770, 792, 936, 1092, 1320, 1386] [(0, 4, 5), (1, 3, 8), (1, 4, 7), (2, 4, 8), (2, 5, 6)] 3 := by decide
#print axioms bank_node_905
end Archive
