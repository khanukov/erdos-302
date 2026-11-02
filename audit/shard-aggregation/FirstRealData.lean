import MixedCaseTrimCandidate

/- Generated literals only. Archive-to-Lean correspondence is not proved. -/
namespace FirstRealData
open MixedCaseTrimCandidate
def nodes : ℕ → MixedDag.Node Payload
  | 0 => ⟨{2, 3, 6}, 1, .small⟩
  | 1 => ⟨{2, 3, 4, 6, 12}, 2, .small⟩
  | 2 => ⟨{4, 5, 20}, 1, .small⟩
  | 3 => ⟨{6, 10, 15}, 1, .small⟩
  | 4 => ⟨{2, 3, 4, 5, 6, 7, 8, 10, 12, 14, 15, 16, 20, 21, 24}, 3, .extra (.caseRule [⟨2, 1, 1⟩, ⟨3, 1, 1⟩, ⟨0, 4, 1⟩] (.dual [(({4, 5, 20}, 1), 100000000), (({6, 10, 15}, 1), 100000000), (({8, 12, 24}, 1), 100000000)] 100000000))⟩
  | 5 => ⟨{2, 3, 4, 5, 6, 8, 10, 12, 15, 20, 24}, 3, .extra (.trimRule ⟨4, 1, 1⟩)⟩
  | 6 => ⟨{12, 21, 28}, 1, .small⟩
  | 7 => ⟨{2, 3, 4, 5, 6, 7, 8, 10, 12, 14, 15, 16, 20, 21, 24, 28, 30}, 4, .extra (.caseRule [⟨0, 1, 1⟩, ⟨2, 1, 1⟩, ⟨0, 5, 1⟩, ⟨6, 1, 1⟩] (.dual [(({2, 3, 6}, 1), 100000000), (({4, 5, 20}, 1), 100000000), (({10, 15, 30}, 1), 100000000), (({12, 21, 28}, 1), 100000000)] 100000000))⟩
  | 8 => ⟨{2, 3, 4, 5, 6, 8, 10, 12, 15, 20, 21, 24, 28, 30}, 4, .extra (.trimRule ⟨7, 1, 1⟩)⟩
  | _ => ⟨∅, 0, .small⟩
end FirstRealData
