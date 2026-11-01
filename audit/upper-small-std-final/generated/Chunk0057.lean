import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_878 : Checked [374, 495, 630, 663, 858, 1071, 1170, 1365, 1530] [(0, 1, 8), (0, 3, 4), (1, 4, 6), (2, 5, 8), (2, 6, 7), (3, 6, 8)] 3 := by decide
#print axioms bank_node_878
theorem bank_node_879 : Checked [18, 22, 33, 63, 66, 99, 198, 231, 1386] [(0, 1, 5), (1, 2, 4), (3, 4, 8), (4, 5, 6), (6, 7, 8)] 3 := by decide
#print axioms bank_node_879
end Archive
