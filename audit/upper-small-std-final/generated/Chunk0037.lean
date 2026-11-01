import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_766 : Checked [64, 68, 72, 81, 576, 648, 1088, 1224, 1377] [(0, 1, 6), (0, 2, 4), (1, 2, 7), (2, 3, 5), (4, 6, 7), (5, 7, 8)] 3 := by decide
#print axioms bank_node_766
theorem bank_node_768 : Checked [14, 21, 30, 42, 50, 70, 75, 105, 175] [(0, 1, 3), (1, 2, 5), (2, 3, 7), (2, 4, 6), (3, 5, 7), (4, 5, 8)] 3 := by decide
#print axioms bank_node_768
end Archive
