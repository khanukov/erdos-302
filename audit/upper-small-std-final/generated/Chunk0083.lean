import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_1002 : Checked [65, 70, 80, 85, 560, 910, 952, 1360, 1456] [(0, 1, 5), (1, 2, 4), (2, 3, 7), (4, 5, 8), (4, 6, 7)] 3 := by decide
#print axioms bank_node_1002
theorem bank_node_1004 : Checked [15, 18, 22, 75, 90, 99, 450, 825, 990] [(0, 1, 4), (1, 2, 5), (3, 4, 6), (4, 5, 8), (6, 7, 8)] 3 := by decide
#print axioms bank_node_1004
end Archive
