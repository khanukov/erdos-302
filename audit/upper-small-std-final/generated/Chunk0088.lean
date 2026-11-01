import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_1022 : Checked [385, 450, 506, 630, 825, 990, 1035, 1575, 1610] [(0, 2, 8), (0, 3, 5), (1, 3, 7), (1, 4, 5), (2, 5, 6), (3, 6, 8)] 3 := by decide
#print axioms bank_node_1022
theorem bank_node_1024 : Checked [98, 105, 117, 126, 441, 455, 630, 1470, 1638] [(0, 1, 7), (0, 3, 4), (1, 3, 6), (2, 3, 8), (4, 6, 7), (5, 6, 8)] 3 := by decide
#print axioms bank_node_1024
end Archive
