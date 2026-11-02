import DemandRenewalChain

open SmoothRenewal RenewalNext DemandRenewalChain

example (Q : Finset ℕ) (p : ℕ) (parent old seed : ℕ → ℕ)
    (hp : p.Prime) (hpQ : p ∉ Q)
    (hparent : ∀ n, Demand Edge (vertices Q n) (parent n))
    (hold : ∀ n, Demand Edge (vertices (insert p Q) n) (old n))
    (hseed : ∀ n, Demand Edge (vertices (insert p Q) n) (seed n)) :
    ∀ n, Demand Edge (vertices (insert p Q) n) (update p parent old seed n) :=
  update_graph_demand Q p parent old seed hp hpQ hparent hold hseed

example (Q : Finset ℕ) (p X : ℕ) (parent table : ℕ → ℕ)
    (hp : p.Prime) (hpQ : p ∉ Q)
    (hparent : ∀ n, Demand Edge (vertices Q n) (parent n))
    (hsmall : ∀ n, n ≤ X → Demand Edge (vertices (insert p Q) n) (table n)) :
    ∀ n, Demand Edge (vertices (insert p Q) n) (tail p X parent table n) :=
  tail_graph_demand Q p X parent table hp hpQ hparent hsmall

#print axioms DemandRenewalChain.update_graph_demand
#print axioms DemandRenewalChain.tail_graph_demand
#print axioms DemandRenewalChain.levels_graph_demand
