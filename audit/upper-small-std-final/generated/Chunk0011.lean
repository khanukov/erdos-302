import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_596 : Checked [75, 120, 176, 200, 220, 264, 528, 825, 880] [(0, 1, 3), (1, 4, 5), (2, 4, 8), (2, 5, 6), (3, 5, 7)] 3 := by decide
#print axioms bank_node_596
theorem bank_node_597 : Checked [130, 180, 225, 230, 299, 468, 828, 900, 975] [(0, 1, 5), (0, 3, 4), (1, 2, 7), (1, 3, 6), (4, 5, 6), (5, 7, 8)] 3 := by decide
#print axioms bank_node_597
end Archive
