import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_998 : Checked [48, 50, 60, 85, 200, 204, 240, 1200, 1360] [(0, 1, 7), (0, 2, 6), (2, 3, 5), (4, 6, 7), (5, 6, 8)] 3 := by decide
#print axioms bank_node_998
theorem bank_node_999 : Checked [345, 460, 660, 736, 1056, 1265, 1380, 1518, 1760] [(0, 1, 6), (1, 2, 7), (2, 4, 8), (2, 5, 6), (3, 5, 8)] 3 := by decide
#print axioms bank_node_999
end Archive
