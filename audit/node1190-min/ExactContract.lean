import Candidate

namespace Node1190Min
example : MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 336 := Node1190Dual.singleton_check
example : ∀ i, 0 ≤ i → i < 4 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := Shard000_004
example : ∀ i, 4 ≤ i → i < 5 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := Shard004_005
example : ∀ i, 5 ≤ i → i < 6 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := Shard005_006
example : ∀ i, 6 ≤ i → i < 7 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := Shard006_007
example : ∀ i, 7 ≤ i → i < 8 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := Shard007_008
example : ∀ i, 8 ≤ i → i < 9 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := Shard008_009
example : ∀ i, 9 ≤ i → i < 14 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := Shard009_014
example : ∀ i, 14 ≤ i → i < 15 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := Shard014_015
example : ∀ i, 15 ≤ i → i < 16 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := Shard015_016
example : ∀ i, 16 ≤ i → i < 32 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := Shard016_032
example : ∀ i, 32 ≤ i → i < 48 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := Shard032_048
example : ∀ i, 48 ≤ i → i < 64 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := Shard048_064
example : ∀ i, 64 ≤ i → i < 80 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := Shard064_080
example : ∀ i, 80 ≤ i → i < 96 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := Shard080_096
example : ∀ i, 96 ≤ i → i < 112 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := Shard096_112
example : ∀ i, 112 ≤ i → i < 128 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := Shard112_128
example : ∀ i, 128 ≤ i → i < 144 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := Shard128_144
example : ∀ i, 144 ≤ i → i < 160 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := Shard144_160
example : ∀ i, 160 ≤ i → i < 176 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := Shard160_176
example : ∀ i, 176 ≤ i → i < 192 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := Shard176_192
example : ∀ i, 192 ≤ i → i < 208 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := Shard192_208
example : ∀ i, 208 ≤ i → i < 224 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := Shard208_224
example : ∀ i, 224 ≤ i → i < 240 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := Shard224_240
example : ∀ i, 240 ≤ i → i < 256 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := Shard240_256
example : ∀ i, 256 ≤ i → i < 272 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := Shard256_272
example : ∀ i, 272 ≤ i → i < 276 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := Shard272_276
example : ∀ i, 276 ≤ i → i < 280 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := Shard276_280
example : ∀ i, 280 ≤ i → i < 284 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := Shard280_284
example : ∀ i, 284 ≤ i → i < 288 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := Shard284_288
example : ∀ i, 288 ≤ i → i < 304 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := Shard288_304
example : ∀ i, 304 ≤ i → i < 320 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := Shard304_320
example : ∀ i, 320 ≤ i → i < 336 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := Shard320_336
example : ∀ i, 336 ≤ i → i < 337 → MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := Shard336_337
example : ∀ i < 337, MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i := valid
example : (Node1209Dense.nodes 336).support ⊆ Node1209SourceCandidate.node.support := source_subset
example : Extended.Bound ExtensionFirstArchive.source 258 := source_bound
end Node1190Min
