import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_718 : Checked [33, 42, 44, 132, 154, 165, 385, 660, 924] [(0, 1, 4), (0, 2, 3), (1, 2, 8), (3, 4, 8), (3, 5, 7), (6, 7, 8)] 3 := by decide
#print axioms bank_node_718
theorem bank_node_723 : Checked [18, 19, 20, 21, 180, 315, 342, 380, 420] [(0, 1, 6), (0, 2, 4), (1, 2, 7), (2, 3, 8), (4, 5, 8), (4, 6, 7)] 3 := by decide
#print axioms bank_node_723
end Archive
