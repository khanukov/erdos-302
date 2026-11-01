import Pack1094

-- Expensive kernel-reduction test of the entire extracted fourth pack node.
-- This does not establish the source row bounds or archive-to-Lean translation.
set_option maxRecDepth 65536 in
set_option maxHeartbeats 0 in
theorem ArchivePack1094.valid : ArchivePack.Valid ArchivePack1094.indices
    ArchivePack1094.T ArchivePack1094.w ArchivePack1094.r 1000 217
    ArchivePack1094.support := by
  unfold ArchivePack.Valid
  decide

#print axioms ArchivePack1094.valid
