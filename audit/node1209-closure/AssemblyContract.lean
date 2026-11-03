import AssemblyCandidate

/- These contracts expose every remaining assumption; they do not discharge any. -/
namespace Node1209AssemblyContract
set_option maxRecDepth 100000
set_option maxHeartbeats 100000000

abbrev Check (i : ℕ) := MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i

example : Check 4 → Check 5 → Check 7 → Check 8 → Check 14 → Check 15 →
    Check 374 → Check 375 → (∀ i < 376, Check i) :=
  Node1209AssemblyCandidate.valid

example : Check 4 → Check 5 → Check 7 → Check 8 → Check 14 → Check 15 →
    Check 374 → Check 375 → Extended.Bound ExtensionFirstArchive.source 258 :=
  Node1209AssemblyCandidate.source_bound

example : Check 4 → Check 5 → Check 7 → Check 8 → Check 14 → Check 15 →
    Check 374 → Check 375 → Extended.Bound ExtensionFirstArchive.target 242 :=
  Node1209AssemblyCandidate.target_bound
end Node1209AssemblyContract
