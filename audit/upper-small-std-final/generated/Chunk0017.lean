import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_614 : Checked [49, 56, 60, 64, 392, 448, 735, 840, 960] [(0, 1, 4), (1, 2, 7), (1, 3, 5), (2, 3, 8), (4, 6, 7), (5, 7, 8)] 3 := by decide
#print axioms bank_node_614
theorem bank_node_615 : Checked [72, 99, 120, 143, 180, 195, 220, 264, 312] [(0, 1, 7), (0, 2, 4), (1, 4, 6), (2, 5, 8), (2, 6, 7), (3, 7, 8)] 3 := by decide
#print axioms bank_node_615
end Archive
