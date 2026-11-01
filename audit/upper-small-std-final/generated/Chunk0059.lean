import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_886 : Checked [315, 420, 540, 672, 864, 945, 1120, 1260, 1440] [(0, 1, 7), (1, 3, 6), (2, 4, 8), (2, 5, 7), (3, 7, 8)] 3 := by decide
#print axioms bank_node_886
theorem bank_node_887 : Checked [560, 576, 693, 880, 960, 1008, 1260, 1344, 1540] [(0, 3, 8), (0, 4, 7), (0, 5, 6), (1, 5, 7), (2, 6, 8)] 3 := by decide
#print axioms bank_node_887
end Archive
