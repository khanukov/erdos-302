import ArchiveTrim5

example : Extended.Bound ({2,3,4,5,6,8,10,12,15,20,24} : Finset ℕ) 3 :=
  ArchiveTrim5.bound5

example : Extended.Bound (ArchiveTrim5.support 4) (ArchiveTrim5.nodeDemand 4) :=
  ArchiveTrim5.sound 4 (by decide)

-- Deleting an endpoint of the (2,3,6) edge is not a valid trim.
example : ¬ (∀ a ∈ ({2,3,6} : Finset ℕ), ∀ b ∈ ({2,3,6} : Finset ℕ),
    ∀ c ∈ ({2,3,6} : Finset ℕ), UpperBridge.OrderedEdge ({2,3,6} : Finset ℕ) a b c →
      a ∈ ({2,3} : Finset ℕ) ∧ b ∈ ({2,3} : Finset ℕ) ∧ c ∈ ({2,3} : Finset ℕ)) := by
  unfold UpperBridge.OrderedEdge
  decide
