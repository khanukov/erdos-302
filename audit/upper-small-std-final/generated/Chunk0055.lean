import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_859 : Checked [231, 280, 525, 600, 616, 1100, 1155, 1320, 1400] [(0, 1, 7), (1, 2, 3), (3, 5, 7), (4, 5, 8), (4, 6, 7)] 3 := by decide
#print axioms bank_node_859
theorem bank_node_861 : Checked [65, 78, 90, 99, 117, 234, 585, 990, 1430] [(0, 2, 5), (1, 2, 6), (1, 4, 5), (2, 3, 7), (6, 7, 8)] 3 := by decide
#print axioms bank_node_861
end Archive
