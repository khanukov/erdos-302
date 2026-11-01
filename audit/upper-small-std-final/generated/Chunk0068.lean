import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_921 : Checked [77, 126, 162, 189, 198, 378, 567, 891, 1134] [(0, 1, 4), (1, 2, 6), (1, 3, 5), (2, 3, 8), (2, 4, 7), (5, 6, 8)] 3 := by decide
#print axioms bank_node_921
theorem bank_node_922 : Checked [297, 396, 660, 756, 990, 1155, 1188, 1485, 1540] [(0, 1, 6), (1, 2, 4), (2, 5, 8), (2, 6, 7), (3, 7, 8)] 3 := by decide
#print axioms bank_node_922
end Archive
