import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_924 : Checked [33, 42, 63, 126, 154, 176, 693, 1232, 1584] [(0, 1, 4), (1, 2, 3), (3, 4, 6), (4, 5, 7), (6, 7, 8)] 3 := by decide
#print axioms bank_node_924
theorem bank_node_926 : Checked [21, 30, 42, 45, 63, 70, 90, 105, 126] [(0, 1, 5), (1, 2, 7), (1, 3, 6), (2, 4, 8), (2, 5, 7), (3, 5, 8)] 3 := by decide
#print axioms bank_node_926
end Archive
