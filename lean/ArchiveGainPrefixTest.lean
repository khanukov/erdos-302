import ArchiveGainPrefix
import ArchiveLedgerSumBridge

namespace ArchiveGainPrefixTest
open ArchiveGainPrefix

def c : ArchiveLedger.Cell := ⟨2, 4, 1⟩
def sample : List ArchiveLedger.Level := [⟨3, [c, c]⟩, ⟨2, []⟩, ⟨5, [c]⟩]

-- Duplicates are occurrences, and the empty level still changes the prefix.
example : GainPrefix.entriesFrom [] (sample.map convert) =
    [([], c), ([], c), ([3, 2], c)] := by decide
example : (ArchiveLedger.totals sample).2.1 = (2 : ℚ) / 3 := by decide
example : (ArchiveLedger.totals sample).2.1 =
    ((GainPrefix.entriesFrom [] (sample.map convert)).map
      (fun e => weight (e.1.foldl update 1) e.2)).foldl (· + ·) 0 := by
  exact gain_eq_prefix sample
example : (ArchiveLedger.totals ([] : List ArchiveLedger.Level)).2.1 = 0 := by decide
example : GainPrefix.entriesFrom [] (sample.map convert) ≠
    [([], c), ([3, 2], c)] := by decide

/-- Both occurrence representations used by the two bridges agree, including
arbitrary initial prefixes and duplicated cells. -/
theorem entries_match (prior : List ℕ) (ls : List ArchiveLedger.Level) :
    (GainPrefix.entriesFrom prior (ls.map convert)).map
      (fun e => (⟨e.1, e.2⟩ : ArchiveLedgerSumBridge.Entry)) =
      ArchiveLedgerSumBridge.entriesFrom prior ls := by
  induction ls generalizing prior with
  | nil => rfl
  | cons l ls ih =>
    simp only [List.map_cons, GainPrefix.entriesFrom,
      ArchiveLedgerSumBridge.entriesFrom, List.map_append, List.map_map,
      convert, Function.comp_def, ih]

#print axioms entries_match
#print axioms gain_eq_prefix
end ArchiveGainPrefixTest
