import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_841 : Checked [7, 8, 9, 56, 72, 108, 189, 216, 252] [(0, 1, 3), (1, 2, 4), (3, 4, 8), (4, 5, 7), (5, 6, 8)] 3 := by decide
#print axioms bank_node_841
theorem bank_node_843 : Checked [225, 360, 495, 600, 616, 1100, 1155, 1320, 1400] [(0, 1, 3), (1, 2, 7), (3, 5, 7), (4, 5, 8), (4, 6, 7)] 3 := by decide
#print axioms bank_node_843
end Archive
