import Dag

namespace Node1209Small
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000
theorem node0 : ArchiveDag.SmallCheck {2, 3, 6} 1 := by decide
#print axioms node0
theorem node1 : ArchiveDag.SmallCheck {2, 3, 4, 6, 12} 2 := by decide
#print axioms node1
theorem node2 : ArchiveDag.SmallCheck {4, 5, 20} 1 := by decide
#print axioms node2
theorem node3 : ArchiveDag.SmallCheck {6, 10, 15} 1 := by decide
#print axioms node3
theorem node6 : ArchiveDag.SmallCheck {12, 21, 28} 1 := by decide
#print axioms node6
theorem node9 : ArchiveDag.SmallCheck {10, 14, 35} 1 := by decide
#print axioms node9
theorem node10 : ArchiveDag.SmallCheck {15, 24, 40} 1 := by decide
#print axioms node10
theorem node11 : ArchiveDag.SmallCheck {2, 3, 4, 5, 6, 12, 20, 30} 3 := by decide
#print axioms node11
theorem node12 : ArchiveDag.SmallCheck {8, 10, 15, 24, 30, 40} 2 := by decide
#print axioms node12
theorem node13 : ArchiveDag.SmallCheck {8, 10, 12, 15, 24, 40} 2 := by decide
#print axioms node13
theorem node16 : ArchiveDag.SmallCheck {7, 8, 56} 1 := by decide
#print axioms node16
theorem node17 : ArchiveDag.SmallCheck {3, 4, 12} 1 := by decide
#print axioms node17
theorem node18 : ArchiveDag.SmallCheck {7, 8, 12, 16, 24, 42, 48, 56} 3 := by decide
#print axioms node18
theorem node19 : ArchiveDag.SmallCheck {21, 30, 70} 1 := by decide
#print axioms node19
theorem node20 : ArchiveDag.SmallCheck {35, 60, 84} 1 := by decide
#print axioms node20
theorem node21 : ArchiveDag.SmallCheck {8, 10, 12, 15, 16, 24, 40, 48} 3 := by decide
#print axioms node21
end Node1209Small
