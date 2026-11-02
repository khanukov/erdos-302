import FourEdgeSoundnessCandidate

/- UNCOMPILED CANDIDATE. The equalities with upstream smooth sets are explicit
   hypotheses; the imported 44 shards must be compiled and axiom-gated. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 80000000
namespace FourExternal
open UpperBridge

theorem retain_1097 (hu : U 420 = universe_1097) :
    ∀ a b c, OrderedEdge (U 420) a b c →
      a ∈ active_1097 ∧ b ∈ active_1097 ∧ c ∈ active_1097 := by
  intro a b c he
  rcases he with ⟨ha, hb, hc, ha0, hab, hbc, heq⟩
  have hbU : b ∈ U 420 := hb
  have hbRange : b ∈ Finset.Icc 1 420 := (Finset.mem_filter.mp hbU).1
  have ha' : a ∈ universe_1097 := hu ▸ ha
  have hb' : b ∈ universe_1097 := hu ▸ hb
  have hc' : c ∈ universe_1097 := hu ▸ hc
  have hquot : b * c / (b + c) = a :=
    Nat.div_eq_of_eq_mul_left (by omega) heq
  have hranges :
      b ∈ Finset.Icc 1 64 ∨
      b ∈ Finset.Icc 65 128 ∨
      b ∈ Finset.Icc 129 192 ∨
      b ∈ Finset.Icc 193 256 ∨
      b ∈ Finset.Icc 257 320 ∨
      b ∈ Finset.Icc 321 384 ∨
      b ∈ Finset.Icc 385 420 := by
    simp only [Finset.mem_Icc] at hbRange ⊢
    omega
  rcases hranges with h0 | h1 | h2 | h3 | h4 | h5 | h6
  · have h := edges_1097_1_64 b h0 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1097_65_128 b h1 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1097_129_192 b h2 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1097_193_256 b h3 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1097_257_320 b h4 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1097_321_384 b h5 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1097_385_420 b h6 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq

theorem bound_retained_1097 (hu : U 420 = universe_1097) :
    Extended.Bound active_1097 71 := by
  exact bound_from_edge_retention 420 _ active_1097 (by decide) eval_1097 (retain_1097 hu)

#print axioms retain_1097
#print axioms bound_retained_1097

theorem retain_1107 (hu : U 644 = universe_1107) :
    ∀ a b c, OrderedEdge (U 644) a b c →
      a ∈ active_1107 ∧ b ∈ active_1107 ∧ c ∈ active_1107 := by
  intro a b c he
  rcases he with ⟨ha, hb, hc, ha0, hab, hbc, heq⟩
  have hbU : b ∈ U 644 := hb
  have hbRange : b ∈ Finset.Icc 1 644 := (Finset.mem_filter.mp hbU).1
  have ha' : a ∈ universe_1107 := hu ▸ ha
  have hb' : b ∈ universe_1107 := hu ▸ hb
  have hc' : c ∈ universe_1107 := hu ▸ hc
  have hquot : b * c / (b + c) = a :=
    Nat.div_eq_of_eq_mul_left (by omega) heq
  have hranges :
      b ∈ Finset.Icc 1 64 ∨
      b ∈ Finset.Icc 65 128 ∨
      b ∈ Finset.Icc 129 192 ∨
      b ∈ Finset.Icc 193 256 ∨
      b ∈ Finset.Icc 257 320 ∨
      b ∈ Finset.Icc 321 384 ∨
      b ∈ Finset.Icc 385 448 ∨
      b ∈ Finset.Icc 449 512 ∨
      b ∈ Finset.Icc 513 576 ∨
      b ∈ Finset.Icc 577 640 ∨
      b ∈ Finset.Icc 641 644 := by
    simp only [Finset.mem_Icc] at hbRange ⊢
    omega
  rcases hranges with h0 | h1 | h2 | h3 | h4 | h5 | h6 | h7 | h8 | h9 | h10
  · have h := edges_1107_1_64 b h0 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1107_65_128 b h1 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1107_129_192 b h2 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1107_193_256 b h3 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1107_257_320 b h4 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1107_321_384 b h5 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1107_385_448 b h6 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1107_449_512 b h7 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1107_513_576 b h8 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1107_577_640 b h9 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1107_641_644 b h10 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq

theorem bound_retained_1107 (hu : U 644 = universe_1107) :
    Extended.Bound active_1107 102 := by
  exact bound_from_edge_retention 644 _ active_1107 (by decide) eval_1107 (retain_1107 hu)

#print axioms retain_1107
#print axioms bound_retained_1107

