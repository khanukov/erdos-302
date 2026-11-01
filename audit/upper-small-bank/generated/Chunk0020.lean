import UpperBank
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace BaselineSmall
theorem bank_node_2860 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1785, 2010, 15946} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1785, 2010, 15946}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1785, 2010, 15946, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2860
theorem bank_node_2861 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3774, 4930, 16095} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3774, 4930, 16095}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3774, 4930, 16095, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2861
theorem bank_node_2862 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3267, 3996, 17908} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3267, 3996, 17908}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3267, 3996, 17908, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2862
theorem bank_node_2863 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3075, 3700, 18204} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3075, 3700, 18204}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3075, 3700, 18204, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2863
theorem bank_node_2864 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3872, 4896, 18513} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3872, 4896, 18513}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3872, 4896, 18513, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2864
theorem bank_node_2865 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({7526, 12567, 18762} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{7526, 12567, 18762}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨7526, 12567, 18762, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2865
theorem bank_node_2866 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4514, 5883, 19398} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4514, 5883, 19398}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4514, 5883, 19398, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2866
theorem bank_node_2867 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({7215, 11440, 19536} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{7215, 11440, 19536}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨7215, 11440, 19536, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2867
theorem bank_node_2868 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3200, 3825, 19584} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3200, 3825, 19584}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3200, 3825, 19584, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2868
theorem bank_node_2869 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4961, 6642, 19602} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4961, 6642, 19602}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4961, 6642, 19602, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2869
theorem bank_node_2870 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({8610, 15334, 19635} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{8610, 15334, 19635}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨8610, 15334, 19635, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2870
theorem bank_node_2871 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4758, 6279, 19642} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4758, 6279, 19642}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4758, 6279, 19642, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2871
theorem bank_node_2872 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4340, 5565, 19716} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4340, 5565, 19716}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4340, 5565, 19716, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2872
theorem bank_node_2873 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1224, 1305, 19720} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1224, 1305, 19720}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1224, 1305, 19720, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2873
theorem bank_node_2874 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({140, 141, 19740} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{140, 141, 19740}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨140, 141, 19740, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2874
theorem bank_node_2875 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6555, 9804, 19780} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6555, 9804, 19780}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6555, 9804, 19780, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2875
theorem bank_node_2876 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({8586, 15147, 19822} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{8586, 15147, 19822}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨8586, 15147, 19822, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2876
theorem bank_node_2877 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3456, 4185, 19840} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3456, 4185, 19840}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3456, 4185, 19840, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2877
theorem bank_node_2878 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5203, 7052, 19844} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5203, 7052, 19844}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5203, 7052, 19844, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2878
theorem bank_node_2879 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6018, 8619, 19942} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6018, 8619, 19942}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6018, 8619, 19942, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2879
theorem bank_node_2880 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4588, 5957, 19964} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4588, 5957, 19964}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4588, 5957, 19964, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2880
theorem bank_node_2881 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1496, 1617, 19992} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1496, 1617, 19992}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1496, 1617, 19992, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2881
theorem bank_node_2883 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2223, 2584, 15912} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2223, 2584, 15912}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2223, 2584, 15912, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2883
theorem bank_node_2884 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4982, 7191, 16218} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4982, 7191, 16218}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4982, 7191, 16218, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2884
theorem bank_node_2885 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3230, 4674, 10455} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3230, 4674, 10455}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3230, 4674, 10455, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2885
theorem bank_node_2886 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({728, 777, 11544} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{728, 777, 11544}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨728, 777, 11544, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2886
theorem bank_node_2887 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4095, 6120, 12376} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4095, 6120, 12376}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4095, 6120, 12376, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2887
theorem bank_node_2888 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1035, 1116, 14260} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1035, 1116, 14260}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1035, 1116, 14260, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2888
theorem bank_node_2889 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({500, 516, 16125} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{500, 516, 16125}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨500, 516, 16125, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2889
theorem bank_node_2890 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({7614, 14175, 16450} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{7614, 14175, 16450}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨7614, 14175, 16450, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2890
theorem bank_node_2891 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({7100, 12141, 17100} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{7100, 12141, 17100}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨7100, 12141, 17100, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2891
theorem bank_node_2892 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3094, 3770, 17255} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3094, 3770, 17255}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3094, 3770, 17255, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2892
theorem bank_node_2893 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({7700, 13629, 17700} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{7700, 13629, 17700}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨7700, 13629, 17700, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2893
theorem bank_node_2894 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4284, 5580, 18445} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4284, 5580, 18445}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4284, 5580, 18445, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2894
theorem bank_node_2895 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3500, 4284, 19125} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3500, 4284, 19125}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3500, 4284, 19125, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2895
theorem bank_node_2896 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6270, 9295, 19266} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6270, 9295, 19266}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6270, 9295, 19266, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2896
theorem bank_node_2897 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2967, 3496, 19608} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2967, 3496, 19608}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2967, 3496, 19608, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2897
theorem bank_node_2898 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({7280, 11505, 19824} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{7280, 11505, 19824}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨7280, 11505, 19824, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2898
theorem bank_node_2899 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3354, 4030, 19995} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3354, 4030, 19995}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3354, 4030, 19995, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2899
theorem bank_node_2900 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6785, 10266, 20010} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6785, 10266, 20010}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6785, 10266, 20010, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2900
theorem bank_node_2901 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({141, 142, 20022} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{141, 142, 20022}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨141, 142, 20022, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2901
theorem bank_node_2902 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5246, 7095, 20130} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5246, 7095, 20130}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5246, 7095, 20130, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2902
theorem bank_node_2903 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({282, 286, 20163} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{282, 286, 20163}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨282, 286, 20163, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2903
theorem bank_node_2904 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({7881, 12922, 20202} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{7881, 12922, 20202}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨7881, 12922, 20202, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2904
theorem bank_node_2905 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({7015, 10736, 20240} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{7015, 10736, 20240}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨7015, 10736, 20240, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2905
theorem bank_node_2906 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6844, 10325, 20300} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6844, 10325, 20300}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6844, 10325, 20300, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2906
theorem bank_node_2907 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({142, 143, 20306} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{142, 143, 20306}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨142, 143, 20306, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2907
theorem bank_node_2908 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3968, 4929, 20352} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3968, 4929, 20352}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3968, 4929, 20352, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2908
theorem bank_node_2909 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5084, 6765, 20460} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5084, 6765, 20460}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5084, 6765, 20460, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2909
theorem bank_node_2910 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6307, 9116, 20468} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6307, 9116, 20468}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6307, 9116, 20468, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2910
theorem bank_node_2912 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({798, 847, 13794} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{798, 847, 13794}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨798, 847, 13794, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2912
theorem bank_node_2913 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1080, 1144, 19305} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1080, 1144, 19305}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1080, 1144, 19305, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2913
theorem bank_node_2914 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2015, 2976, 6240} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2015, 2976, 6240}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2015, 2976, 6240, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2914
theorem bank_node_2915 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2856, 3432, 17017} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2856, 3432, 17017}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2856, 3432, 17017, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2915
theorem bank_node_2916 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3509, 4350, 18150} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3509, 4350, 18150}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3509, 4350, 18150, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2916
theorem bank_node_2917 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({8700, 16269, 18700} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{8700, 16269, 18700}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨8700, 16269, 18700, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2917
theorem bank_node_2918 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6254, 9063, 20178} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6254, 9063, 20178}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6254, 9063, 20178, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2918
theorem bank_node_2919 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6786, 10150, 20475} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6786, 10150, 20475}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6786, 10150, 20475, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2919
theorem bank_node_2920 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({7952, 12993, 20496} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{7952, 12993, 20496}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨7952, 12993, 20496, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2920
theorem bank_node_2921 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2546, 2907, 20502} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2546, 2907, 20502}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2546, 2907, 20502, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2921
theorem bank_node_2922 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2295, 2584, 20520} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2295, 2584, 20520}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2295, 2584, 20520, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2922
theorem bank_node_2923 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({7076, 10797, 20532} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{7076, 10797, 20532}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨7076, 10797, 20532, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2923
theorem bank_node_2924 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({426, 435, 20590} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{426, 435, 20590}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨426, 435, 20590, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2924
theorem bank_node_2925 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({143, 144, 20592} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{143, 144, 20592}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨143, 144, 20592, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2925
theorem bank_node_2926 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4224, 5313, 20608} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4224, 5313, 20608}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4224, 5313, 20608, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2926
theorem bank_node_2927 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5734, 7943, 20618} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5734, 7943, 20618}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5734, 7943, 20618, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2927
theorem bank_node_2928 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3999, 4960, 20640} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3999, 4960, 20640}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3999, 4960, 20640, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2928
theorem bank_node_2929 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6726, 9975, 20650} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6726, 9975, 20650}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6726, 9975, 20650, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2929
theorem bank_node_2930 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3770, 4611, 20670} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3770, 4611, 20670}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3770, 4611, 20670, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2930
theorem bank_node_2931 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6545, 9570, 20706} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6545, 9570, 20706}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6545, 9570, 20706, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2931
theorem bank_node_2932 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({8436, 14212, 20757} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{8436, 14212, 20757}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨8436, 14212, 20757, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2932
theorem bank_node_2933 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6171, 8772, 20812} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6171, 8772, 20812}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6171, 8772, 20812, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2933
theorem bank_node_2934 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({8547, 14476, 20868} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{8547, 14476, 20868}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨8547, 14476, 20868, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2934
theorem bank_node_2935 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({710, 735, 20874} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{710, 735, 20874}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨710, 735, 20874, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2935
theorem bank_node_2936 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({144, 145, 20880} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{144, 145, 20880}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨144, 145, 20880, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2936
theorem bank_node_2937 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({7705, 12194, 20930} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{7705, 12194, 20930}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨7705, 12194, 20930, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2937
theorem bank_node_2938 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({8400, 14025, 20944} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{8400, 14025, 20944}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨8400, 14025, 20944, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2938
theorem bank_node_2939 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5580, 7605, 20956} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5580, 7605, 20956}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5580, 7605, 20956, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2939
theorem bank_node_2941 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2420, 2820, 17061} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2420, 2820, 17061}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2420, 2820, 17061, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2941
theorem bank_node_2942 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1326, 1495, 11730} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1326, 1495, 11730}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1326, 1495, 11730, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2942
theorem bank_node_2943 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({98, 102, 2499} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{98, 102, 2499}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨98, 102, 2499, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2943
theorem bank_node_2944 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6968, 11457, 17784} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6968, 11457, 17784}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6968, 11457, 17784, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2944
theorem bank_node_2945 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3782, 4743, 18666} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3782, 4743, 18666}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3782, 4743, 18666, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2945
theorem bank_node_2946 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6549, 10030, 18870} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6549, 10030, 18870}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6549, 10030, 18870, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2946
theorem bank_node_2947 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1206, 1287, 19162} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1206, 1287, 19162}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1206, 1287, 19162, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2947
theorem bank_node_2948 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1596, 1740, 19285} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1596, 1740, 19285}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1596, 1740, 19285, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2948
theorem bank_node_2949 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2666, 4515, 6510} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2666, 4515, 6510}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2666, 4515, 6510, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2949
theorem bank_node_2950 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5880, 8281, 20280} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5880, 8281, 20280}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5880, 8281, 20280, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2950
theorem bank_node_2951 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4875, 6396, 20500} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4875, 6396, 20500}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4875, 6396, 20500, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2951
theorem bank_node_2952 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6903, 10384, 20592} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6903, 10384, 20592}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6903, 10384, 20592, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2952
theorem bank_node_2953 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2584, 2945, 21080} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2584, 2945, 21080}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2584, 2945, 21080, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2953
theorem bank_node_2954 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({10296, 20097, 21112} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{10296, 20097, 21112}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨10296, 20097, 21112, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2954
theorem bank_node_2955 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4515, 5740, 21156} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4515, 5740, 21156}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4515, 5740, 21156, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2955
theorem bank_node_2956 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({715, 740, 21164} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{715, 740, 21164}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨715, 740, 21164, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2956
theorem bank_node_2957 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({7772, 12261, 21228} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{7772, 12261, 21228}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨7772, 12261, 21228, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2957
theorem bank_node_2958 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3350, 3975, 21306} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3350, 3975, 21306}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3350, 3975, 21306, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2958
theorem bank_node_2959 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({10070, 19095, 21306} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{10070, 19095, 21306}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨10070, 19095, 21306, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2959
theorem bank_node_2960 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6466, 9275, 21350} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6466, 9275, 21350}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6466, 9275, 21350, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2960
theorem bank_node_2961 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({8165, 13206, 21390} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{8165, 13206, 21390}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨8165, 13206, 21390, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2961
theorem bank_node_2962 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({7259, 10980, 21420} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{7259, 10980, 21420}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨7259, 10980, 21420, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2962
end BaselineSmall
