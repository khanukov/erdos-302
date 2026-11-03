import ActualSparse64.All

/-! The boundary is kernel-checked by ActualSparse64. The 258 source demand
is a separate obligation: it is not supplied by the boundary or by Python replay.
The DAG specialization below exposes both the checker and exact node identity. -/
namespace FirstExtensionBridge
open Finset

set_option maxRecDepth 100000
set_option maxHeartbeats 40000000

/-- The actual first target, conditional only on its actual source bound. -/
theorem target_bound (hsource : Extended.Bound ExtensionFirstArchive.source 258) :
    Extended.Bound ExtensionFirstArchive.target 242 := by
  have h := ExtensionSeedCandidate.seed hsource ActualSparse64.boundary
    (Finset.Subset.rfl : ExtensionFirstArchive.target ⊆ ExtensionFirstArchive.target)
  simpa [ExtensionFirstArchive.firstDelete] using h

/-- Restriction to any genuine subset of the actual target. -/
theorem target_restrict (P : Finset ℕ) (hP : P ⊆ ExtensionFirstArchive.target)
    (hsource : Extended.Bound ExtensionFirstArchive.source 258) :
    Extended.Bound P (242 - (ExtensionFirstArchive.target \ P).card) :=
  BankProfile.restrict_bound hP (target_bound hsource)

/-- A checked DAG can discharge the source obligation, but only when its node
has the actual support and demand; neither equality is archive authentication. -/
theorem target_of_checked_node (nodes : ℕ → ArchiveDag.Node) (count j : ℕ)
    (valid : ∀ i < count, ArchiveDag.Check nodes i) (hj : j < count)
    (hs : (nodes j).support = ExtensionFirstArchive.source)
    (hd : (nodes j).demand = 258) :
    Extended.Bound ExtensionFirstArchive.target 242 := by
  apply target_bound
  have h := ArchiveDag.sound nodes count valid j hj
  simpa only [hs, hd] using h

#print axioms target_bound
#print axioms target_restrict
#print axioms target_of_checked_node
end FirstExtensionBridge
