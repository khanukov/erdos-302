import ShardAggregation
import ActualPrefix1024Checks16
namespace ActualPrefix1024
open ActualPrefix1024Data MixedCaseTrimCandidate
set_option maxHeartbeats 4000000 in
theorem representative : ShardAggregation.Segment (MixedDag.Check extraCheck nodes) 256 272 := by
  intro i lo hi
  interval_cases i <;> first | exact check256 | exact check257 | exact check258 | exact check259 | exact check260 | exact check261 | exact check262 | exact check263 | exact check264 | exact check265 | exact check266 | exact check267 | exact check268 | exact check269 | exact check270 | exact check271
#print axioms representative
end ActualPrefix1024
