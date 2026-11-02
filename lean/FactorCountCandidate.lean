import SuffixBijectionCandidate

/-! Unchecked candidate: finite product bijection for one archive-style cell.
The imported decomposition and this script require kernel verification. -/
namespace SuffixBijectionCandidate
open Finset

noncomputable def factors (S : Finset ℕ) (N a b q : ℕ) : Finset ℕ := by
  classical
  exact (Icc 1 (N / q)).filter (fun t =>
    SmoothRenewal.Smooth S t ∧ a ≤ N / (q * t) ∧ N / (q * t) < b)

/-- Candidate proof, not an assumed count equality.  Prefix elements must be
prime; the suffix may contain nonprimes, which are inert in `Smooth`. -/
theorem cellCount_eq_sum_multiplicity (P S : Finset ℕ) (N a b : ℕ)
    (ha : 0 < a) (hb : 0 < b)
    (hp : ∀ p ∈ P, p.Prime) (hdis : Disjoint P S) :
    ArchiveSummation.cellCount N a b
      (fun m => Nat.Coprime m (∏ p ∈ P, p)) =
      ∑ q ∈ indices P S N, multiplicity S N a b q := by
  classical
  let T := (indices P S N).sigma (factors S N a b)
  let C := (range (N + 1)).filter (fun m =>
    N / b < m ∧ m ≤ N / a ∧ Nat.Coprime m (∏ p ∈ P, p))
  have hcard : T.card = C.card := by
    apply Finset.card_bij (fun x _ => x.1 * x.2)
    · intro x hx
      rcases Finset.mem_sigma.mp hx with ⟨hxq, hxt⟩
      have hxq' := (Finset.mem_filter.mp hxq).2
      have ht := Finset.mem_filter.mp hxt
      have htpos : 0 < x.2 := (Finset.mem_Icc.mp ht.1).1
      have hmpos : 0 < x.1 * x.2 := Nat.mul_pos hxq'.1 htpos
      have hmle : x.1 * x.2 ≤ N := by
        have := (Finset.mem_Icc.mp ht.1).2
        have h := (Nat.le_div_iff_mul_le hxq'.1).mp this
        simpa [Nat.mul_comm] using h
      have hc := (ArchiveSummation.quotient_cell_iff N a b (x.1 * x.2) ha hb hmpos).mp
        ⟨ht.2.2.1, ht.2.2.2⟩
      have hr := product_prefix_rough P S x.1 x.2 hdis hxq' htpos ht.2.1
      have hcop := (SmoothPartition.rough_iff_coprime_product hp).mp hr
      simp only [C, Finset.mem_filter, Finset.mem_range]
      exact ⟨by omega, hc.1, hc.2, hcop.2⟩
    · intro x hx y hy heq
      rcases Finset.mem_sigma.mp hx with ⟨hxq, hxt⟩
      rcases Finset.mem_sigma.mp hy with ⟨hyq, hyt⟩
      have rx := (Finset.mem_filter.mp hxq).2
      have ry := (Finset.mem_filter.mp hyq).2
      have tx := Finset.mem_filter.mp hxt
      have ty := Finset.mem_filter.mp hyt
      have rxs : SmoothPartition.Rough S x.1 := by
        refine ⟨rx.1, ?_⟩
        intro p hp' hps hd
        exact rx.2 p hp' (Finset.mem_union_right P hps) hd
      have rys : SmoothPartition.Rough S y.1 := by
        refine ⟨ry.1, ?_⟩
        intro p hp' hps hd
        exact ry.2 p hp' (Finset.mem_union_right P hps) hd
      have h := SmoothPartition.decomposition_unique rxs rys
        (Finset.mem_Icc.mp tx.1).1 (Finset.mem_Icc.mp ty.1).1
        tx.2.1 ty.2.1 heq
      cases x; cases y; simp_all
    · intro m hm
      have hm' : m < N + 1 ∧ N / b < m ∧ m ≤ N / a ∧
          Nat.Coprime m (∏ p ∈ P, p) := by simpa [C] using hm
      have hmpos : 0 < m := by
        exact lt_of_le_of_lt (Nat.zero_le (N / b)) hm'.2.1
      have hmle : m ≤ N := by omega
      have hr : SmoothPartition.Rough P m :=
        (SmoothPartition.rough_iff_coprime_product hp).mpr ⟨hmpos, hm'.2.2.2⟩
      obtain ⟨q, t, hq, ht, hs, heq, _⟩ := split_exists_unique P S m hdis hr
      have hqt : q * t ≤ N := by simpa [← heq] using hmle
      have hqle : q ≤ N := by nlinarith
      have htle : t ≤ N / q := by
        apply (Nat.le_div_iff_mul_le hq.1).mpr
        simpa [Nat.mul_comm] using hqt
      have hc := (ArchiveSummation.quotient_cell_iff N a b m ha hb hmpos).mpr
        ⟨hm'.2.1, hm'.2.2.1⟩
      refine ⟨⟨q, t⟩, ?_, heq.symm⟩
      apply Finset.mem_sigma.mpr
      constructor
      · simp only [indices, Finset.mem_filter, Finset.mem_Icc]
        exact ⟨⟨hq.1, hqle⟩, hq⟩
      · simp only [factors, Finset.mem_filter, Finset.mem_Icc]
        exact ⟨⟨ht, htle⟩, hs, by simpa [← heq] using hc.1,
          by simpa [← heq] using hc.2⟩
  calc
    ArchiveSummation.cellCount N a b
        (fun m => Nat.Coprime m (∏ p ∈ P, p)) = C.card := rfl
    _ = T.card := hcard.symm
    _ = ∑ q ∈ indices P S N, multiplicity S N a b q := by
      simp [T, factors, multiplicity, Finset.card_sigma]

#print axioms cellCount_eq_sum_multiplicity
end SuffixBijectionCandidate
