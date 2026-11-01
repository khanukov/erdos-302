import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_517 : Checked [95, 120, 220, 264, 396, 456, 495, 627, 792] [(0, 1, 5), (1, 2, 3), (2, 4, 6), (3, 4, 8), (3, 5, 7)] 3 := by decide
#print axioms bank_node_517
theorem bank_node_520 : Checked [81, 90, 110, 135, 270, 405, 495, 594, 810] [(0, 1, 8), (1, 2, 6), (1, 3, 4), (2, 3, 7), (4, 5, 8), (4, 6, 7)] 3 := by decide
#print axioms bank_node_520
end Archive
