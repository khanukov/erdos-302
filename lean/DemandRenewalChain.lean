import SmoothRenewal

/-! Graph-demand propagation for the max update and its zero-correction tail.
The literal seed and old-profile certificates remain separate hypotheses. -/
namespace DemandRenewalChain
open Finset RenewalNext SmoothRenewal

theorem vertices_mono (Q : Finset ℕ) {m n : ℕ} (h : m ≤ n) :
    vertices Q m ⊆ vertices Q n := by
  classical
  intro x hx
  have hx' := Finset.mem_filter.mp hx
  exact Finset.mem_filter.mpr ⟨Finset.mem_Icc.mpr
    ⟨(Finset.mem_Icc.mp hx'.1).1, (Finset.mem_Icc.mp hx'.1).2.trans h⟩, hx'.2⟩

theorem update_graph_demand (Q : Finset ℕ) (p : ℕ) (parent old seed : ℕ → ℕ)
    (hp : p.Prime) (hpQ : p ∉ Q)
    (hparent : ∀ n, Demand Edge (vertices Q n) (parent n))
    (hold : ∀ n, Demand Edge (vertices (insert p Q) n) (old n))
    (hseed : ∀ n, Demand Edge (vertices (insert p Q) n) (seed n)) :
    ∀ n, Demand Edge (vertices (insert p Q) n) (update p parent old seed n) := by
  apply update_demand (vertices (insert p Q)) (vertices Q)
    (fun n => (vertices (insert p Q) (n / p)).image (fun x => p*x))
    p parent old seed hp.one_lt
  · intro n hn
    exact vertices_mono _ (by omega)
  · intro n
    rw [← vertices_partition Q p n hp hpQ]
  · intro n
    exact vertices_disjoint Q p n hp hpQ
  · exact hparent
  · intro n r h
    exact demand_scaled _ _ _ hp.pos h
  · exact hold
  · exact hseed

theorem tail_graph_demand (Q : Finset ℕ) (p X : ℕ) (parent table : ℕ → ℕ)
    (hp : p.Prime) (hpQ : p ∉ Q)
    (hparent : ∀ n, Demand Edge (vertices Q n) (parent n))
    (hsmall : ∀ n, n ≤ X → Demand Edge (vertices (insert p Q) n) (table n)) :
    ∀ n, Demand Edge (vertices (insert p Q) n) (tail p X parent table n) := by
  intro n
  induction n using Nat.strong_induction_on with
  | h n ih =>
    by_cases hs : n ≤ X
    · rw [tail_small p X parent table hs]
      exact hsmall n hs
    · have hl : X < n := Nat.lt_of_not_ge hs
      rw [tail_large p X parent table hl hp.one_lt]
      exact demand_recurrence Q p n _ _ hp hpQ (hparent n)
        (ih (n / p) (Nat.div_lt_self (by omega) hp.one_lt))

/-- A finite or infinite chain of max updates: the only graph assumptions are
base, old, and seed validity, plus the prime insertion schedule. -/
theorem levels_graph_demand (Q : ℕ → Finset ℕ) (p : ℕ → ℕ)
    (u old seed : ℕ → ℕ → ℕ)
    (hp : ∀ j, (p j).Prime) (hfresh : ∀ j, p j ∉ Q j)
    (hQ : ∀ j, Q (j+1) = insert (p j) (Q j))
    (hbase : ∀ n, Demand Edge (vertices (Q 0) n) (u 0 n))
    (hupdate : ∀ j, u (j+1) = update (p j) (u j) (old j) (seed j))
    (hold : ∀ j n, Demand Edge (vertices (Q (j+1)) n) (old j n))
    (hseed : ∀ j n, Demand Edge (vertices (Q (j+1)) n) (seed j n)) :
    ∀ j n, Demand Edge (vertices (Q j) n) (u j n) := by
  intro j
  induction j with
  | zero => exact hbase
  | succ j ih =>
    have ho : ∀ n, Demand Edge (vertices (insert (p j) (Q j)) n) (old j n) := by
      simpa only [hQ j] using hold j
    have hs : ∀ n, Demand Edge (vertices (insert (p j) (Q j)) n) (seed j n) := by
      simpa only [hQ j] using hseed j
    rw [hQ j, hupdate j]
    exact update_graph_demand (Q j) (p j) (u j) (old j) (seed j)
      (hp j) (hfresh j) ih ho hs

#print axioms update_graph_demand
#print axioms tail_graph_demand
#print axioms levels_graph_demand
end DemandRenewalChain
