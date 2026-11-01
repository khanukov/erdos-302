import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_948 : Checked [80, 112, 168, 195, 280, 312, 336, 364, 420] [(0, 1, 4), (1, 2, 6), (2, 4, 8), (2, 5, 7), (3, 7, 8)] 3 := by decide
#print axioms bank_node_948
theorem bank_node_949 : Checked [105, 114, 117, 126, 455, 630, 1197, 1330, 1638] [(0, 1, 7), (0, 3, 5), (1, 3, 6), (2, 3, 8), (4, 5, 8), (5, 6, 7)] 3 := by decide
#print axioms bank_node_949
end Archive
