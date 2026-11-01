import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_676 : Checked [60, 64, 72, 81, 360, 576, 648, 810, 960] [(0, 1, 8), (0, 2, 4), (1, 2, 5), (2, 3, 6), (4, 5, 8), (4, 6, 7)] 3 := by decide
#print axioms bank_node_676
theorem bank_node_700 : Checked [18, 22, 33, 55, 66, 99, 198, 330, 495] [(0, 1, 5), (1, 2, 4), (3, 4, 7), (4, 5, 6), (6, 7, 8)] 3 := by decide
#print axioms bank_node_700
end Archive
