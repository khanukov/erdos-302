import Checker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace Archive
open SmallStd
theorem bank_node_18 : Checked [7, 8, 12, 16, 24, 42, 48, 56] [(0, 1, 7), (1, 2, 4), (2, 3, 6), (3, 4, 6), (4, 5, 7)] 3 := by decide
#print axioms bank_node_18
theorem bank_node_21 : Checked [8, 10, 12, 15, 16, 24, 40, 48] [(0, 1, 6), (0, 2, 5), (2, 4, 7), (3, 5, 6), (4, 5, 7)] 3 := by decide
#print axioms bank_node_21
theorem bank_node_42 : Checked [10, 14, 15, 35, 42, 70, 105, 210] [(0, 1, 3), (1, 2, 7), (3, 4, 7), (4, 5, 6), (5, 6, 7)] 3 := by decide
#print axioms bank_node_42
theorem bank_node_44 : Checked [4, 5, 6, 8, 12, 20, 24, 30] [(0, 1, 5), (0, 2, 4), (1, 2, 7), (2, 3, 6), (3, 4, 6), (4, 5, 7)] 3 := by decide
#print axioms bank_node_44
theorem bank_node_49 : Checked [3, 4, 5, 12, 20, 24, 30, 120] [(0, 1, 3), (1, 2, 4), (3, 4, 6), (4, 5, 7), (5, 6, 7)] 3 := by decide
#print axioms bank_node_49
theorem bank_node_50 : Checked [21, 24, 28, 35, 60, 84, 140, 168] [(0, 1, 7), (0, 2, 5), (1, 2, 7), (2, 3, 6), (3, 4, 5)] 3 := by decide
#print axioms bank_node_50
theorem bank_node_53 : Checked [10, 14, 21, 35, 42, 70, 105, 210] [(0, 1, 3), (1, 2, 4), (3, 4, 7), (4, 5, 6), (5, 6, 7)] 3 := by decide
#print axioms bank_node_53
theorem bank_node_54 : Checked [14, 15, 21, 35, 42, 60, 84, 210] [(0, 1, 7), (0, 2, 4), (3, 4, 7), (3, 5, 6), (5, 6, 7)] 3 := by decide
#print axioms bank_node_54
theorem bank_node_63 : Checked [5, 6, 8, 10, 15, 24, 30, 40] [(0, 1, 6), (1, 2, 5), (1, 3, 4), (2, 3, 7), (3, 4, 6), (4, 5, 7)] 3 := by decide
#print axioms bank_node_63
theorem bank_node_70 : Checked [10, 14, 15, 21, 30, 35, 42, 210] [(0, 1, 5), (0, 2, 4), (1, 2, 7), (1, 3, 6), (4, 5, 7), (5, 6, 7)] 3 := by decide
#print axioms bank_node_70
theorem bank_node_71 : Checked [4, 6, 8, 10, 12, 15, 24, 40] [(0, 1, 4), (1, 2, 6), (1, 3, 5), (2, 3, 7), (2, 4, 6), (5, 6, 7)] 3 := by decide
#print axioms bank_node_71
theorem bank_node_74 : Checked [4, 6, 7, 8, 12, 24, 42, 56] [(0, 1, 4), (1, 2, 6), (1, 3, 5), (2, 3, 7), (3, 4, 5), (5, 6, 7)] 3 := by decide
#print axioms bank_node_74
theorem bank_node_77 : Checked [12, 15, 20, 21, 28, 30, 60, 70] [(0, 1, 6), (0, 2, 5), (0, 3, 4), (1, 2, 6), (2, 4, 7), (2, 5, 6), (3, 5, 7)] 3 := by decide
#print axioms bank_node_77
theorem bank_node_80 : Checked [14, 21, 28, 35, 42, 60, 84, 140] [(0, 1, 4), (1, 2, 6), (2, 3, 7), (2, 4, 6), (3, 5, 6), (4, 5, 7)] 3 := by decide
#print axioms bank_node_80
theorem bank_node_81 : Checked [12, 15, 16, 20, 30, 48, 60, 80] [(0, 1, 6), (0, 2, 5), (0, 3, 4), (1, 3, 6), (2, 3, 7), (3, 4, 6), (4, 5, 7)] 3 := by decide
#print axioms bank_node_81
theorem bank_node_478 : Checked [135, 140, 180, 189, 280, 504, 540, 630] [(0, 2, 6), (1, 2, 7), (1, 3, 6), (2, 4, 5), (4, 5, 7)] 3 := by decide
#print axioms bank_node_478
theorem bank_node_485 : Checked [30, 33, 50, 55, 66, 75, 330, 550] [(0, 1, 6), (0, 2, 5), (0, 3, 4), (2, 3, 7), (3, 4, 6), (4, 5, 7)] 3 := by decide
#print axioms bank_node_485
theorem bank_node_486 : Checked [5, 6, 9, 12, 18, 30, 36, 45] [(0, 1, 5), (1, 2, 4), (2, 3, 6), (3, 4, 6), (4, 5, 7)] 3 := by decide
#print axioms bank_node_486
theorem bank_node_487 : Checked [21, 30, 39, 42, 70, 105, 130, 546] [(0, 1, 4), (1, 2, 6), (1, 3, 5), (2, 3, 7), (3, 4, 5), (5, 6, 7)] 3 := by decide
#print axioms bank_node_487
theorem bank_node_513 : Checked [45, 63, 70, 105, 126, 210, 315, 630] [(0, 2, 4), (1, 2, 7), (2, 3, 5), (3, 4, 7), (4, 5, 6), (5, 6, 7)] 3 := by decide
#print axioms bank_node_513
end Archive
