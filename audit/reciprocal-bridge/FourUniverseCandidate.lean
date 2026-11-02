import FourEdgeAssemblyCandidate

/- UNCHECKED CANDIDATE. Archive-to-literal correspondence remains external. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 80000000
namespace FourExternal
open UpperBridge Erdos302PrimeBlockFC Erdos302FinitePrimeDecompositionFC

def boundedSupported (x : ℕ) : Prop :=
  ∀ p ∈ Finset.Icc 1 x, p.Prime → p ∣ x → p ∈ P

instance (x : ℕ) : Decidable (boundedSupported x) := by
  unfold boundedSupported
  infer_instance

theorem supported_iff_bounded {x : ℕ} (hx : 0 < x) :
    PrimeSupported P x ↔ boundedSupported x := by
  constructor
  · intro h p hp hprime hdvd
    exact h p hprime hdvd
  · intro h p hprime hdvd
    exact h p (Finset.mem_Icc.mpr ⟨hprime.pos, Nat.le_of_dvd hx hdvd⟩) hprime hdvd

theorem mem_U_iff (n x : ℕ) :
    x ∈ U n ↔ x ∈ Finset.Icc 1 n ∧ boundedSupported x := by
  classical
  change x ∈ smoothSet P n ↔ _
  simp only [smoothSet, Finset.mem_filter]
  constructor
  · rintro ⟨hx, hs⟩
    exact ⟨hx, (supported_iff_bounded (Finset.mem_Icc.mp hx).1).mp hs⟩
  · rintro ⟨hx, hs⟩
    exact ⟨hx, (supported_iff_bounded (Finset.mem_Icc.mp hx).1).mpr hs⟩

