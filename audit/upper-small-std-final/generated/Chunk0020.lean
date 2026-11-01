import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_666 : Checked [15, 18, 21, 90, 126, 147, 315, 490, 882] [(0, 1, 3), (1, 2, 4), (3, 4, 6), (4, 5, 8), (6, 7, 8)] 3 := by decide
#print axioms bank_node_666
theorem bank_node_667 : Checked [8, 9, 10, 40, 72, 81, 90, 648, 810] [(0, 1, 4), (0, 2, 3), (1, 2, 6), (3, 4, 6), (4, 5, 7), (5, 6, 8)] 3 := by decide
#print axioms bank_node_667
end Archive
