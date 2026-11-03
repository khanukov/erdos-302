import FirstExtensionBridge

-- Exact semantic contracts: no hidden premise on the checked boundary.
example : ExtensionSeedCandidate.Boundary ExtensionFirstArchive.source
    ExtensionFirstArchive.target ExtensionFirstArchive.firstDelete :=
  ActualSparse64.boundary

example : Extended.Bound ExtensionFirstArchive.source 258 →
    Extended.Bound ExtensionFirstArchive.target 242 :=
  FirstExtensionBridge.target_bound

example (nodes : ℕ → ArchiveDag.Node) (count j : ℕ)
    (valid : ∀ i < count, ArchiveDag.Check nodes i) (hj : j < count)
    (hs : (nodes j).support = ExtensionFirstArchive.source)
    (hd : (nodes j).demand = 258) :
    Extended.Bound ExtensionFirstArchive.target 242 :=
  FirstExtensionBridge.target_of_checked_node nodes count j valid hj hs hd

#print axioms ActualSparse64.boundary
#print axioms FirstExtensionBridge.target_bound
#print axioms FirstExtensionBridge.target_restrict
#print axioms FirstExtensionBridge.target_of_checked_node
#print FirstExtensionBridge.target_of_checked_node
