import ArchiveErrorMatchCandidate

namespace ArchiveErrorMatchCandidateTests
open ArchiveLedgerSumBridge ArchiveErrorMatchCandidate

def c : ArchiveLedger.Cell := ⟨2, 4, 1⟩
def sample : List ArchiveLedger.Level := [⟨3, [c, c]⟩, ⟨2, []⟩, ⟨5, [c]⟩]

-- Two equal cells count separately; an empty level still doubles the weight.
example : ((entriesFrom [] sample).map contribution).sum = 12 := by decide
example : (ArchiveLedger.error sample) = 12 := by decide
example : ((entriesFrom [] sample).map contribution).sum ≠ 10 := by decide
example : ((entriesFrom [7] ([] : List ArchiveLedger.Level)).map contribution).sum = 0 := by decide
example : ((entriesFrom [] sample).map contribution).sum =
    (sample.foldl ArchiveLedger.step (1, 0, 0, 2)).2.2.1 := by
  simpa using entries_error [] sample
example : ArchiveSummation.weightedError Finset.univ cellHeight
    (fun i => (2 : ℝ) ^ cellExponent i) = 55064831540 := indexed_error

#print axioms ArchiveErrorMatchCandidate.entries_error
#print axioms ArchiveErrorMatchCandidate.occurrence_error
#print axioms ArchiveErrorMatchCandidate.indexed_error
end ArchiveErrorMatchCandidateTests
