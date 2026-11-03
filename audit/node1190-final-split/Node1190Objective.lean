import Node1190DualData

namespace Node1190Dual
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
theorem lengths : refs.length = 530 ∧ entries.length = 530 := by decide
#print axioms lengths
theorem objective_exact : objective = 257076355 := by decide
#print axioms objective_exact
theorem objective_bound : (257000000 : ℤ) < 257076355 := by decide
#print axioms objective_bound
end Node1190Dual
