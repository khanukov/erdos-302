import UpperBridge
set_option maxRecDepth 10000
namespace OptimizedSmall
theorem bank_node_4022 : ∀ S : Finset ℕ, UpperBridge.OrderedCover ({390, 490, 1911} : Finset ℕ) S → 1 ≤ S.card := by
  intro S h
  have he : UpperBridge.OrderedEdge ({390, 490, 1911} : Finset ℕ) 390 490 1911 := by
    refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
    · simp only [Finset.mem_insert, Finset.mem_singleton, true_or]
    · simp only [Finset.mem_insert, Finset.mem_singleton, or_true, true_or]
    · simp only [Finset.mem_insert, Finset.mem_singleton, or_true, true_or]
    · norm_num1
    · norm_num1
    · norm_num1
    · norm_num1
  rcases h 390 490 1911 he with ha | hb | hc
  · exact Finset.card_pos.mpr ⟨390, ha⟩
  · exact Finset.card_pos.mpr ⟨490, hb⟩
  · exact Finset.card_pos.mpr ⟨1911, hc⟩
#print axioms bank_node_4022
end OptimizedSmall
