import ExtensionBoundaryShard00
import ExtensionBoundaryShard01
import ExtensionBoundaryShard02
import ExtensionBoundaryShard03
import ExtensionBoundaryShard04
import ExtensionBoundaryShard05
import ExtensionBoundaryShard06
import ExtensionBoundaryShard07
import ExtensionBoundaryShard08
import ExtensionBoundaryShard09
import ExtensionBoundaryShard10
import ExtensionBoundaryShard11
import ExtensionBoundaryShard12
import ExtensionBoundaryShard13
import ExtensionBoundaryShard14
import ExtensionBoundaryShard15
import ExtensionBoundaryShard16
import ExtensionBoundaryShard17
import ExtensionBoundaryShard18
import ExtensionBoundaryShard19

namespace ExtensionFirstArchive
open Finset ExtensionSeedCandidate

set_option maxRecDepth 100000 in
set_option maxHeartbeats 100000000 in
 theorem source_lt : ∀ b ∈ source, b < 1901 := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 100000000 in
 theorem checked_pair_boundary : PairBoundary source target firstDelete := by
  refine ⟨?_, ?_, ?_⟩
  · decide
  · decide
  intro b hb c hc hbc
  have hbmax := source_lt b hb
  by_cases h0 : b < 100
  · exact shard00 b (Finset.mem_filter.mpr ⟨hb, by omega⟩) c hc hbc
  ·
    by_cases h1 : b < 200
    · exact shard01 b (Finset.mem_filter.mpr ⟨hb, by omega⟩) c hc hbc
    ·
      by_cases h2 : b < 300
      · exact shard02 b (Finset.mem_filter.mpr ⟨hb, by omega⟩) c hc hbc
      ·
        by_cases h3 : b < 400
        · exact shard03 b (Finset.mem_filter.mpr ⟨hb, by omega⟩) c hc hbc
        ·
          by_cases h4 : b < 500
          · exact shard04 b (Finset.mem_filter.mpr ⟨hb, by omega⟩) c hc hbc
          ·
            by_cases h5 : b < 600
            · exact shard05 b (Finset.mem_filter.mpr ⟨hb, by omega⟩) c hc hbc
            ·
              by_cases h6 : b < 700
              · exact shard06 b (Finset.mem_filter.mpr ⟨hb, by omega⟩) c hc hbc
              ·
                by_cases h7 : b < 800
                · exact shard07 b (Finset.mem_filter.mpr ⟨hb, by omega⟩) c hc hbc
                ·
                  by_cases h8 : b < 900
                  · exact shard08 b (Finset.mem_filter.mpr ⟨hb, by omega⟩) c hc hbc
                  ·
                    by_cases h9 : b < 1000
                    · exact shard09 b (Finset.mem_filter.mpr ⟨hb, by omega⟩) c hc hbc
                    ·
                      by_cases h10 : b < 1100
                      · exact shard10 b (Finset.mem_filter.mpr ⟨hb, by omega⟩) c hc hbc
                      ·
                        by_cases h11 : b < 1200
                        · exact shard11 b (Finset.mem_filter.mpr ⟨hb, by omega⟩) c hc hbc
                        ·
                          by_cases h12 : b < 1300
                          · exact shard12 b (Finset.mem_filter.mpr ⟨hb, by omega⟩) c hc hbc
                          ·
                            by_cases h13 : b < 1400
                            · exact shard13 b (Finset.mem_filter.mpr ⟨hb, by omega⟩) c hc hbc
                            ·
                              by_cases h14 : b < 1500
                              · exact shard14 b (Finset.mem_filter.mpr ⟨hb, by omega⟩) c hc hbc
                              ·
                                by_cases h15 : b < 1600
                                · exact shard15 b (Finset.mem_filter.mpr ⟨hb, by omega⟩) c hc hbc
                                ·
                                  by_cases h16 : b < 1700
                                  · exact shard16 b (Finset.mem_filter.mpr ⟨hb, by omega⟩) c hc hbc
                                  ·
                                    by_cases h17 : b < 1800
                                    · exact shard17 b (Finset.mem_filter.mpr ⟨hb, by omega⟩) c hc hbc
                                    ·
                                      by_cases h18 : b < 1900
                                      · exact shard18 b (Finset.mem_filter.mpr ⟨hb, by omega⟩) c hc hbc
                                      ·
                                        exact shard19 b (Finset.mem_filter.mpr ⟨hb, by omega⟩) c hc hbc

theorem checked_boundary : Boundary source target firstDelete :=
  pair_boundary_sound checked_pair_boundary

theorem source_to_seed (hb : Extended.Bound source 258) :
    Extended.Bound target 242 := by
  have h := seed hb checked_boundary (Finset.Subset.rfl : target ⊆ target)
  simpa [firstDelete] using h

theorem projected_seed (P : Finset ℕ) (hp : P ⊆ target)
    (hb : Extended.Bound source 258) :
    Extended.Bound P (242 - (target \ P).card) :=
  BankProfile.restrict_bound hp (source_to_seed hb)

#print axioms source_lt
#print axioms checked_pair_boundary
#print axioms checked_boundary
#print axioms source_to_seed
#print axioms projected_seed
end ExtensionFirstArchive
