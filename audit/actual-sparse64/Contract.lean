import ActualSparse64.All

-- This elaboration fails if the named result requires any additional premise.
example : ExtensionSeedCandidate.Boundary ExtensionFirstArchive.source
    ExtensionFirstArchive.target ExtensionFirstArchive.firstDelete :=
  ActualSparse64.boundary
#print axioms ActualSparse64.boundary
#print ActualSparse64.boundary
