import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_746 : Checked [45, 70, 98, 126, 147, 245, 294, 441, 882] [(0, 1, 3), (1, 2, 5), (2, 3, 7), (2, 4, 6), (3, 4, 8), (6, 7, 8)] 3 := by decide
#print axioms bank_node_746
theorem bank_node_747 : Checked [10, 14, 15, 35, 42, 49, 210, 294, 735] [(0, 1, 3), (1, 2, 6), (3, 4, 6), (4, 5, 7), (6, 7, 8)] 3 := by decide
#print axioms bank_node_747
end Archive
