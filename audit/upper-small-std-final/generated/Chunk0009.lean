import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_573 : Checked [25, 26, 30, 39, 130, 150, 195, 650, 975] [(0, 1, 7), (0, 2, 5), (1, 2, 6), (2, 3, 4), (4, 5, 8), (5, 6, 7)] 3 := by decide
#print axioms bank_node_573
theorem bank_node_576 : Checked [75, 84, 120, 165, 200, 280, 440, 700, 770] [(0, 1, 7), (0, 2, 4), (1, 2, 5), (2, 3, 6), (4, 5, 7), (5, 6, 8)] 3 := by decide
#print axioms bank_node_576
end Archive
