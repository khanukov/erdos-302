import UpperBank
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace BaselineSmall
theorem bank_node_2756 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4674, 6355, 17670} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4674, 6355, 17670}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4674, 6355, 17670, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2756
theorem bank_node_2757 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({8645, 16926, 17670} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{8645, 16926, 17670}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨8645, 16926, 17670, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2757
theorem bank_node_2758 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2806, 3335, 17690} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2806, 3335, 17690}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2806, 3335, 17690, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2758
theorem bank_node_2759 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6720, 10816, 17745} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6720, 10816, 17745}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6720, 10816, 17745, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2759
theorem bank_node_2760 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1292, 1653, 5916} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1292, 1653, 5916}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1292, 1653, 5916, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2760
theorem bank_node_2761 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4292, 5661, 17748} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4292, 5661, 17748}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4292, 5661, 17748, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2761
theorem bank_node_2762 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2125, 2414, 17750} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2125, 2414, 17750}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2125, 2414, 17750, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2762
theorem bank_node_2763 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({8740, 17204, 17765} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{8740, 17204, 17765}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨8740, 17204, 17765, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2763
theorem bank_node_2764 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({133, 134, 17822} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{133, 134, 17822}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨133, 134, 17822, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2764
theorem bank_node_2765 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({8835, 17484, 17860} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{8835, 17484, 17860}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨8835, 17484, 17860, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2765
theorem bank_node_2766 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6678, 10647, 17914} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6678, 10647, 17914}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6678, 10647, 17914, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2766
theorem bank_node_2767 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({8330, 15555, 17934} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{8330, 15555, 17934}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨8330, 15555, 17934, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2767
theorem bank_node_2768 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({8736, 17017, 17952} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{8736, 17017, 17952}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨8736, 17017, 17952, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2768
theorem bank_node_2769 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({8930, 17766, 17955} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{8930, 17766, 17955}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨8930, 17766, 17955, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2769
theorem bank_node_2771 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1560, 1729, 15960} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1560, 1729, 15960}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1560, 1729, 15960, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2771
theorem bank_node_2772 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3626, 4995, 13230} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3626, 4995, 13230}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3626, 4995, 13230, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2772
theorem bank_node_2773 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3038, 3999, 12642} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3038, 3999, 12642}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3038, 3999, 12642, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2773
theorem bank_node_2774 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3705, 5226, 12730} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3705, 5226, 12730}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3705, 5226, 12730, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2774
theorem bank_node_2775 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2090, 2451, 14190} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2090, 2451, 14190}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2090, 2451, 14190, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2775
theorem bank_node_2776 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({650, 819, 3150} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{650, 819, 3150}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨650, 819, 3150, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2776
theorem bank_node_2777 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1815, 2040, 16456} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1815, 2040, 16456}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1815, 2040, 16456, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2777
theorem bank_node_2778 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4592, 6273, 17136} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4592, 6273, 17136}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4592, 6273, 17136, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2778
theorem bank_node_2779 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6344, 10065, 17160} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6344, 10065, 17160}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6344, 10065, 17160, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2779
theorem bank_node_2780 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6834, 11323, 17238} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6834, 11323, 17238}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6834, 11323, 17238, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2780
theorem bank_node_2781 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3422, 4263, 17346} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3422, 4263, 17346}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3422, 4263, 17346, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2781
theorem bank_node_2782 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4816, 6665, 17360} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4816, 6665, 17360}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4816, 6665, 17360, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2782
theorem bank_node_2783 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({903, 952, 17544} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{903, 952, 17544}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨903, 952, 17544, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2783
theorem bank_node_2784 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5264, 7473, 17808} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5264, 7473, 17808}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5264, 7473, 17808, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2784
theorem bank_node_2785 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1664, 1833, 18048} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1664, 1833, 18048}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1664, 1833, 18048, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2785
theorem bank_node_2786 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({7035, 11524, 18060} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{7035, 11524, 18060}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨7035, 11524, 18060, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2786
theorem bank_node_2787 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({399, 408, 18088} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{399, 408, 18088}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨399, 408, 18088, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2787
theorem bank_node_2788 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({134, 135, 18090} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{134, 135, 18090}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨134, 135, 18090, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2788
theorem bank_node_2789 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({8526, 16095, 18130} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{8526, 16095, 18130}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨8526, 16095, 18130, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2789
theorem bank_node_2790 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({7384, 12425, 18200} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{7384, 12425, 18200}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨7384, 12425, 18200, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2790
theorem bank_node_2791 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5883, 8692, 18204} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5883, 8692, 18204}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5883, 8692, 18204, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2791
theorem bank_node_2792 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6588, 10309, 18252} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6588, 10309, 18252}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6588, 10309, 18252, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2792
theorem bank_node_2793 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4366, 5735, 18290} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4366, 5735, 18290}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4366, 5735, 18290, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2793
theorem bank_node_2794 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1920, 2145, 18304} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1920, 2145, 18304}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1920, 2145, 18304, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2794
theorem bank_node_2795 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({8514, 15910, 18315} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{8514, 15910, 18315}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨8514, 15910, 18315, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2795
theorem bank_node_2796 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5358, 7567, 18354} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5358, 7567, 18354}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5358, 7567, 18354, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2796
theorem bank_node_2797 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({135, 136, 18360} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{135, 136, 18360}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨135, 136, 18360, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2797
theorem bank_node_2798 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3751, 4712, 18392} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3751, 4712, 18392}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3751, 4712, 18392, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2798
theorem bank_node_2799 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4988, 6837, 18444} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4988, 6837, 18444}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4988, 6837, 18444, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2799
theorem bank_node_2800 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({7455, 12496, 18480} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{7455, 12496, 18480}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨7455, 12496, 18480, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2800
theorem bank_node_2802 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({896, 945, 17280} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{896, 945, 17280}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨896, 945, 17280, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2802
theorem bank_node_2803 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2618, 3774, 8547} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2618, 3774, 8547}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2618, 3774, 8547, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2803
theorem bank_node_2804 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2280, 2856, 11305} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2280, 2856, 11305}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2280, 2856, 11305, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2804
theorem bank_node_2805 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3255, 4216, 14280} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3255, 4216, 14280}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3255, 4216, 14280, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2805
theorem bank_node_2806 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1452, 1596, 16093} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1452, 1596, 16093}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1452, 1596, 16093, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2806
theorem bank_node_2807 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1364, 1485, 16740} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1364, 1485, 16740}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1364, 1485, 16740, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2807
theorem bank_node_2808 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2618, 3102, 16779} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2618, 3102, 16779}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2618, 3102, 16779, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2808
theorem bank_node_2809 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4773, 6622, 17094} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4773, 6622, 17094}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4773, 6622, 17094, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2809
theorem bank_node_2810 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2000, 2256, 17625} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2000, 2256, 17625}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2000, 2256, 17625, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2810
theorem bank_node_2811 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1677, 1846, 18318} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1677, 1846, 18318}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1677, 1846, 18318, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2811
theorem bank_node_2812 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1806, 2002, 18447} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1806, 2002, 18447}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1806, 2002, 18447, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2812
theorem bank_node_2813 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({7314, 12075, 18550} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{7314, 12075, 18550}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨7314, 12075, 18550, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2813
theorem bank_node_2814 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2176, 2465, 18560} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2176, 2465, 18560}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2176, 2465, 18560, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2814
theorem bank_node_2815 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6490, 9971, 18590} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6490, 9971, 18590}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6490, 9971, 18590, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2815
theorem bank_node_2816 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5405, 7614, 18630} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5405, 7614, 18630}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5405, 7614, 18630, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2816
theorem bank_node_2817 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3567, 4408, 18696} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3567, 4408, 18696}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3567, 4408, 18696, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2817
theorem bank_node_2818 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5031, 6880, 18720} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5031, 6880, 18720}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5031, 6880, 18720, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2818
theorem bank_node_2819 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6438, 9802, 18759} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6438, 9802, 18759}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6438, 9802, 18759, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2819
theorem bank_node_2820 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({9009, 17290, 18810} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{9009, 17290, 18810}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨9009, 17290, 18810, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2820
theorem bank_node_2821 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2432, 2793, 18816} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2432, 2793, 18816}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2432, 2793, 18816, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2821
theorem bank_node_2822 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5635, 8036, 18860} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5635, 8036, 18860}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5635, 8036, 18860, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2822
theorem bank_node_2823 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({938, 987, 18894} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{938, 987, 18894}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨938, 987, 18894, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2823
theorem bank_node_2824 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4026, 5115, 18910} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4026, 5115, 18910}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4026, 5115, 18910, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2824
theorem bank_node_2825 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6384, 9633, 18928} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6384, 9633, 18928}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6384, 9633, 18928, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2825
theorem bank_node_2826 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3596, 4437, 18972} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3596, 4437, 18972}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3596, 4437, 18972, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2826
theorem bank_node_2827 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5074, 6923, 18998} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5074, 6923, 18998}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5074, 6923, 18998, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2827
theorem bank_node_2828 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3375, 4104, 19000} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3375, 4104, 19000}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3375, 4104, 19000, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2828
theorem bank_node_2830 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({969, 1258, 4218} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{969, 1258, 4218}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨969, 1258, 4218, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2830
theorem bank_node_2831 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2852, 3813, 11316} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2852, 3813, 11316}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2852, 3813, 11316, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2831
theorem bank_node_2832 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3731, 5412, 12012} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3731, 5412, 12012}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3731, 5412, 12012, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2832
theorem bank_node_2833 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4182, 5863, 14586} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4182, 5863, 14586}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4182, 5863, 14586, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2833
theorem bank_node_2834 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3885, 5254, 14910} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3885, 5254, 14910}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3885, 5254, 14910, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2834
theorem bank_node_2835 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({624, 880, 2145} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{624, 880, 2145}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨624, 880, 2145, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2835
theorem bank_node_2836 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1547, 1716, 15708} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1547, 1716, 15708}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1547, 1716, 15708, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2836
theorem bank_node_2837 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5406, 8215, 15810} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5406, 8215, 15810}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5406, 8215, 15810, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2837
theorem bank_node_2838 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1586, 1755, 16470} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1586, 1755, 16470}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1586, 1755, 16470, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2838
theorem bank_node_2839 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3132, 3861, 16588} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3132, 3861, 16588}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3132, 3861, 16588, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2839
theorem bank_node_2840 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3276, 4060, 16965} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3276, 4060, 16965}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3276, 4060, 16965, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2840
theorem bank_node_2841 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2852, 3381, 18228} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2852, 3381, 18228}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2852, 3381, 18228, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2841
theorem bank_node_2842 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1430, 1551, 18330} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1430, 1551, 18330}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1430, 1551, 18330, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2842
theorem bank_node_2843 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4235, 5460, 18876} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4235, 5460, 18876}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4235, 5460, 18876, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2843
theorem bank_node_2844 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1197, 1278, 18886} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1197, 1278, 18886}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1197, 1278, 18886, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2844
theorem bank_node_2845 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({7236, 11725, 18900} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{7236, 11725, 18900}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨7236, 11725, 18900, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2845
theorem bank_node_2846 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3813, 4774, 18942} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3813, 4774, 18942}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3813, 4774, 18942, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2846
theorem bank_node_2847 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4879, 6560, 19040} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4879, 6560, 19040}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4879, 6560, 19040, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2847
theorem bank_node_2848 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3936, 4960, 19065} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3936, 4960, 19065}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3936, 4960, 19065, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2848
theorem bank_node_2849 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6771, 10492, 19092} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6771, 10492, 19092}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6771, 10492, 19092, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2849
theorem bank_node_2850 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6608, 10089, 19152} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6608, 10089, 19152}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6608, 10089, 19152, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2850
theorem bank_node_2851 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5499, 7708, 19188} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5499, 7708, 19188}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5499, 7708, 19188, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2851
theorem bank_node_2852 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({8424, 14985, 19240} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{8424, 14985, 19240}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨8424, 14985, 19240, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2852
theorem bank_node_2853 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6095, 8904, 19320} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6095, 8904, 19320}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6095, 8904, 19320, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2853
theorem bank_node_2854 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1474, 1595, 19430} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1474, 1595, 19430}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1474, 1595, 19430, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2854
theorem bank_node_2855 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({952, 1001, 19448} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{952, 1001, 19448}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨952, 1001, 19448, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2855
theorem bank_node_2857 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({444, 460, 12765} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{444, 460, 12765}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨444, 460, 12765, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2857
theorem bank_node_2858 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({115, 116, 13340} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{115, 116, 13340}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨115, 116, 13340, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2858
theorem bank_node_2859 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({462, 583, 2226} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{462, 583, 2226}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨462, 583, 2226, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2859
end BaselineSmall
