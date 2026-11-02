import FactorCountCandidate

open Finset SuffixBijectionCandidate

-- Concrete evaluations use the theorem and the actual archive cell, rather
-- than an assumed count equality. No native_decide is used.
theorem factorCount_nonzero :
    (∑ q ∈ indices (∅ : Finset ℕ) ∅ 6, multiplicity ∅ 6 1 2 q) = 3 := by
  classical
  rw [← cellCount_eq_sum_multiplicity ∅ ∅ 6 1 2 (by decide) (by decide)
    (by simp) (by simp)]
  norm_num [ArchiveSummation.cellCount, Finset.range_add_one, Finset.filter_insert,
    Finset.filter_singleton, Finset.filter_empty, Nat.Coprime]

theorem factorCount_nonempty_sets :
    (∑ q ∈ indices ({2} : Finset ℕ) {3} 6, multiplicity {3} 6 1 2 q) = 1 := by
  classical
  rw [← cellCount_eq_sum_multiplicity {2} {3} 6 1 2 (by decide) (by decide)
    (by norm_num) (by decide)]
  norm_num [ArchiveSummation.cellCount, Finset.range_add_one, Finset.filter_insert,
    Finset.filter_empty, Nat.Coprime]

theorem factorCount_zero_N :
    (∑ q ∈ indices (∅ : Finset ℕ) ∅ 0, multiplicity ∅ 0 1 2 q) = 0 := by
  classical
  rw [← cellCount_eq_sum_multiplicity ∅ ∅ 0 1 2 (by decide) (by decide)
    (by simp) (by simp)]
  norm_num [ArchiveSummation.cellCount, Finset.range_add_one] <;> omega

theorem factorCount_reversed :
    (∑ q ∈ indices (∅ : Finset ℕ) ∅ 6, multiplicity ∅ 6 2 1 q) = 0 := by
  classical
  rw [← cellCount_eq_sum_multiplicity ∅ ∅ 6 2 1 (by decide) (by decide)
    (by simp) (by simp)]
  norm_num [ArchiveSummation.cellCount, Finset.range_add_one] <;> omega

-- Each incomplete application must fail, even if all other assumptions are
-- available. These are elaboration checks; numerical countermodels are in Python.
example (P S : Finset ℕ) (N a b : ℕ) (hb : 0 < b)
    (hp : ∀ p ∈ P, p.Prime) (hd : Disjoint P S) : True := by
  fail_if_success
    have : ArchiveSummation.cellCount N a b
        (fun m => Nat.Coprime m (∏ p ∈ P, p)) =
        ∑ q ∈ indices P S N, multiplicity S N a b q :=
      cellCount_eq_sum_multiplicity P S N a b (by assumption) hb hp hd
    trivial
  trivial
example (P S : Finset ℕ) (N a b : ℕ) (ha : 0 < a)
    (hp : ∀ p ∈ P, p.Prime) (hd : Disjoint P S) : True := by
  fail_if_success
    have : ArchiveSummation.cellCount N a b
        (fun m => Nat.Coprime m (∏ p ∈ P, p)) =
        ∑ q ∈ indices P S N, multiplicity S N a b q :=
      cellCount_eq_sum_multiplicity P S N a b ha (by assumption) hp hd
    trivial
  trivial
example (P S : Finset ℕ) (N a b : ℕ) (ha : 0 < a) (hb : 0 < b)
    (hd : Disjoint P S) : True := by
  fail_if_success
    have : ArchiveSummation.cellCount N a b
        (fun m => Nat.Coprime m (∏ p ∈ P, p)) =
        ∑ q ∈ indices P S N, multiplicity S N a b q :=
      cellCount_eq_sum_multiplicity P S N a b ha hb (by assumption) hd
    trivial
  trivial
example (P S : Finset ℕ) (N a b : ℕ) (ha : 0 < a) (hb : 0 < b)
    (hp : ∀ p ∈ P, p.Prime) : True := by
  fail_if_success
    have : ArchiveSummation.cellCount N a b
        (fun m => Nat.Coprime m (∏ p ∈ P, p)) =
        ∑ q ∈ indices P S N, multiplicity S N a b q :=
      cellCount_eq_sum_multiplicity P S N a b ha hb hp (by assumption)
    trivial
  trivial

#print axioms factorCount_nonzero
#print axioms factorCount_nonempty_sets
#print axioms factorCount_zero_N
#print axioms factorCount_reversed
