import Bridge

example : SmallStd.Checked [6, 10, 15] [(0, 1, 2)] 1 := by decide
example : ([6, 10, 15] : List ℕ).Nodup := by decide

theorem triangle_cover (S : Finset ℕ)
    (h : UpperBridge.OrderedCover ({6, 10, 15} : Finset ℕ) S) : 1 ≤ S.card := by
  have hc : SmallStd.Checked [6, 10, 15] [(0, 1, 2)] 1 := by decide
  have hn : ([6, 10, 15] : List ℕ).Nodup := by decide
  exact SmallStd.cover_lower hc hn S (by simpa using h)

#print axioms triangle_cover
#print axioms SmallStd.finite_card_bound
