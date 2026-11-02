import ArchiveSmallPrefix

-- Each positive check is exercised separately, not merely inferred from a count.
example : ArchiveDag.Check ArchiveSmallPrefix.nodes 0 := ArchiveSmallPrefix.valid 0 (by decide)
example : ArchiveDag.Check ArchiveSmallPrefix.nodes 1 := ArchiveSmallPrefix.valid 1 (by decide)
example : ArchiveDag.Check ArchiveSmallPrefix.nodes 2 := ArchiveSmallPrefix.valid 2 (by decide)
example : ArchiveDag.Check ArchiveSmallPrefix.nodes 3 := ArchiveSmallPrefix.valid 3 (by decide)

-- The first support cannot satisfy an inflated demand.
example : ¬ ArchiveDag.Check (fun _ => ⟨{2, 3, 6}, 2, .small⟩) 0 := by decide
