import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_906 : Checked [147, 168, 224, 273, 672, 1176, 1248, 1456, 1568] [(0, 1, 5), (1, 2, 4), (2, 3, 6), (4, 5, 8), (4, 6, 7)] 3 := by decide
#print axioms bank_node_906
theorem bank_node_908 : Checked [40, 49, 56, 60, 105, 120, 392, 735, 840] [(0, 3, 5), (1, 2, 6), (2, 3, 8), (2, 4, 5), (4, 5, 8), (6, 7, 8)] 3 := by decide
#print axioms bank_node_908
end Archive
