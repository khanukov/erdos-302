import JointIndependenceCandidate

/-! Proposed closed N=6 literal instance. UNCOMPILED: see audit/JOINT_SIX_CANDIDATE.md. -/
namespace JointSixCandidate
open Finset JointIndependenceCandidate LiteralFactorMatchingCandidate

set_option maxRecDepth 100000
set_option maxHeartbeats 0

/-- Bounded search is computable, unlike the unbounded classical predicate. -/
def boundedSmooth (S : Finset ℕ) (t : ℕ) : Prop :=
  ∀ p ∈ Finset.range (t + 1), p.Prime → p ∣ t → p ∈ S

instance (S : Finset ℕ) (t : ℕ) : Decidable (boundedSmooth S t) :=
  inferInstanceAs (Decidable (∀ p ∈ Finset.range (t + 1),
    p.Prime → p ∣ t → p ∈ S))

theorem boundedSmooth_iff (S : Finset ℕ) {t : ℕ} (ht : 0 < t) :
    boundedSmooth S t ↔ SmoothRenewal.Smooth S t := by
  constructor
  · intro h p hp hd
    exact h p (Finset.mem_range.mpr (Nat.lt_succ_of_le (Nat.le_of_dvd ht hd))) hp hd
  · intro h p _ hp hd
    exact h p hp hd

/-- The cheap interval gate avoids inspecting suffix smoothness for most cells. -/
def fastMultiplicity (S : Finset ℕ) (a b : ℕ) : ℕ :=
  if 6 < a then 0 else
    ((Finset.Icc 1 6).filter (fun t =>
      a ≤ 6 / t ∧ 6 / t < b ∧ boundedSmooth S t)).card

theorem fastMultiplicity_eq (S : Finset ℕ) (a b : ℕ) :
    fastMultiplicity S a b = SuffixBijectionCandidate.multiplicity S 6 a b 1 := by
  classical
  unfold fastMultiplicity SuffixBijectionCandidate.multiplicity
  simp only [Nat.div_one, one_mul]
  split
  · rename_i hg
    symm
    apply Finset.card_eq_zero.mpr
    apply Finset.eq_empty_iff_forall_not_mem.mpr
    intro t ht
    have h := (Finset.mem_filter.mp ht).2.2.1
    have hd : 6 / t ≤ 6 := Nat.div_le_self 6 t
    omega
  · congr 1
    ext t
    simp only [Finset.mem_filter, Finset.mem_Icc]
    constructor
    · rintro ⟨hmem, ha, hb, hs⟩
      exact ⟨hmem, (boundedSmooth_iff S (by omega)).mp hs, ha, hb⟩
    · rintro ⟨hmem, hs, ha, hb⟩
      exact ⟨hmem, ha, hb, (boundedSmooth_iff S (by omega)).mpr hs⟩

/-- A natural-indexed version of the actual summand; outside the ledger it is zero. -/
def indexedWeight (n : ℕ) : ℕ :=
  if h : n < 4705 then
    height ⟨n, h⟩ * fastMultiplicity (S ⟨n, h⟩) (a ⟨n, h⟩) (b ⟨n, h⟩)
  else 0

def shardSum (lo hi : ℕ) : ℕ := ∑ n ∈ Finset.Ico lo hi, indexedWeight n

theorem shard_00 : shardSum 0 100 = 1 := by
  decide +kernel

theorem shard_01 : shardSum 100 200 = 0 := by
  decide +kernel

theorem shard_02 : shardSum 200 300 = 0 := by
  decide +kernel

theorem shard_03 : shardSum 300 400 = 0 := by
  decide +kernel

theorem shard_04 : shardSum 400 500 = 0 := by
  decide +kernel

theorem shard_05 : shardSum 500 600 = 0 := by
  decide +kernel

theorem shard_06 : shardSum 600 700 = 0 := by
  decide +kernel

theorem shard_07 : shardSum 700 800 = 0 := by
  decide +kernel

theorem shard_08 : shardSum 800 900 = 0 := by
  decide +kernel

theorem shard_09 : shardSum 900 1000 = 0 := by
  decide +kernel

theorem shard_10 : shardSum 1000 1100 = 0 := by
  decide +kernel

theorem shard_11 : shardSum 1100 1200 = 0 := by
  decide +kernel

