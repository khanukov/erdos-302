import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_772 : Checked [231, 280, 360, 495, 540, 945, 1080, 1260, 1320] [(0, 1, 8), (1, 2, 7), (2, 3, 8), (2, 4, 6), (4, 5, 7)] 3 := by decide
#print axioms bank_node_772
theorem bank_node_775 : Checked [98, 147, 210, 255, 294, 490, 735, 833, 1190] [(0, 1, 4), (1, 2, 5), (2, 3, 8), (2, 4, 6), (4, 5, 6), (5, 7, 8)] 3 := by decide
#print axioms bank_node_775
end Archive
