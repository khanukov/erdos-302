import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_990 : Checked [135, 216, 280, 360, 585, 936, 945, 1092, 1260] [(0, 1, 3), (1, 2, 6), (2, 3, 8), (3, 4, 5), (4, 7, 8)] 3 := by decide
#print axioms bank_node_990
theorem bank_node_993 : Checked [115, 126, 138, 207, 322, 414, 690, 1035, 1449] [(0, 2, 6), (1, 2, 8), (1, 3, 4), (2, 3, 5), (4, 5, 8), (5, 6, 7)] 3 := by decide
#print axioms bank_node_993
end Archive
