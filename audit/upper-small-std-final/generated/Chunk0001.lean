import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_523 : Checked [105, 150, 225, 306, 350, 450, 595, 630, 850] [(0, 1, 4), (1, 2, 5), (2, 3, 8), (2, 4, 7), (3, 6, 7), (4, 6, 8)] 3 := by decide
#print axioms bank_node_523
theorem bank_node_525 : Checked [55, 60, 75, 84, 300, 525, 550, 660, 700] [(0, 1, 7), (1, 2, 4), (2, 3, 8), (4, 5, 8), (4, 6, 7)] 3 := by decide
#print axioms bank_node_525
end Archive
