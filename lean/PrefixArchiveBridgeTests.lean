import PrefixArchiveBridge

open Finset PrefixArchiveBridge

namespace PrefixArchiveBridgeTests

-- Both cells contain the same rough index. Each height fits demand 1 on its
-- own, but together they require demand 2; per-cell checks cannot be combined.
def cells : Finset (Fin 2) := univ
def support : Finset ℕ := {1}
def member (_ : Fin 2) (q : ℕ) : Prop := q = 1
instance : DecidableRel member := fun _ q => inferInstanceAs (Decidable (q = 1))

def height (_ : Fin 2) : ℝ := 1
def count (_ : Fin 2) : ℝ := 1
def demandOne (_ : ℕ) : ℕ := 1
def demandTwo (_ : ℕ) : ℕ := 2

example : ∀ i ∈ cells, height i ≤ (demandOne 1 : ℝ) := by
  norm_num [height, demandOne]

example : ¬ (∀ q ∈ support, contribution cells height member q ≤ (demandOne q : ℝ)) := by
  intro h
  have h1 := h 1 (by simp [support])
  norm_num [contribution, cells, height, member, demandOne, Fin.sum_univ_two] at h1

-- The same overlap is valid with enough joint demand. Use the production
-- theorem, rather than assuming its conclusion or repeating its hypotheses.
example : ArchiveSummation.weightedCount cells height count ≤
    ∑ q ∈ support, (demandTwo q : ℝ) := by
  apply cells_le_prefix cells support height member demandTwo count
  · intro i hi
    fin_cases i <;> norm_num [count, support, member, Finset.filter_singleton]
  · intro q hq
    have : q = 1 := by simpa [support] using hq
    subst q
    norm_num [contribution, cells, height, member, demandTwo, Fin.sum_univ_two]

-- An empty family needs neither count equalities nor pointwise allocation.
example : ArchiveSummation.weightedCount (∅ : Finset (Fin 2)) height count ≤
    ∑ q ∈ (∅ : Finset ℕ), (demandOne q : ℝ) := by
  apply cells_le_prefix ∅ ∅ height member demandOne count
  · simp
  · simp

-- A declared count different from the actual filtered cardinality violates
-- hcount even when the allocation itself is valid.
example : ¬ (∀ i ∈ cells, (0 : ℝ) = ((support.filter (member i)).card : ℝ)) := by
  intro h
  have h0 := h (0 : Fin 2) (by simp [cells])
  norm_num [support, member, Finset.filter_singleton] at h0

end PrefixArchiveBridgeTests
