import ArchiveTrim8

/-! Check the bound against the literal node-8 support and demand. -/
namespace ArchiveTrim8Test

theorem replay_bound :
    Extended.Bound ({2, 3, 4, 5, 6, 8, 10, 12, 15, 20, 21, 24, 28, 30} : Finset ℕ) 4 := by
  simpa [ArchiveTrim8.target, ArchiveTrim8.demand] using ArchiveTrim8.bound8

#print axioms replay_bound
end ArchiveTrim8Test
