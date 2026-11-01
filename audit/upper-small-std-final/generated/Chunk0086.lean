import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_1017 : Checked [10, 14, 21, 34, 35, 42, 210, 255, 1190] [(0, 1, 4), (1, 2, 5), (3, 4, 8), (4, 5, 6), (6, 7, 8)] 3 := by decide
#print axioms bank_node_1017
theorem bank_node_1018 : Checked [165, 195, 240, 384, 528, 640, 1040, 1408, 1664] [(0, 2, 4), (1, 2, 6), (2, 3, 5), (3, 4, 7), (5, 6, 8)] 3 := by decide
#print axioms bank_node_1018
end Archive
