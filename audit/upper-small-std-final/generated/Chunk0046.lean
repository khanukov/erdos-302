import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_812 : Checked [11, 12, 13, 132, 156, 204, 374, 663, 858] [(0, 1, 3), (1, 2, 4), (3, 4, 8), (3, 5, 6), (4, 5, 7), (6, 7, 8)] 3 := by decide
#print axioms bank_node_812
theorem bank_node_813 : Checked [297, 385, 396, 540, 660, 693, 924, 990, 1188] [(0, 2, 8), (0, 3, 4), (1, 4, 6), (2, 4, 7), (2, 5, 6), (3, 7, 8)] 3 := by decide
#print axioms bank_node_813
end Archive
