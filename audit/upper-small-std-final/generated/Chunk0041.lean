import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_789 : Checked [75, 80, 88, 96, 480, 800, 880, 1056, 1200] [(0, 1, 8), (1, 2, 6), (1, 3, 4), (2, 3, 7), (4, 5, 8), (4, 6, 7)] 3 := by decide
#print axioms bank_node_789
theorem bank_node_790 : Checked [88, 96, 120, 135, 480, 864, 880, 1056, 1080] [(0, 1, 7), (1, 2, 4), (2, 3, 8), (4, 5, 8), (4, 6, 7)] 3 := by decide
#print axioms bank_node_790
end Archive
