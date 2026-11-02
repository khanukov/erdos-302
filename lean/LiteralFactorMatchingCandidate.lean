import ArchiveLedgerSumBridge
import RenewalMultiplicityCandidate
import FactorCountCandidate

/-! Candidate for hosted checking. Literal ledger cells are list occurrences.
The joint allocation and graph demands remain hypotheses; no cover is assumed. -/
namespace LiteralFactorMatchingCandidate
open Finset ArchiveLedgerSumBridge
open scoped Classical

deriving instance DecidableEq for ArchiveLedgerSumBridge.Entry

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem index_length : entries.length = 4705 := by decide +kernel

def idx (i : Fin 4705) : Index :=
  ⟨i.val, by simpa [index_length] using i.isLt⟩

def P (i : Fin 4705) : Finset ℕ := cellPrimes (idx i)
def Q : Finset ℕ := ArchiveLedger.primes.toFinset
def S (i : Fin 4705) : Finset ℕ := Q \ P i

def a (i : Fin 4705) : ℕ := cellA (idx i)
def b (i : Fin 4705) : ℕ := cellB (idx i)
def height (i : Fin 4705) : ℕ := (entry (idx i)).cell.height
noncomputable def support (N : ℕ) : Finset ℕ :=
  (Icc 1 N).filter (SmoothPartition.Rough Q)
noncomputable def mult (N : ℕ) (i : Fin 4705) (q : ℕ) : ℕ :=
  SuffixBijectionCandidate.multiplicity (S i) N (a i) (b i) q
noncomputable def count (N : ℕ) (i : Fin 4705) : ℕ :=
  ArchiveSummation.cellCount N (a i) (b i)
    (fun m => Nat.Coprime m (∏ p ∈ P i, p))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem literal_facts :
    (∀ p ∈ ArchiveLedger.primes, Nat.Prime p) ∧
    (∀ e ∈ entries, (∀ p ∈ e.prior, p ∈ ArchiveLedger.primes) ∧
      0 < e.cell.a ∧ 0 < e.cell.b) := by
  decide +kernel

theorem P_subset (i : Fin 4705) : P i ⊆ Q := by
  intro p hp
  have h : p ∈ (entry (idx i)).prior := by
    simpa [P, cellPrimes] using hp
  have he := (literal_facts.2 _ (List.get_mem entries (idx i))).1 p h
  simpa [Q] using he

theorem P_prime (i : Fin 4705) : ∀ p ∈ P i, Nat.Prime p := by
  intro p hp
  have h : p ∈ ArchiveLedger.primes := by simpa [Q] using P_subset i hp
  exact literal_facts.1 p h

theorem Q_prime : ∀ p ∈ Q, Nat.Prime p := by
  intro p hp
  apply literal_facts.1 p
  simpa [Q] using hp

theorem S_prime (i : Fin 4705) : ∀ p ∈ S i, Nat.Prime p := by
  intro p hp
  exact Q_prime p (Finset.mem_sdiff.mp hp).1

theorem disjoint_PS (i : Fin 4705) : Disjoint (P i) (S i) := by
  apply Finset.disjoint_left.mpr
  intro p hp hs
  exact (Finset.mem_sdiff.mp hs).2 hp

theorem union_PS (i : Fin 4705) : P i ∪ S i = Q := by
  ext p
  simp only [S, Finset.mem_union, Finset.mem_sdiff]
  constructor
  · rintro (hp | ⟨hq, _⟩)
    · exact P_subset i hp
    · exact hq
  · intro hq
    by_cases hp : p ∈ P i
    · exact Or.inl hp
    · exact Or.inr ⟨hq, hp⟩

theorem a_pos (i : Fin 4705) : 0 < a i :=
  (literal_facts.2 _ (List.get_mem entries (idx i))).2.1

theorem b_pos (i : Fin 4705) : 0 < b i :=
  (literal_facts.2 _ (List.get_mem entries (idx i))).2.2

/-- Per-cell multiplicity matching follows from the factor-count bijection;
all cells use the same final-rough support. -/
theorem matching (N : ℕ) (i : Fin 4705) :
    count N i = ∑ q ∈ support N, mult N i q := by
  have h := SuffixBijectionCandidate.cellCount_eq_sum_multiplicity
    (P i) (S i) N (a i) (b i) (a_pos i) (b_pos i)
    (P_prime i) (disjoint_PS i)
  simpa [count, mult, support, SuffixBijectionCandidate.indices, union_PS i] using h

/-- Only the actual local graph-demand and joint allocation are assumed. -/
theorem literal_hcover (N : ℕ) (A : Finset ℕ) (r : ℕ → ℕ)
    (hA : A ⊆ Icc 1 N)
    (hfree : ∀ x y z, SmoothRenewal.Triple x y z → x ∈ A → y ∈ A → z ∈ A → False)
    (hd : ∀ q ∈ support N, RenewalNext.Demand SmoothRenewal.Edge
      (SmoothRenewal.vertices Q (N / q)) (r q))
    (allocation : ∀ q ∈ support N,
      (∑ i : Fin 4705, height i * mult N i q) ≤ r q) :
    (A.card : ℝ) + ArchiveSummation.weightedCount Finset.univ
      (fun i : Fin 4705 => (height i : ℝ)) (fun i => (count N i : ℝ)) ≤ N := by
  apply RenewalMultiplicityCandidate.occurrence_hcover Finset.univ (support N) Q A N
    height (mult N) (count N) r hA hfree
  · intro q hq
    exact (Finset.mem_filter.mp hq).2
  · exact hd
  · intro i _
    exact matching N i
  · exact allocation

#print axioms index_length
#print axioms literal_facts
#print axioms P_subset
#print axioms P_prime
#print axioms Q_prime
#print axioms S_prime
#print axioms disjoint_PS
#print axioms union_PS
#print axioms a_pos
#print axioms b_pos
#print axioms matching
#print axioms literal_hcover
end LiteralFactorMatchingCandidate
