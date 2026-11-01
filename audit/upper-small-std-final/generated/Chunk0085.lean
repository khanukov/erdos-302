import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_1009 : Checked [60, 75, 80, 85, 200, 204, 240, 1200, 1360] [(0, 2, 6), (0, 3, 5), (1, 2, 7), (2, 3, 8), (4, 6, 7), (5, 6, 8)] 3 := by decide
#print axioms bank_node_1009
theorem bank_node_1016 : Checked [128, 192, 195, 240, 384, 640, 960, 1040, 1664] [(0, 1, 4), (1, 3, 6), (2, 3, 7), (3, 4, 5), (4, 5, 6), (5, 7, 8)] 3 := by decide
#print axioms bank_node_1016
end Archive
