import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_577 : Checked [117, 132, 156, 260, 390, 468, 585, 715, 858] [(0, 2, 5), (1, 2, 8), (2, 3, 4), (3, 5, 6), (4, 7, 8)] 3 := by decide
#print axioms bank_node_577
theorem bank_node_595 : Checked [9, 12, 16, 36, 48, 64, 144, 192, 576] [(0, 1, 3), (1, 2, 4), (3, 4, 6), (4, 5, 7), (6, 7, 8)] 3 := by decide
#print axioms bank_node_595
end Archive
