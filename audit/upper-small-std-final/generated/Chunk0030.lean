import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_730 : Checked [171, 252, 336, 441, 532, 588, 784, 912, 1008] [(0, 1, 4), (1, 2, 8), (1, 3, 5), (2, 4, 7), (2, 5, 6), (3, 6, 8)] 3 := by decide
#print axioms bank_node_730
theorem bank_node_732 : Checked [119, 168, 216, 306, 408, 459, 756, 918, 1224] [(0, 1, 4), (1, 2, 6), (2, 4, 5), (3, 4, 8), (3, 5, 7)] 3 := by decide
#print axioms bank_node_732
end Archive