theorem universe_part_1097_1_32 :
    ∀ x ∈ Finset.Icc 1 32, (x ∈ universe_1097 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1097_33_64 :
    ∀ x ∈ Finset.Icc 33 64, (x ∈ universe_1097 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1097_65_96 :
    ∀ x ∈ Finset.Icc 65 96, (x ∈ universe_1097 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1097_97_128 :
    ∀ x ∈ Finset.Icc 97 128, (x ∈ universe_1097 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1097_129_160 :
    ∀ x ∈ Finset.Icc 129 160, (x ∈ universe_1097 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1097_161_192 :
    ∀ x ∈ Finset.Icc 161 192, (x ∈ universe_1097 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1097_193_224 :
    ∀ x ∈ Finset.Icc 193 224, (x ∈ universe_1097 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1097_225_256 :
    ∀ x ∈ Finset.Icc 225 256, (x ∈ universe_1097 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1097_257_288 :
    ∀ x ∈ Finset.Icc 257 288, (x ∈ universe_1097 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1097_289_320 :
    ∀ x ∈ Finset.Icc 289 320, (x ∈ universe_1097 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1097_321_352 :
    ∀ x ∈ Finset.Icc 321 352, (x ∈ universe_1097 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1097_353_384 :
    ∀ x ∈ Finset.Icc 353 384, (x ∈ universe_1097 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1097_385_416 :
    ∀ x ∈ Finset.Icc 385 416, (x ∈ universe_1097 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1097_417_420 :
    ∀ x ∈ Finset.Icc 417 420, (x ∈ universe_1097 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_range_1097 : ∀ x ∈ universe_1097, x ∈ Finset.Icc 1 420 := by
  decide +kernel

theorem universe_eq_1097 : U 420 = universe_1097 := by
  ext x
  rw [mem_U_iff]
  constructor
  · rintro ⟨hx, hs⟩
    have ranges :
      x ∈ Finset.Icc 1 32 ∨
      x ∈ Finset.Icc 33 64 ∨
      x ∈ Finset.Icc 65 96 ∨
      x ∈ Finset.Icc 97 128 ∨
      x ∈ Finset.Icc 129 160 ∨
      x ∈ Finset.Icc 161 192 ∨
      x ∈ Finset.Icc 193 224 ∨
      x ∈ Finset.Icc 225 256 ∨
      x ∈ Finset.Icc 257 288 ∨
      x ∈ Finset.Icc 289 320 ∨
      x ∈ Finset.Icc 321 352 ∨
      x ∈ Finset.Icc 353 384 ∨
      x ∈ Finset.Icc 385 416 ∨
      x ∈ Finset.Icc 417 420 := by
      simp only [Finset.mem_Icc] at hx ⊢
      omega
    rcases ranges with h0 | h1 | h2 | h3 | h4 | h5 | h6 | h7 | h8 | h9 | h10 | h11 | h12 | h13
    · exact (universe_part_1097_1_32 x h0).mpr hs
    · exact (universe_part_1097_33_64 x h1).mpr hs
    · exact (universe_part_1097_65_96 x h2).mpr hs
    · exact (universe_part_1097_97_128 x h3).mpr hs
    · exact (universe_part_1097_129_160 x h4).mpr hs
    · exact (universe_part_1097_161_192 x h5).mpr hs
    · exact (universe_part_1097_193_224 x h6).mpr hs
    · exact (universe_part_1097_225_256 x h7).mpr hs
    · exact (universe_part_1097_257_288 x h8).mpr hs
    · exact (universe_part_1097_289_320 x h9).mpr hs
    · exact (universe_part_1097_321_352 x h10).mpr hs
    · exact (universe_part_1097_353_384 x h11).mpr hs
    · exact (universe_part_1097_385_416 x h12).mpr hs
    · exact (universe_part_1097_417_420 x h13).mpr hs
  · intro hx
    have hr := universe_range_1097 x hx
    refine ⟨hr, ?_⟩
    have ranges :
      x ∈ Finset.Icc 1 32 ∨
      x ∈ Finset.Icc 33 64 ∨
      x ∈ Finset.Icc 65 96 ∨
      x ∈ Finset.Icc 97 128 ∨
      x ∈ Finset.Icc 129 160 ∨
      x ∈ Finset.Icc 161 192 ∨
      x ∈ Finset.Icc 193 224 ∨
      x ∈ Finset.Icc 225 256 ∨
      x ∈ Finset.Icc 257 288 ∨
      x ∈ Finset.Icc 289 320 ∨
      x ∈ Finset.Icc 321 352 ∨
      x ∈ Finset.Icc 353 384 ∨
      x ∈ Finset.Icc 385 416 ∨
      x ∈ Finset.Icc 417 420 := by
      simp only [Finset.mem_Icc] at hr ⊢
      omega
    rcases ranges with h0 | h1 | h2 | h3 | h4 | h5 | h6 | h7 | h8 | h9 | h10 | h11 | h12 | h13
    · exact (universe_part_1097_1_32 x h0).mp hx
    · exact (universe_part_1097_33_64 x h1).mp hx
    · exact (universe_part_1097_65_96 x h2).mp hx
    · exact (universe_part_1097_97_128 x h3).mp hx
    · exact (universe_part_1097_129_160 x h4).mp hx
    · exact (universe_part_1097_161_192 x h5).mp hx
    · exact (universe_part_1097_193_224 x h6).mp hx
    · exact (universe_part_1097_225_256 x h7).mp hx
    · exact (universe_part_1097_257_288 x h8).mp hx
    · exact (universe_part_1097_289_320 x h9).mp hx
    · exact (universe_part_1097_321_352 x h10).mp hx
    · exact (universe_part_1097_353_384 x h11).mp hx
    · exact (universe_part_1097_385_416 x h12).mp hx
    · exact (universe_part_1097_417_420 x h13).mp hx

theorem closed_bound_1097 : Extended.Bound active_1097 71 :=
  bound_retained_1097 universe_eq_1097

#print axioms universe_eq_1097
#print axioms closed_bound_1097

theorem universe_part_1107_1_32 :
    ∀ x ∈ Finset.Icc 1 32, (x ∈ universe_1107 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1107_33_64 :
    ∀ x ∈ Finset.Icc 33 64, (x ∈ universe_1107 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1107_65_96 :
    ∀ x ∈ Finset.Icc 65 96, (x ∈ universe_1107 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1107_97_128 :
    ∀ x ∈ Finset.Icc 97 128, (x ∈ universe_1107 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1107_129_160 :
    ∀ x ∈ Finset.Icc 129 160, (x ∈ universe_1107 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1107_161_192 :
    ∀ x ∈ Finset.Icc 161 192, (x ∈ universe_1107 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1107_193_224 :
    ∀ x ∈ Finset.Icc 193 224, (x ∈ universe_1107 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1107_225_256 :
    ∀ x ∈ Finset.Icc 225 256, (x ∈ universe_1107 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1107_257_288 :
    ∀ x ∈ Finset.Icc 257 288, (x ∈ universe_1107 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1107_289_320 :
    ∀ x ∈ Finset.Icc 289 320, (x ∈ universe_1107 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1107_321_352 :
    ∀ x ∈ Finset.Icc 321 352, (x ∈ universe_1107 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1107_353_384 :
    ∀ x ∈ Finset.Icc 353 384, (x ∈ universe_1107 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1107_385_416 :
    ∀ x ∈ Finset.Icc 385 416, (x ∈ universe_1107 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1107_417_448 :
    ∀ x ∈ Finset.Icc 417 448, (x ∈ universe_1107 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1107_449_480 :
    ∀ x ∈ Finset.Icc 449 480, (x ∈ universe_1107 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1107_481_512 :
    ∀ x ∈ Finset.Icc 481 512, (x ∈ universe_1107 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1107_513_544 :
    ∀ x ∈ Finset.Icc 513 544, (x ∈ universe_1107 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1107_545_576 :
    ∀ x ∈ Finset.Icc 545 576, (x ∈ universe_1107 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1107_577_608 :
    ∀ x ∈ Finset.Icc 577 608, (x ∈ universe_1107 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1107_609_640 :
    ∀ x ∈ Finset.Icc 609 640, (x ∈ universe_1107 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1107_641_644 :
    ∀ x ∈ Finset.Icc 641 644, (x ∈ universe_1107 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_range_1107 : ∀ x ∈ universe_1107, x ∈ Finset.Icc 1 644 := by
  decide +kernel

theorem universe_eq_1107 : U 644 = universe_1107 := by
  ext x
  rw [mem_U_iff]
  constructor
  · rintro ⟨hx, hs⟩
    have ranges :
      x ∈ Finset.Icc 1 32 ∨
      x ∈ Finset.Icc 33 64 ∨
      x ∈ Finset.Icc 65 96 ∨
      x ∈ Finset.Icc 97 128 ∨
      x ∈ Finset.Icc 129 160 ∨
      x ∈ Finset.Icc 161 192 ∨
      x ∈ Finset.Icc 193 224 ∨
      x ∈ Finset.Icc 225 256 ∨
      x ∈ Finset.Icc 257 288 ∨
      x ∈ Finset.Icc 289 320 ∨
      x ∈ Finset.Icc 321 352 ∨
      x ∈ Finset.Icc 353 384 ∨
      x ∈ Finset.Icc 385 416 ∨
      x ∈ Finset.Icc 417 448 ∨
      x ∈ Finset.Icc 449 480 ∨
      x ∈ Finset.Icc 481 512 ∨
      x ∈ Finset.Icc 513 544 ∨
      x ∈ Finset.Icc 545 576 ∨
      x ∈ Finset.Icc 577 608 ∨
      x ∈ Finset.Icc 609 640 ∨
      x ∈ Finset.Icc 641 644 := by
      simp only [Finset.mem_Icc] at hx ⊢
      omega
    rcases ranges with h0 | h1 | h2 | h3 | h4 | h5 | h6 | h7 | h8 | h9 | h10 | h11 | h12 | h13 | h14 | h15 | h16 | h17 | h18 | h19 | h20
    · exact (universe_part_1107_1_32 x h0).mpr hs
    · exact (universe_part_1107_33_64 x h1).mpr hs
    · exact (universe_part_1107_65_96 x h2).mpr hs
    · exact (universe_part_1107_97_128 x h3).mpr hs
    · exact (universe_part_1107_129_160 x h4).mpr hs
    · exact (universe_part_1107_161_192 x h5).mpr hs
    · exact (universe_part_1107_193_224 x h6).mpr hs
    · exact (universe_part_1107_225_256 x h7).mpr hs
    · exact (universe_part_1107_257_288 x h8).mpr hs
    · exact (universe_part_1107_289_320 x h9).mpr hs
    · exact (universe_part_1107_321_352 x h10).mpr hs
    · exact (universe_part_1107_353_384 x h11).mpr hs
    · exact (universe_part_1107_385_416 x h12).mpr hs
    · exact (universe_part_1107_417_448 x h13).mpr hs
    · exact (universe_part_1107_449_480 x h14).mpr hs
    · exact (universe_part_1107_481_512 x h15).mpr hs
    · exact (universe_part_1107_513_544 x h16).mpr hs
    · exact (universe_part_1107_545_576 x h17).mpr hs
    · exact (universe_part_1107_577_608 x h18).mpr hs
    · exact (universe_part_1107_609_640 x h19).mpr hs
    · exact (universe_part_1107_641_644 x h20).mpr hs
  · intro hx
    have hr := universe_range_1107 x hx
    refine ⟨hr, ?_⟩
    have ranges :
      x ∈ Finset.Icc 1 32 ∨
      x ∈ Finset.Icc 33 64 ∨
      x ∈ Finset.Icc 65 96 ∨
      x ∈ Finset.Icc 97 128 ∨
      x ∈ Finset.Icc 129 160 ∨
      x ∈ Finset.Icc 161 192 ∨
      x ∈ Finset.Icc 193 224 ∨
      x ∈ Finset.Icc 225 256 ∨
      x ∈ Finset.Icc 257 288 ∨
      x ∈ Finset.Icc 289 320 ∨
      x ∈ Finset.Icc 321 352 ∨
      x ∈ Finset.Icc 353 384 ∨
      x ∈ Finset.Icc 385 416 ∨
      x ∈ Finset.Icc 417 448 ∨
      x ∈ Finset.Icc 449 480 ∨
      x ∈ Finset.Icc 481 512 ∨
      x ∈ Finset.Icc 513 544 ∨
      x ∈ Finset.Icc 545 576 ∨
      x ∈ Finset.Icc 577 608 ∨
      x ∈ Finset.Icc 609 640 ∨
      x ∈ Finset.Icc 641 644 := by
      simp only [Finset.mem_Icc] at hr ⊢
      omega
    rcases ranges with h0 | h1 | h2 | h3 | h4 | h5 | h6 | h7 | h8 | h9 | h10 | h11 | h12 | h13 | h14 | h15 | h16 | h17 | h18 | h19 | h20
    · exact (universe_part_1107_1_32 x h0).mp hx
    · exact (universe_part_1107_33_64 x h1).mp hx
    · exact (universe_part_1107_65_96 x h2).mp hx
    · exact (universe_part_1107_97_128 x h3).mp hx
    · exact (universe_part_1107_129_160 x h4).mp hx
    · exact (universe_part_1107_161_192 x h5).mp hx
    · exact (universe_part_1107_193_224 x h6).mp hx
    · exact (universe_part_1107_225_256 x h7).mp hx
    · exact (universe_part_1107_257_288 x h8).mp hx
    · exact (universe_part_1107_289_320 x h9).mp hx
    · exact (universe_part_1107_321_352 x h10).mp hx
    · exact (universe_part_1107_353_384 x h11).mp hx
    · exact (universe_part_1107_385_416 x h12).mp hx
    · exact (universe_part_1107_417_448 x h13).mp hx
    · exact (universe_part_1107_449_480 x h14).mp hx
    · exact (universe_part_1107_481_512 x h15).mp hx
    · exact (universe_part_1107_513_544 x h16).mp hx
    · exact (universe_part_1107_545_576 x h17).mp hx
    · exact (universe_part_1107_577_608 x h18).mp hx
    · exact (universe_part_1107_609_640 x h19).mp hx
    · exact (universe_part_1107_641_644 x h20).mp hx

theorem closed_bound_1107 : Extended.Bound active_1107 102 :=
  bound_retained_1107 universe_eq_1107

#print axioms universe_eq_1107
#print axioms closed_bound_1107

theorem universe_part_1112_1_32 :
    ∀ x ∈ Finset.Icc 1 32, (x ∈ universe_1112 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1112_33_64 :
    ∀ x ∈ Finset.Icc 33 64, (x ∈ universe_1112 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1112_65_96 :
    ∀ x ∈ Finset.Icc 65 96, (x ∈ universe_1112 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1112_97_128 :
    ∀ x ∈ Finset.Icc 97 128, (x ∈ universe_1112 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1112_129_160 :
    ∀ x ∈ Finset.Icc 129 160, (x ∈ universe_1112 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1112_161_192 :
    ∀ x ∈ Finset.Icc 161 192, (x ∈ universe_1112 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1112_193_224 :
    ∀ x ∈ Finset.Icc 193 224, (x ∈ universe_1112 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1112_225_256 :
    ∀ x ∈ Finset.Icc 225 256, (x ∈ universe_1112 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1112_257_288 :
    ∀ x ∈ Finset.Icc 257 288, (x ∈ universe_1112 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1112_289_320 :
    ∀ x ∈ Finset.Icc 289 320, (x ∈ universe_1112 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1112_321_352 :
    ∀ x ∈ Finset.Icc 321 352, (x ∈ universe_1112 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1112_353_384 :
    ∀ x ∈ Finset.Icc 353 384, (x ∈ universe_1112 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1112_385_416 :
    ∀ x ∈ Finset.Icc 385 416, (x ∈ universe_1112 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1112_417_448 :
    ∀ x ∈ Finset.Icc 417 448, (x ∈ universe_1112 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1112_449_480 :
    ∀ x ∈ Finset.Icc 449 480, (x ∈ universe_1112 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1112_481_512 :
    ∀ x ∈ Finset.Icc 481 512, (x ∈ universe_1112 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1112_513_544 :
    ∀ x ∈ Finset.Icc 513 544, (x ∈ universe_1112 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1112_545_576 :
    ∀ x ∈ Finset.Icc 545 576, (x ∈ universe_1112 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1112_577_608 :
    ∀ x ∈ Finset.Icc 577 608, (x ∈ universe_1112 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1112_609_640 :
    ∀ x ∈ Finset.Icc 609 640, (x ∈ universe_1112 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1112_641_672 :
    ∀ x ∈ Finset.Icc 641 672, (x ∈ universe_1112 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1112_673_704 :
    ∀ x ∈ Finset.Icc 673 704, (x ∈ universe_1112 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1112_705_736 :
    ∀ x ∈ Finset.Icc 705 736, (x ∈ universe_1112 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1112_737_768 :
    ∀ x ∈ Finset.Icc 737 768, (x ∈ universe_1112 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1112_769_800 :
    ∀ x ∈ Finset.Icc 769 800, (x ∈ universe_1112 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1112_801_806 :
    ∀ x ∈ Finset.Icc 801 806, (x ∈ universe_1112 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_range_1112 : ∀ x ∈ universe_1112, x ∈ Finset.Icc 1 806 := by
  decide +kernel

theorem universe_eq_1112 : U 806 = universe_1112 := by
  ext x
  rw [mem_U_iff]
  constructor
  · rintro ⟨hx, hs⟩
    have ranges :
      x ∈ Finset.Icc 1 32 ∨
      x ∈ Finset.Icc 33 64 ∨
      x ∈ Finset.Icc 65 96 ∨
      x ∈ Finset.Icc 97 128 ∨
      x ∈ Finset.Icc 129 160 ∨
      x ∈ Finset.Icc 161 192 ∨
      x ∈ Finset.Icc 193 224 ∨
      x ∈ Finset.Icc 225 256 ∨
      x ∈ Finset.Icc 257 288 ∨
      x ∈ Finset.Icc 289 320 ∨
      x ∈ Finset.Icc 321 352 ∨
      x ∈ Finset.Icc 353 384 ∨
      x ∈ Finset.Icc 385 416 ∨
      x ∈ Finset.Icc 417 448 ∨
      x ∈ Finset.Icc 449 480 ∨
      x ∈ Finset.Icc 481 512 ∨
      x ∈ Finset.Icc 513 544 ∨
      x ∈ Finset.Icc 545 576 ∨
      x ∈ Finset.Icc 577 608 ∨
      x ∈ Finset.Icc 609 640 ∨
      x ∈ Finset.Icc 641 672 ∨
      x ∈ Finset.Icc 673 704 ∨
      x ∈ Finset.Icc 705 736 ∨
      x ∈ Finset.Icc 737 768 ∨
      x ∈ Finset.Icc 769 800 ∨
      x ∈ Finset.Icc 801 806 := by
      simp only [Finset.mem_Icc] at hx ⊢
      omega
    rcases ranges with h0 | h1 | h2 | h3 | h4 | h5 | h6 | h7 | h8 | h9 | h10 | h11 | h12 | h13 | h14 | h15 | h16 | h17 | h18 | h19 | h20 | h21 | h22 | h23 | h24 | h25
    · exact (universe_part_1112_1_32 x h0).mpr hs
    · exact (universe_part_1112_33_64 x h1).mpr hs
    · exact (universe_part_1112_65_96 x h2).mpr hs
    · exact (universe_part_1112_97_128 x h3).mpr hs
    · exact (universe_part_1112_129_160 x h4).mpr hs
    · exact (universe_part_1112_161_192 x h5).mpr hs
    · exact (universe_part_1112_193_224 x h6).mpr hs
    · exact (universe_part_1112_225_256 x h7).mpr hs
    · exact (universe_part_1112_257_288 x h8).mpr hs
    · exact (universe_part_1112_289_320 x h9).mpr hs
    · exact (universe_part_1112_321_352 x h10).mpr hs
    · exact (universe_part_1112_353_384 x h11).mpr hs
    · exact (universe_part_1112_385_416 x h12).mpr hs
    · exact (universe_part_1112_417_448 x h13).mpr hs
    · exact (universe_part_1112_449_480 x h14).mpr hs
    · exact (universe_part_1112_481_512 x h15).mpr hs
    · exact (universe_part_1112_513_544 x h16).mpr hs
    · exact (universe_part_1112_545_576 x h17).mpr hs
    · exact (universe_part_1112_577_608 x h18).mpr hs
    · exact (universe_part_1112_609_640 x h19).mpr hs
    · exact (universe_part_1112_641_672 x h20).mpr hs
    · exact (universe_part_1112_673_704 x h21).mpr hs
    · exact (universe_part_1112_705_736 x h22).mpr hs
    · exact (universe_part_1112_737_768 x h23).mpr hs
    · exact (universe_part_1112_769_800 x h24).mpr hs
    · exact (universe_part_1112_801_806 x h25).mpr hs
  · intro hx
    have hr := universe_range_1112 x hx
    refine ⟨hr, ?_⟩
    have ranges :
      x ∈ Finset.Icc 1 32 ∨
      x ∈ Finset.Icc 33 64 ∨
      x ∈ Finset.Icc 65 96 ∨
      x ∈ Finset.Icc 97 128 ∨
      x ∈ Finset.Icc 129 160 ∨
      x ∈ Finset.Icc 161 192 ∨
      x ∈ Finset.Icc 193 224 ∨
      x ∈ Finset.Icc 225 256 ∨
      x ∈ Finset.Icc 257 288 ∨
      x ∈ Finset.Icc 289 320 ∨
      x ∈ Finset.Icc 321 352 ∨
      x ∈ Finset.Icc 353 384 ∨
      x ∈ Finset.Icc 385 416 ∨
      x ∈ Finset.Icc 417 448 ∨
      x ∈ Finset.Icc 449 480 ∨
      x ∈ Finset.Icc 481 512 ∨
      x ∈ Finset.Icc 513 544 ∨
      x ∈ Finset.Icc 545 576 ∨
      x ∈ Finset.Icc 577 608 ∨
      x ∈ Finset.Icc 609 640 ∨
      x ∈ Finset.Icc 641 672 ∨
      x ∈ Finset.Icc 673 704 ∨
      x ∈ Finset.Icc 705 736 ∨
      x ∈ Finset.Icc 737 768 ∨
      x ∈ Finset.Icc 769 800 ∨
      x ∈ Finset.Icc 801 806 := by
      simp only [Finset.mem_Icc] at hr ⊢
      omega
    rcases ranges with h0 | h1 | h2 | h3 | h4 | h5 | h6 | h7 | h8 | h9 | h10 | h11 | h12 | h13 | h14 | h15 | h16 | h17 | h18 | h19 | h20 | h21 | h22 | h23 | h24 | h25
    · exact (universe_part_1112_1_32 x h0).mp hx
    · exact (universe_part_1112_33_64 x h1).mp hx
    · exact (universe_part_1112_65_96 x h2).mp hx
    · exact (universe_part_1112_97_128 x h3).mp hx
    · exact (universe_part_1112_129_160 x h4).mp hx
    · exact (universe_part_1112_161_192 x h5).mp hx
    · exact (universe_part_1112_193_224 x h6).mp hx
    · exact (universe_part_1112_225_256 x h7).mp hx
    · exact (universe_part_1112_257_288 x h8).mp hx
    · exact (universe_part_1112_289_320 x h9).mp hx
    · exact (universe_part_1112_321_352 x h10).mp hx
    · exact (universe_part_1112_353_384 x h11).mp hx
    · exact (universe_part_1112_385_416 x h12).mp hx
    · exact (universe_part_1112_417_448 x h13).mp hx
    · exact (universe_part_1112_449_480 x h14).mp hx
    · exact (universe_part_1112_481_512 x h15).mp hx
    · exact (universe_part_1112_513_544 x h16).mp hx
    · exact (universe_part_1112_545_576 x h17).mp hx
    · exact (universe_part_1112_577_608 x h18).mp hx
    · exact (universe_part_1112_609_640 x h19).mp hx
    · exact (universe_part_1112_641_672 x h20).mp hx
    · exact (universe_part_1112_673_704 x h21).mp hx
    · exact (universe_part_1112_705_736 x h22).mp hx
    · exact (universe_part_1112_737_768 x h23).mp hx
    · exact (universe_part_1112_769_800 x h24).mp hx
    · exact (universe_part_1112_801_806 x h25).mp hx

theorem closed_bound_1112 : Extended.Bound active_1112 124 :=
  bound_retained_1112 universe_eq_1112

#print axioms universe_eq_1112
#print axioms closed_bound_1112

theorem universe_part_1114_1_32 :
    ∀ x ∈ Finset.Icc 1 32, (x ∈ universe_1114 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1114_33_64 :
    ∀ x ∈ Finset.Icc 33 64, (x ∈ universe_1114 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1114_65_96 :
    ∀ x ∈ Finset.Icc 65 96, (x ∈ universe_1114 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1114_97_128 :
    ∀ x ∈ Finset.Icc 97 128, (x ∈ universe_1114 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1114_129_160 :
    ∀ x ∈ Finset.Icc 129 160, (x ∈ universe_1114 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1114_161_192 :
    ∀ x ∈ Finset.Icc 161 192, (x ∈ universe_1114 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1114_193_224 :
    ∀ x ∈ Finset.Icc 193 224, (x ∈ universe_1114 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1114_225_256 :
    ∀ x ∈ Finset.Icc 225 256, (x ∈ universe_1114 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1114_257_288 :
    ∀ x ∈ Finset.Icc 257 288, (x ∈ universe_1114 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1114_289_320 :
    ∀ x ∈ Finset.Icc 289 320, (x ∈ universe_1114 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1114_321_352 :
    ∀ x ∈ Finset.Icc 321 352, (x ∈ universe_1114 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1114_353_384 :
    ∀ x ∈ Finset.Icc 353 384, (x ∈ universe_1114 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1114_385_416 :
    ∀ x ∈ Finset.Icc 385 416, (x ∈ universe_1114 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1114_417_448 :
    ∀ x ∈ Finset.Icc 417 448, (x ∈ universe_1114 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1114_449_480 :
    ∀ x ∈ Finset.Icc 449 480, (x ∈ universe_1114 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1114_481_512 :
    ∀ x ∈ Finset.Icc 481 512, (x ∈ universe_1114 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1114_513_544 :
    ∀ x ∈ Finset.Icc 513 544, (x ∈ universe_1114 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1114_545_576 :
    ∀ x ∈ Finset.Icc 545 576, (x ∈ universe_1114 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1114_577_608 :
    ∀ x ∈ Finset.Icc 577 608, (x ∈ universe_1114 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1114_609_640 :
    ∀ x ∈ Finset.Icc 609 640, (x ∈ universe_1114 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1114_641_672 :
    ∀ x ∈ Finset.Icc 641 672, (x ∈ universe_1114 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1114_673_704 :
    ∀ x ∈ Finset.Icc 673 704, (x ∈ universe_1114 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1114_705_736 :
    ∀ x ∈ Finset.Icc 705 736, (x ∈ universe_1114 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1114_737_768 :
    ∀ x ∈ Finset.Icc 737 768, (x ∈ universe_1114 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1114_769_800 :
    ∀ x ∈ Finset.Icc 769 800, (x ∈ universe_1114 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_part_1114_801_814 :
    ∀ x ∈ Finset.Icc 801 814, (x ∈ universe_1114 ↔ boundedSupported x) := by
  decide +kernel

theorem universe_range_1114 : ∀ x ∈ universe_1114, x ∈ Finset.Icc 1 814 := by
  decide +kernel

theorem universe_eq_1114 : U 814 = universe_1114 := by
  ext x
  rw [mem_U_iff]
  constructor
  · rintro ⟨hx, hs⟩
    have ranges :
      x ∈ Finset.Icc 1 32 ∨
      x ∈ Finset.Icc 33 64 ∨
      x ∈ Finset.Icc 65 96 ∨
      x ∈ Finset.Icc 97 128 ∨
      x ∈ Finset.Icc 129 160 ∨
      x ∈ Finset.Icc 161 192 ∨
      x ∈ Finset.Icc 193 224 ∨
      x ∈ Finset.Icc 225 256 ∨
      x ∈ Finset.Icc 257 288 ∨
      x ∈ Finset.Icc 289 320 ∨
      x ∈ Finset.Icc 321 352 ∨
      x ∈ Finset.Icc 353 384 ∨
      x ∈ Finset.Icc 385 416 ∨
      x ∈ Finset.Icc 417 448 ∨
      x ∈ Finset.Icc 449 480 ∨
      x ∈ Finset.Icc 481 512 ∨
      x ∈ Finset.Icc 513 544 ∨
      x ∈ Finset.Icc 545 576 ∨
      x ∈ Finset.Icc 577 608 ∨
      x ∈ Finset.Icc 609 640 ∨
      x ∈ Finset.Icc 641 672 ∨
      x ∈ Finset.Icc 673 704 ∨
      x ∈ Finset.Icc 705 736 ∨
      x ∈ Finset.Icc 737 768 ∨
      x ∈ Finset.Icc 769 800 ∨
      x ∈ Finset.Icc 801 814 := by
      simp only [Finset.mem_Icc] at hx ⊢
      omega
    rcases ranges with h0 | h1 | h2 | h3 | h4 | h5 | h6 | h7 | h8 | h9 | h10 | h11 | h12 | h13 | h14 | h15 | h16 | h17 | h18 | h19 | h20 | h21 | h22 | h23 | h24 | h25
    · exact (universe_part_1114_1_32 x h0).mpr hs
    · exact (universe_part_1114_33_64 x h1).mpr hs
    · exact (universe_part_1114_65_96 x h2).mpr hs
    · exact (universe_part_1114_97_128 x h3).mpr hs
    · exact (universe_part_1114_129_160 x h4).mpr hs
    · exact (universe_part_1114_161_192 x h5).mpr hs
    · exact (universe_part_1114_193_224 x h6).mpr hs
    · exact (universe_part_1114_225_256 x h7).mpr hs
    · exact (universe_part_1114_257_288 x h8).mpr hs
    · exact (universe_part_1114_289_320 x h9).mpr hs
    · exact (universe_part_1114_321_352 x h10).mpr hs
    · exact (universe_part_1114_353_384 x h11).mpr hs
    · exact (universe_part_1114_385_416 x h12).mpr hs
    · exact (universe_part_1114_417_448 x h13).mpr hs
    · exact (universe_part_1114_449_480 x h14).mpr hs
    · exact (universe_part_1114_481_512 x h15).mpr hs
    · exact (universe_part_1114_513_544 x h16).mpr hs
    · exact (universe_part_1114_545_576 x h17).mpr hs
    · exact (universe_part_1114_577_608 x h18).mpr hs
    · exact (universe_part_1114_609_640 x h19).mpr hs
    · exact (universe_part_1114_641_672 x h20).mpr hs
    · exact (universe_part_1114_673_704 x h21).mpr hs
    · exact (universe_part_1114_705_736 x h22).mpr hs
    · exact (universe_part_1114_737_768 x h23).mpr hs
    · exact (universe_part_1114_769_800 x h24).mpr hs
    · exact (universe_part_1114_801_814 x h25).mpr hs
  · intro hx
    have hr := universe_range_1114 x hx
    refine ⟨hr, ?_⟩
    have ranges :
      x ∈ Finset.Icc 1 32 ∨
      x ∈ Finset.Icc 33 64 ∨
      x ∈ Finset.Icc 65 96 ∨
      x ∈ Finset.Icc 97 128 ∨
      x ∈ Finset.Icc 129 160 ∨
      x ∈ Finset.Icc 161 192 ∨
      x ∈ Finset.Icc 193 224 ∨
      x ∈ Finset.Icc 225 256 ∨
      x ∈ Finset.Icc 257 288 ∨
      x ∈ Finset.Icc 289 320 ∨
      x ∈ Finset.Icc 321 352 ∨
      x ∈ Finset.Icc 353 384 ∨
      x ∈ Finset.Icc 385 416 ∨
      x ∈ Finset.Icc 417 448 ∨
      x ∈ Finset.Icc 449 480 ∨
      x ∈ Finset.Icc 481 512 ∨
      x ∈ Finset.Icc 513 544 ∨
      x ∈ Finset.Icc 545 576 ∨
      x ∈ Finset.Icc 577 608 ∨
      x ∈ Finset.Icc 609 640 ∨
      x ∈ Finset.Icc 641 672 ∨
      x ∈ Finset.Icc 673 704 ∨
      x ∈ Finset.Icc 705 736 ∨
      x ∈ Finset.Icc 737 768 ∨
      x ∈ Finset.Icc 769 800 ∨
      x ∈ Finset.Icc 801 814 := by
      simp only [Finset.mem_Icc] at hr ⊢
      omega
    rcases ranges with h0 | h1 | h2 | h3 | h4 | h5 | h6 | h7 | h8 | h9 | h10 | h11 | h12 | h13 | h14 | h15 | h16 | h17 | h18 | h19 | h20 | h21 | h22 | h23 | h24 | h25
    · exact (universe_part_1114_1_32 x h0).mp hx
    · exact (universe_part_1114_33_64 x h1).mp hx
    · exact (universe_part_1114_65_96 x h2).mp hx
    · exact (universe_part_1114_97_128 x h3).mp hx
    · exact (universe_part_1114_129_160 x h4).mp hx
    · exact (universe_part_1114_161_192 x h5).mp hx
    · exact (universe_part_1114_193_224 x h6).mp hx
    · exact (universe_part_1114_225_256 x h7).mp hx
    · exact (universe_part_1114_257_288 x h8).mp hx
    · exact (universe_part_1114_289_320 x h9).mp hx
    · exact (universe_part_1114_321_352 x h10).mp hx
    · exact (universe_part_1114_353_384 x h11).mp hx
    · exact (universe_part_1114_385_416 x h12).mp hx
    · exact (universe_part_1114_417_448 x h13).mp hx
    · exact (universe_part_1114_449_480 x h14).mp hx
    · exact (universe_part_1114_481_512 x h15).mp hx
    · exact (universe_part_1114_513_544 x h16).mp hx
    · exact (universe_part_1114_545_576 x h17).mp hx
    · exact (universe_part_1114_577_608 x h18).mp hx
    · exact (universe_part_1114_609_640 x h19).mp hx
    · exact (universe_part_1114_641_672 x h20).mp hx
    · exact (universe_part_1114_673_704 x h21).mp hx
    · exact (universe_part_1114_705_736 x h22).mp hx
    · exact (universe_part_1114_737_768 x h23).mp hx
    · exact (universe_part_1114_769_800 x h24).mp hx
    · exact (universe_part_1114_801_814 x h25).mp hx

theorem closed_bound_1114 : Extended.Bound active_1114 125 :=
  bound_retained_1114 universe_eq_1114

#print axioms universe_eq_1114
#print axioms closed_bound_1114

end FourExternal
