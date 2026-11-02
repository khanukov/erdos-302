import FourUniverseCandidate

/- Compile-time ascriptions bind the audited declarations to the intended types. -/
open Erdos302CoverRowsFC Erdos302PrimeBlockFC Erdos302Reflective Erdos302ReflectiveChain

#check (Erdos302ReflectiveChain.chain_0 :
  (∀ n ≤ 500000, chainSol_0 n = predT TL_0 0 n) ∧
  ∀ n, CoverLowerBound (smoothSet {2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71} n) (chainSol_0 n))
#check (FourExternal.closed_bound_1097 : Extended.Bound FourExternal.active_1097 71)
#check (FourExternal.closed_bound_1107 : Extended.Bound FourExternal.active_1107 102)
#check (FourExternal.closed_bound_1112 : Extended.Bound FourExternal.active_1112 124)
#check (FourExternal.closed_bound_1114 : Extended.Bound FourExternal.active_1114 125)
#print axioms Erdos302ReflectiveChain.chain_0
