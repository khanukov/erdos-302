import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_897 : Checked [33, 42, 44, 77, 84, 132, 154, 231, 924] [(0, 1, 6), (0, 2, 5), (1, 2, 8), (3, 4, 8), (4, 5, 7), (5, 6, 8)] 3 := by decide
#print axioms bank_node_897
theorem bank_node_898 : Checked [98, 126, 144, 162, 441, 567, 784, 1008, 1296] [(0, 1, 4), (1, 2, 7), (1, 3, 5), (2, 3, 8), (4, 6, 7), (5, 7, 8)] 3 := by decide
#print axioms bank_node_898
end Archive
