import Dag

namespace Node1209Small
set_option maxRecDepth 4096
set_option maxHeartbeats 4000000
theorem node63 : ArchiveDag.SmallCheck {5, 6, 8, 10, 15, 24, 30, 40} 3 := by decide
#print axioms node63
theorem node66 : ArchiveDag.SmallCheck {12, 21, 24, 28, 42, 56, 168} 3 := by decide
#print axioms node66
theorem node75 : ArchiveDag.SmallCheck {96, 105, 1120} 1 := by decide
#print axioms node75
theorem node76 : ArchiveDag.SmallCheck {3, 4, 5, 12, 20, 30} 2 := by decide
#print axioms node76
theorem node84 : ArchiveDag.SmallCheck {20, 36, 45} 1 := by decide
#print axioms node84
theorem node85 : ArchiveDag.SmallCheck {14, 18, 63} 1 := by decide
#print axioms node85
theorem node86 : ArchiveDag.SmallCheck {30, 55, 66} 1 := by decide
#print axioms node86
theorem node87 : ArchiveDag.SmallCheck {8, 9, 72} 1 := by decide
#print axioms node87
theorem node88 : ArchiveDag.SmallCheck {28, 44, 77} 1 := by decide
#print axioms node88
theorem node89 : ArchiveDag.SmallCheck {24, 33, 88} 1 := by decide
#print axioms node89
theorem node91 : ArchiveDag.SmallCheck {42, 78, 91} 1 := by decide
#print axioms node91
theorem node92 : ArchiveDag.SmallCheck {18, 22, 99} 1 := by decide
#print axioms node92
theorem node93 : ArchiveDag.SmallCheck {40, 65, 104} 1 := by decide
#print axioms node93
theorem node94 : ArchiveDag.SmallCheck {10, 11, 110} 1 := by decide
#print axioms node94
theorem node95 : ArchiveDag.SmallCheck {36, 52, 117} 1 := by decide
#print axioms node95
theorem node96 : ArchiveDag.SmallCheck {45, 70, 126} 1 := by decide
#print axioms node96
end Node1209Small
