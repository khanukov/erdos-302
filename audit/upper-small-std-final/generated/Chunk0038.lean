import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_770 : Checked [18, 21, 22, 99, 126, 153, 462, 714, 1309] [(0, 1, 4), (0, 2, 3), (1, 2, 6), (3, 4, 6), (4, 5, 7), (6, 7, 8)] 3 := by decide
#print axioms bank_node_770
theorem bank_node_771 : Checked [225, 306, 350, 510, 595, 630, 765, 850, 1275] [(0, 1, 7), (0, 2, 5), (1, 3, 6), (1, 4, 5), (2, 4, 7), (3, 7, 8)] 3 := by decide
#print axioms bank_node_771
end Archive
