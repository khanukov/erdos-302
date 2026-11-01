import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_705 : Checked [35, 36, 54, 60, 63, 84, 90, 108, 135] [(0, 3, 5), (1, 2, 7), (1, 3, 6), (1, 4, 5), (2, 6, 8), (3, 7, 8)] 3 := by decide
#print axioms bank_node_705
theorem bank_node_708 : Checked [75, 120, 135, 160, 200, 480, 800, 864, 1080] [(0, 1, 4), (1, 2, 8), (1, 3, 5), (2, 3, 7), (3, 4, 6), (5, 7, 8)] 3 := by decide
#print axioms bank_node_708
end Archive
