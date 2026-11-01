import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_863 : Checked [90, 98, 99, 105, 385, 441, 630, 990, 1470] [(0, 2, 7), (0, 3, 6), (1, 3, 8), (4, 6, 7), (5, 6, 8)] 3 := by decide
#print axioms bank_node_863
theorem bank_node_877 : Checked [495, 504, 539, 770, 792, 882, 1176, 1320, 1386] [(0, 3, 8), (0, 4, 7), (1, 4, 8), (1, 5, 6), (2, 5, 8)] 3 := by decide
#print axioms bank_node_877
end Archive
