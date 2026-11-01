import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_888 : Checked [7, 8, 9, 56, 63, 72, 168, 252, 504] [(0, 1, 3), (1, 2, 5), (3, 4, 8), (3, 5, 7), (4, 5, 8), (6, 7, 8)] 3 := by decide
#print axioms bank_node_888
theorem bank_node_890 : Checked [98, 126, 144, 192, 441, 576, 784, 1008, 1344] [(0, 1, 4), (1, 2, 7), (2, 3, 5), (4, 6, 7), (5, 7, 8)] 3 := by decide
#print axioms bank_node_890
end Archive
