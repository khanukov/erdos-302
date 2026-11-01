import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_880 : Checked [55, 60, 69, 260, 429, 460, 598, 660, 1518] [(0, 1, 7), (1, 2, 5), (3, 4, 7), (3, 5, 6), (4, 6, 8), (5, 7, 8)] 3 := by decide
#print axioms bank_node_880
theorem bank_node_884 : Checked [429, 504, 539, 792, 882, 936, 1092, 1176, 1386] [(0, 3, 5), (1, 3, 8), (1, 4, 7), (1, 5, 6), (2, 4, 8)] 3 := by decide
#print axioms bank_node_884
end Archive