theorem shard_12 : shardSum 1200 1300 = 0 := by
  decide +kernel

theorem shard_13 : shardSum 1300 1400 = 0 := by
  decide +kernel

theorem shard_14 : shardSum 1400 1500 = 0 := by
  decide +kernel

theorem shard_15 : shardSum 1500 1600 = 0 := by
  decide +kernel

theorem shard_16 : shardSum 1600 1700 = 0 := by
  decide +kernel

theorem shard_17 : shardSum 1700 1800 = 0 := by
  decide +kernel

theorem shard_18 : shardSum 1800 1900 = 0 := by
  decide +kernel

theorem shard_19 : shardSum 1900 2000 = 0 := by
  decide +kernel

theorem shard_20 : shardSum 2000 2100 = 0 := by
  decide +kernel

theorem shard_21 : shardSum 2100 2200 = 0 := by
  decide +kernel

theorem shard_22 : shardSum 2200 2300 = 0 := by
  decide +kernel

theorem shard_23 : shardSum 2300 2400 = 0 := by
  decide +kernel

theorem shard_24 : shardSum 2400 2500 = 0 := by
  decide +kernel

theorem shard_25 : shardSum 2500 2600 = 0 := by
  decide +kernel

theorem shard_26 : shardSum 2600 2700 = 0 := by
  decide +kernel

theorem shard_27 : shardSum 2700 2800 = 0 := by
  decide +kernel

theorem shard_28 : shardSum 2800 2900 = 0 := by
  decide +kernel

theorem shard_29 : shardSum 2900 3000 = 0 := by
  decide +kernel

theorem shard_30 : shardSum 3000 3100 = 0 := by
  decide +kernel

theorem shard_31 : shardSum 3100 3200 = 0 := by
  decide +kernel

theorem shard_32 : shardSum 3200 3300 = 0 := by
  decide +kernel

theorem shard_33 : shardSum 3300 3400 = 0 := by
  decide +kernel

theorem shard_34 : shardSum 3400 3500 = 0 := by
  decide +kernel

theorem shard_35 : shardSum 3500 3600 = 0 := by
  decide +kernel

theorem shard_36 : shardSum 3600 3700 = 0 := by
  decide +kernel

theorem shard_37 : shardSum 3700 3800 = 0 := by
  decide +kernel

theorem shard_38 : shardSum 3800 3900 = 0 := by
  decide +kernel

theorem shard_39 : shardSum 3900 4000 = 0 := by
  decide +kernel

theorem shard_40 : shardSum 4000 4100 = 0 := by
  decide +kernel

theorem shard_41 : shardSum 4100 4200 = 0 := by
  decide +kernel

theorem shard_42 : shardSum 4200 4300 = 0 := by
  decide +kernel

theorem shard_43 : shardSum 4300 4400 = 0 := by
  decide +kernel

theorem shard_44 : shardSum 4400 4500 = 0 := by
  decide +kernel

theorem shard_45 : shardSum 4500 4600 = 0 := by
  decide +kernel

theorem shard_46 : shardSum 4600 4700 = 0 := by
  decide +kernel

theorem shard_47 : shardSum 4700 4705 = 0 := by
  decide +kernel

