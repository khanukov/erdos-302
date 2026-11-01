import Sound
import UpperBridge
import Mathlib.Data.Nat.BitIndices

namespace SmallStd

noncomputable def mask (s : Finset ℕ) : ℕ :=
  ((s.sort (· ≤ ·)).map (fun i => 2 ^ i)).sum

theorem mask_bit (s : Finset ℕ) (i : ℕ) : (mask s).testBit i = true ↔ i ∈ s := by
  rw [← Nat.mem_bitIndices, mask, Nat.bitIndices_sum_map_two_pow s.sortedLT_sort]
  exact Finset.mem_sort _

theorem mask_lt (s : Finset ℕ) (n : ℕ) (hs : ∀ i ∈ s, i < n) : mask s < 2 ^ n := by
  by_contra h
  have ⟨i, hi, hb⟩ := Nat.exists_ge_and_testBit_of_ge_two_pow (Nat.le_of_not_gt h)
  have := hs i ((mask_bit s i).1 hb)
  omega

theorem checked_orderedEdge {v : List ℕ} {es : List Edge} {r i j k : ℕ}
    (h : Checked v es r) (he : (i,j,k) ∈ es) :
    UpperBridge.OrderedEdge v.toFinset v[i]! v[j]! v[k]! := by
  have ⟨hij, hjk, hk, ha, hab, hbc, hp⟩ := checked_edge h he
  have hi : i < v.length := by omega
  have hj : j < v.length := by omega
  refine ⟨?_, ?_, ?_, ha, hab, hbc, hp⟩
  all_goals simp only [List.mem_toFinset]; simpa [getElem!_pos, hi, hj, hk] using List.getElem_mem (by assumption)

theorem cover_lower {v : List ℕ} {es : List Edge} {r : ℕ}
    (h : Checked v es r) (hn : v.Nodup) (S : Finset ℕ)
    (hc : UpperBridge.OrderedCover v.toFinset S) : r ≤ S.card := by
  let iset : Finset ℕ := (Finset.range v.length).filter (fun i => v[i]! ∈ S)
  let m := mask iset
  have hm : m < 2 ^ v.length := by
    apply mask_lt
    intro i hi
    simpa [iset] using (Finset.mem_filter.mp hi).1
  have hit : ∀ i j k, (i,j,k) ∈ es →
      m.testBit i = true ∨ m.testBit j = true ∨ m.testBit k = true := by
    intro i j k he
    have hed := checked_edge h he
    obtain ⟨hij, hjk, hk, -⟩ := hed
    have hi : i < v.length := by omega
    have hj : j < v.length := by omega
    have hor := hc _ _ _ (checked_orderedEdge h he)
    simp only [m, mask_bit, iset, Finset.mem_filter, Finset.mem_range]
    rcases hor with a | b | c
    · exact Or.inl ⟨hi, a⟩
    · exact Or.inr (Or.inl ⟨hj, b⟩)
    · exact Or.inr (Or.inr ⟨hk, c⟩)
  have hw : weight v.length m = iset.card := by
    unfold weight
    rw [← List.toFinset_card_of_nodup (List.nodup_range.filter _)]
    congr 1
    ext i
    simp [m, mask_bit, iset]
  have cardle : iset.card ≤ S.card := by
    apply Finset.card_le_card_of_injOn (fun i => v[i]!)
    · intro i hi
      exact (Finset.mem_filter.mp hi).2
    · intro i hi j hj heq
      have hi' : i < v.length := Finset.mem_range.mp (Finset.mem_filter.mp hi).1
      have hj' : j < v.length := Finset.mem_range.mp (Finset.mem_filter.mp hj).1
      apply (hn.getElem_inj_iff (hi := hi') (hj := hj')).mp
      simpa [getElem!_pos, hi', hj'] using heq
  have hl := lower_bound h m hm hit
  omega

theorem finite_card_bound {v : List ℕ} {es : List Edge} {r : ℕ} {A : Finset ℕ}
    (h : Checked v es r) (hn : v.Nodup) (hsub : A ⊆ v.toFinset)
    (hfree : Erdos302Lower.NoUnitFractionTriple A) : A.card + r ≤ v.toFinset.card :=
  UpperBridge.finite_card_bound hsub hfree (fun S hc => cover_lower h hn S hc)

#print axioms mask_bit
#print axioms mask_lt
#print axioms checked_orderedEdge
#print axioms cover_lower
end SmallStd
