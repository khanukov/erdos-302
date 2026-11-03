import Shard000_004
import Shard004_005
import Shard005_006
import Shard006_007
import Shard007_008
import Shard008_009
import Shard009_014
import Shard014_015
import Shard015_016
import Shard016_032
import Shard032_048
import Shard048_064
import Shard064_080
import Shard080_096
import Shard096_112
import Shard112_128
import Shard128_144
import Shard144_160
import Shard160_176
import Shard176_192
import Shard192_208
import Shard208_224
import Shard224_240
import Shard240_256
import Shard256_272
import Shard272_288
import Shard288_304
import Shard304_320
import Shard320_336
import Shard336_337
import Node1209SourceCandidate

/- Candidate only: the proofs below have not been kernel checked.
   Python archive correspondence is external to Lean. -/
namespace Node1190Min
set_option maxRecDepth 100000
set_option maxHeartbeats 100000000
theorem valid : ∀ i < 337, MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := by
  intro i hi
  by_cases h4 : i < 4
  · exact Shard000_004 i (by omega) h4
  by_cases h5 : i < 5
  · exact Shard004_005 i (by omega) h5
  by_cases h6 : i < 6
  · exact Shard005_006 i (by omega) h6
  by_cases h7 : i < 7
  · exact Shard006_007 i (by omega) h7
  by_cases h8 : i < 8
  · exact Shard007_008 i (by omega) h8
  by_cases h9 : i < 9
  · exact Shard008_009 i (by omega) h9
  by_cases h14 : i < 14
  · exact Shard009_014 i (by omega) h14
  by_cases h15 : i < 15
  · exact Shard014_015 i (by omega) h15
  by_cases h16 : i < 16
  · exact Shard015_016 i (by omega) h16
  by_cases h32 : i < 32
  · exact Shard016_032 i (by omega) h32
  by_cases h48 : i < 48
  · exact Shard032_048 i (by omega) h48
  by_cases h64 : i < 64
  · exact Shard048_064 i (by omega) h64
  by_cases h80 : i < 80
  · exact Shard064_080 i (by omega) h80
  by_cases h96 : i < 96
  · exact Shard080_096 i (by omega) h96
  by_cases h112 : i < 112
  · exact Shard096_112 i (by omega) h112
  by_cases h128 : i < 128
  · exact Shard112_128 i (by omega) h128
  by_cases h144 : i < 144
  · exact Shard128_144 i (by omega) h144
  by_cases h160 : i < 160
  · exact Shard144_160 i (by omega) h160
  by_cases h176 : i < 176
  · exact Shard160_176 i (by omega) h176
  by_cases h192 : i < 192
  · exact Shard176_192 i (by omega) h192
  by_cases h208 : i < 208
  · exact Shard192_208 i (by omega) h208
  by_cases h224 : i < 224
  · exact Shard208_224 i (by omega) h224
  by_cases h240 : i < 240
  · exact Shard224_240 i (by omega) h240
  by_cases h256 : i < 256
  · exact Shard240_256 i (by omega) h256
  by_cases h272 : i < 272
  · exact Shard256_272 i (by omega) h272
  by_cases h288 : i < 288
  · exact Shard272_288 i (by omega) h288
  by_cases h304 : i < 304
  · exact Shard288_304 i (by omega) h304
  by_cases h320 : i < 320
  · exact Shard304_320 i (by omega) h320
  by_cases h336 : i < 336
  · exact Shard320_336 i (by omega) h336
  exact Shard336_337 i (by omega) hi
theorem source_subset : (Node1209Dense.nodes 336).support ⊆ Node1209SourceCandidate.node.support := by
  decide
theorem source_bound : Extended.Bound ExtensionFirstArchive.source 258 := by
  have hb := MixedCaseTrimCandidate.sound Node1209Dense.nodes 337 valid 336 (by decide)
  have ht := Extended.bound_mono source_subset hb
  change Extended.Bound Node1209SourceCandidate.node.support Node1209SourceCandidate.node.demand at ht
  rw [Node1209SourceCandidate.support_identity, Node1209SourceCandidate.demand_identity] at ht
  exact ht
#print axioms valid
#print axioms source_subset
#print axioms source_bound
end Node1190Min
