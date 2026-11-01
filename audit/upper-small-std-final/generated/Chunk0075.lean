import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_960 : Checked [105, 140, 189, 240, 336, 420, 432, 540, 560] [(0, 1, 5), (1, 2, 7), (1, 3, 4), (2, 4, 6), (3, 5, 8), (3, 6, 7)] 3 := by decide
#print axioms bank_node_960
theorem bank_node_961 : Checked [8, 10, 15, 30, 40, 50, 75, 120, 200] [(0, 1, 4), (1, 2, 3), (3, 4, 7), (3, 5, 6), (4, 5, 8), (6, 7, 8)] 3 := by decide
#print axioms bank_node_961
end Archive
