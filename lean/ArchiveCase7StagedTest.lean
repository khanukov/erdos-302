import ArchiveCase7Staged

/-! Check the staged bound against the literal node-7 support and demand. -/
namespace ArchiveCase7StagedTest

theorem replay_bound :
    Extended.Bound ({2, 3, 4, 5, 6, 7, 8, 10, 12, 14, 15, 16, 20, 21, 24, 28, 30} : Finset ℕ) 4 := by
  simpa [ArchiveCase7.target, ArchiveCase7.demand] using ArchiveCase7Staged.bound7

#print axioms replay_bound
end ArchiveCase7StagedTest
