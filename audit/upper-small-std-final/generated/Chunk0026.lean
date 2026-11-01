import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_709 : Checked [18, 19, 20, 25, 100, 180, 225, 342, 380] [(0, 1, 7), (0, 2, 5), (1, 2, 8), (2, 3, 4), (4, 5, 6), (5, 7, 8)] 3 := by decide
#print axioms bank_node_709
theorem bank_node_714 : Checked [156, 195, 273, 364, 420, 702, 756, 780, 945] [(0, 1, 7), (0, 2, 3), (1, 3, 4), (2, 4, 7), (3, 5, 6), (4, 6, 8)] 3 := by decide
#print axioms bank_node_714
end Archive