theorem retain_1112 (hu : U 806 = universe_1112) :
    ∀ a b c, OrderedEdge (U 806) a b c →
      a ∈ active_1112 ∧ b ∈ active_1112 ∧ c ∈ active_1112 := by
  intro a b c he
  rcases he with ⟨ha, hb, hc, ha0, hab, hbc, heq⟩
  have hbU : b ∈ U 806 := hb
  have hbRange : b ∈ Finset.Icc 1 806 := (Finset.mem_filter.mp hbU).1
  have ha' : a ∈ universe_1112 := hu ▸ ha
  have hb' : b ∈ universe_1112 := hu ▸ hb
  have hc' : c ∈ universe_1112 := hu ▸ hc
  have hquot : b * c / (b + c) = a :=
    Nat.div_eq_of_eq_mul_left (by omega) heq
  have hranges :
      b ∈ Finset.Icc 1 64 ∨
      b ∈ Finset.Icc 65 128 ∨
      b ∈ Finset.Icc 129 192 ∨
      b ∈ Finset.Icc 193 256 ∨
      b ∈ Finset.Icc 257 320 ∨
      b ∈ Finset.Icc 321 384 ∨
      b ∈ Finset.Icc 385 448 ∨
      b ∈ Finset.Icc 449 512 ∨
      b ∈ Finset.Icc 513 576 ∨
      b ∈ Finset.Icc 577 640 ∨
      b ∈ Finset.Icc 641 704 ∨
      b ∈ Finset.Icc 705 768 ∨
      b ∈ Finset.Icc 769 806 := by
    simp only [Finset.mem_Icc] at hbRange ⊢
    omega
  rcases hranges with h0 | h1 | h2 | h3 | h4 | h5 | h6 | h7 | h8 | h9 | h10 | h11 | h12
  · have h := edges_1112_1_64 b h0 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1112_65_128 b h1 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1112_129_192 b h2 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1112_193_256 b h3 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1112_257_320 b h4 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1112_321_384 b h5 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1112_385_448 b h6 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1112_449_512 b h7 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1112_513_576 b h8 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1112_577_640 b h9 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1112_641_704 b h10 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1112_705_768 b h11 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1112_769_806 b h12 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq

theorem bound_retained_1112 (hu : U 806 = universe_1112) :
    Extended.Bound active_1112 124 := by
  exact bound_from_edge_retention 806 _ active_1112 (by decide) eval_1112 (retain_1112 hu)

#print axioms retain_1112
#print axioms bound_retained_1112

theorem retain_1114 (hu : U 814 = universe_1114) :
    ∀ a b c, OrderedEdge (U 814) a b c →
      a ∈ active_1114 ∧ b ∈ active_1114 ∧ c ∈ active_1114 := by
  intro a b c he
  rcases he with ⟨ha, hb, hc, ha0, hab, hbc, heq⟩
  have hbU : b ∈ U 814 := hb
  have hbRange : b ∈ Finset.Icc 1 814 := (Finset.mem_filter.mp hbU).1
  have ha' : a ∈ universe_1114 := hu ▸ ha
  have hb' : b ∈ universe_1114 := hu ▸ hb
  have hc' : c ∈ universe_1114 := hu ▸ hc
  have hquot : b * c / (b + c) = a :=
    Nat.div_eq_of_eq_mul_left (by omega) heq
  have hranges :
      b ∈ Finset.Icc 1 64 ∨
      b ∈ Finset.Icc 65 128 ∨
      b ∈ Finset.Icc 129 192 ∨
      b ∈ Finset.Icc 193 256 ∨
      b ∈ Finset.Icc 257 320 ∨
      b ∈ Finset.Icc 321 384 ∨
      b ∈ Finset.Icc 385 448 ∨
      b ∈ Finset.Icc 449 512 ∨
      b ∈ Finset.Icc 513 576 ∨
      b ∈ Finset.Icc 577 640 ∨
      b ∈ Finset.Icc 641 704 ∨
      b ∈ Finset.Icc 705 768 ∨
      b ∈ Finset.Icc 769 814 := by
    simp only [Finset.mem_Icc] at hbRange ⊢
    omega
  rcases hranges with h0 | h1 | h2 | h3 | h4 | h5 | h6 | h7 | h8 | h9 | h10 | h11 | h12
  · have h := edges_1114_1_64 b h0 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1114_65_128 b h1 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1114_129_192 b h2 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1114_193_256 b h3 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1114_257_320 b h4 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1114_321_384 b h5 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1114_385_448 b h6 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1114_449_512 b h7 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1114_513_576 b h8 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1114_577_640 b h9 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1114_641_704 b h10 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1114_705_768 b h11 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq
  · have h := edges_1114_769_814 b h12 c hc' hb' hbc
    rw [hquot] at h
    exact h ha' heq

theorem bound_retained_1114 (hu : U 814 = universe_1114) :
    Extended.Bound active_1114 125 := by
  exact bound_from_edge_retention 814 _ active_1114 (by decide) eval_1114 (retain_1114 hu)

#print axioms retain_1114
#print axioms bound_retained_1114

end FourExternal
