import Dag

namespace Node1209Small
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000
theorem node22 : ArchiveDag.SmallCheck {5, 6, 10, 12, 15, 30, 60} 3 := by decide
#print axioms node22
theorem node23 : ArchiveDag.SmallCheck {15, 20, 24, 40, 60} 2 := by decide
#print axioms node23
theorem node24 : ArchiveDag.SmallCheck {5, 6, 10, 15, 30} 2 := by decide
#print axioms node24
theorem node29 : ArchiveDag.SmallCheck {12, 14, 21, 28, 84} 2 := by decide
#print axioms node29
theorem node30 : ArchiveDag.SmallCheck {12, 15, 24, 40, 60} 2 := by decide
#print axioms node30
theorem node37 : ArchiveDag.SmallCheck {21, 30, 35, 42, 70, 105, 210} 3 := by decide
#print axioms node37
theorem node39 : ArchiveDag.SmallCheck {12, 21, 24, 28, 168} 2 := by decide
#print axioms node39
theorem node42 : ArchiveDag.SmallCheck {10, 14, 15, 35, 42, 70, 105, 210} 3 := by decide
#print axioms node42
theorem node45 : ArchiveDag.SmallCheck {30, 35, 42, 60, 105, 140, 210} 3 := by decide
#print axioms node45
theorem node47 : ArchiveDag.SmallCheck {56, 105, 120} 1 := by decide
#print axioms node47
theorem node48 : ArchiveDag.SmallCheck {12, 15, 20, 24, 30, 40, 60} 3 := by decide
#print axioms node48
theorem node51 : ArchiveDag.SmallCheck {14, 15, 210} 1 := by decide
#print axioms node51
theorem node52 : ArchiveDag.SmallCheck {15, 16, 240} 1 := by decide
#print axioms node52
theorem node54 : ArchiveDag.SmallCheck {14, 15, 21, 35, 42, 60, 84, 210} 3 := by decide
#print axioms node54
theorem node55 : ArchiveDag.SmallCheck {6, 7, 42} 1 := by decide
#print axioms node55
theorem node60 : ArchiveDag.SmallCheck {21, 24, 42, 56, 168} 2 := by decide
#print axioms node60
end Node1209Small
