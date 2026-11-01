import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_1025 : Checked [336, 464, 630, 720, 1071, 1218, 1305, 1360, 1530] [(0, 1, 5), (0, 2, 3), (1, 3, 6), (2, 4, 8), (2, 5, 6), (3, 7, 8)] 3 := by decide
#print axioms bank_node_1025
theorem bank_node_1028 : Checked [21, 28, 44, 77, 84, 132, 154, 231, 924] [(0, 1, 4), (1, 2, 3), (3, 4, 8), (4, 5, 7), (5, 6, 8)] 3 := by decide
#print axioms bank_node_1028
end Archive
