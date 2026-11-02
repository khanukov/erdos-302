import ActualPrefix32Checks0
import ActualPrefix32Checks1
import ActualPrefix32Checks2

namespace ActualPrefix32
open ActualPrefix32Data MixedCaseTrimCandidate
theorem checked : ∀ i < 32, MixedDag.Check extraCheck nodes i := by
  intro i hi
  interval_cases i <;> first | exact check0 | exact check1 | exact check2 | exact check3 | exact check4 | exact check5 | exact check6 | exact check7 | exact check8 | exact check9 | exact check10 | exact check11 | exact check12 | exact check13 | exact check14 | exact check15 | exact check16 | exact check17 | exact check18 | exact check19 | exact check20 | exact check21 | exact check22 | exact check23 | exact check24 | exact check25 | exact check26 | exact check27 | exact check28 | exact check29 | exact check30 | exact check31
theorem sound : ∀ i < 32, Extended.Bound (nodes i).support (nodes i).demand :=
  MixedCaseTrimCandidate.sound nodes 32 checked
#print axioms checked
#print axioms sound
end ActualPrefix32