/-- Proposed exact partition of the original finite sum into consecutive intervals. -/
theorem shards_cover :
    (∑ i : Fin 4705, height i * fastMultiplicity (S i) (a i) (b i)) =
    shardSum 0 100 +
    shardSum 100 200 +
    shardSum 200 300 +
    shardSum 300 400 +
    shardSum 400 500 +
    shardSum 500 600 +
    shardSum 600 700 +
    shardSum 700 800 +
    shardSum 800 900 +
    shardSum 900 1000 +
    shardSum 1000 1100 +
    shardSum 1100 1200 +
    shardSum 1200 1300 +
    shardSum 1300 1400 +
    shardSum 1400 1500 +
    shardSum 1500 1600 +
    shardSum 1600 1700 +
    shardSum 1700 1800 +
    shardSum 1800 1900 +
    shardSum 1900 2000 +
    shardSum 2000 2100 +
    shardSum 2100 2200 +
    shardSum 2200 2300 +
    shardSum 2300 2400 +
    shardSum 2400 2500 +
    shardSum 2500 2600 +
    shardSum 2600 2700 +
    shardSum 2700 2800 +
    shardSum 2800 2900 +
    shardSum 2900 3000 +
    shardSum 3000 3100 +
    shardSum 3100 3200 +
    shardSum 3200 3300 +
    shardSum 3300 3400 +
    shardSum 3400 3500 +
    shardSum 3500 3600 +
    shardSum 3600 3700 +
    shardSum 3700 3800 +
    shardSum 3800 3900 +
    shardSum 3900 4000 +
    shardSum 4000 4100 +
    shardSum 4100 4200 +
    shardSum 4200 4300 +
    shardSum 4300 4400 +
    shardSum 4400 4500 +
    shardSum 4500 4600 +
    shardSum 4600 4700 +
    shardSum 4700 4705 := by
  rw [Finset.sum_fin_eq_sum_range]
  change (∑ n ∈ Finset.range 4705, indexedWeight n) = _
  simp only [← Finset.Ico_zero_eq_range]
  change shardSum 0 4705 = _
  simp only [shardSum, ← Finset.sum_Ico_consecutive (by omega) (by omega)]

/-- Actual 4705-occurrence sum, via the proposed interval decomposition. -/
theorem literal_weight : (∑ i : Fin 4705, height i * mult 6 i 1) = 1 := by
  have h := shards_cover
  rw [shard_00, shard_01, shard_02, shard_03, shard_04, shard_05, shard_06, shard_07, shard_08, shard_09, shard_10, shard_11, shard_12, shard_13, shard_14, shard_15, shard_16, shard_17, shard_18, shard_19, shard_20, shard_21, shard_22, shard_23, shard_24, shard_25, shard_26, shard_27, shard_28, shard_29, shard_30, shard_31, shard_32, shard_33, shard_34, shard_35, shard_36, shard_37, shard_38, shard_39, shard_40, shard_41, shard_42, shard_43, shard_44, shard_45, shard_46, shard_47] at h
  norm_num at h
  simpa only [fastMultiplicity_eq, mult] using h

/-- The edge {2,3,6} lies in the actual smooth vertex set. -/
theorem edge_in_vertices : ({2,3,6} : Finset ℕ) ⊆ SmoothRenewal.vertices Q 6 := by
  classical
  intro x hx
  simp only [Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl <;>
    simp only [SmoothRenewal.vertices, Finset.mem_filter, Finset.mem_Icc] <;>
    constructor <;> try omega <;>
    (intro p hp hd
     have hp6 : p ≤ 6 := Nat.le_of_dvd (by omega) hd
     have hp2 := hp.two_le
     interval_cases p <;> norm_num [Q, ArchiveLedger.primes] at *)

theorem concrete_edge : SmoothRenewal.Edge ({2,3,6} : Finset ℕ) := by
  exact ⟨2, 3, 6, by decide, by decide, by decide, by decide, rfl⟩

/-- Independent sets miss at least one vertex of that edge. -/
theorem independent_bound (B : Finset ℕ)
    (hBS : B ⊆ SmoothRenewal.vertices Q 6)
    (hB : Independent SmoothRenewal.Edge B) :
    B.card + 1 ≤ (SmoothRenewal.vertices Q 6).card := by
  have hne : B ≠ SmoothRenewal.vertices Q 6 := by
    intro h
    apply hB _ concrete_edge
    simpa [h] using edge_in_vertices
  have hlt : B.card < (SmoothRenewal.vertices Q 6).card :=
    Finset.card_lt_card (Finset.ssubset_iff_subset_ne.mpr ⟨hBS, hne⟩)
  omega

/-- Closed q=1 joint bound, with the full literal weight. -/
theorem joint_six (B : Finset ℕ)
    (hBS : B ⊆ SmoothRenewal.vertices Q (6 / 1))
    (hB : Independent SmoothRenewal.Edge B) :
    B.card + (∑ i : Fin 4705, height i * mult 6 i 1) ≤
      (SmoothRenewal.vertices Q (6 / 1)).card := by
  rw [literal_weight]
  simpa using independent_bound B hBS hB

#print axioms literal_weight
#print axioms edge_in_vertices
#print axioms concrete_edge
#print axioms independent_bound
#print axioms joint_six
end JointSixCandidate
