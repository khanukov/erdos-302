import LedgerChecker

namespace ArchiveLedger
example : ordered 1 [] = true := by decide
example : ordered 1 [⟨1, 2, 3⟩, ⟨2, 4, 1⟩] = true := by decide
example : ordered 1 [⟨1, 3, 1⟩, ⟨2, 4, 1⟩] = false := by decide
example : ordered 1 [⟨1, 2, 0⟩] = false := by decide
example : ordered 1 [⟨1, 500002, 1⟩] = false := by decide
example : check [] = false := by decide
end ArchiveLedger
