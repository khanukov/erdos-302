import UpperBank
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace BaselineSmall
theorem bank_node_0 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2, 3, 6} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2, 3, 6}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2, 3, 6, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_0
theorem bank_node_2 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4, 5, 20} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4, 5, 20}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4, 5, 20, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2
theorem bank_node_3 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6, 10, 15} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6, 10, 15}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6, 10, 15, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_3
theorem bank_node_6 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({12, 21, 28} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{12, 21, 28}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨12, 21, 28, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_6
theorem bank_node_9 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({10, 14, 35} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{10, 14, 35}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨10, 14, 35, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_9
theorem bank_node_10 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({15, 24, 40} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{15, 24, 40}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨15, 24, 40, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_10
theorem bank_node_16 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({7, 8, 56} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{7, 8, 56}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨7, 8, 56, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_16
theorem bank_node_17 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3, 4, 12} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3, 4, 12}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3, 4, 12, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_17
theorem bank_node_19 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({21, 30, 70} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{21, 30, 70}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨21, 30, 70, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_19
theorem bank_node_20 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({35, 60, 84} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{35, 60, 84}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨35, 60, 84, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_20
theorem bank_node_46 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5, 6, 30} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5, 6, 30}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5, 6, 30, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_46
theorem bank_node_47 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({56, 105, 120} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{56, 105, 120}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨56, 105, 120, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_47
theorem bank_node_51 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({14, 15, 210} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{14, 15, 210}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨14, 15, 210, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_51
theorem bank_node_52 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({15, 16, 240} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{15, 16, 240}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨15, 16, 240, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_52
theorem bank_node_55 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6, 7, 42} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6, 7, 42}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6, 7, 42, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_55
theorem bank_node_56 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({80, 105, 336} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{80, 105, 336}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨80, 105, 336, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_56
theorem bank_node_62 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({20, 21, 420} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{20, 21, 420}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨20, 21, 420, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_62
theorem bank_node_75 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({96, 105, 1120} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{96, 105, 1120}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨96, 105, 1120, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_75
theorem bank_node_84 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({20, 36, 45} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{20, 36, 45}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨20, 36, 45, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_84
theorem bank_node_85 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({14, 18, 63} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{14, 18, 63}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨14, 18, 63, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_85
theorem bank_node_86 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({30, 55, 66} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{30, 55, 66}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨30, 55, 66, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_86
theorem bank_node_87 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({8, 9, 72} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{8, 9, 72}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨8, 9, 72, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_87
theorem bank_node_88 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({28, 44, 77} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{28, 44, 77}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨28, 44, 77, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_88
theorem bank_node_89 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({24, 33, 88} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{24, 33, 88}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨24, 33, 88, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_89
theorem bank_node_90 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({9, 10, 90} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{9, 10, 90}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨9, 10, 90, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_90
theorem bank_node_91 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({42, 78, 91} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{42, 78, 91}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨42, 78, 91, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_91
theorem bank_node_92 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({18, 22, 99} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{18, 22, 99}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨18, 22, 99, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_92
theorem bank_node_93 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({40, 65, 104} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{40, 65, 104}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨40, 65, 104, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_93
theorem bank_node_94 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({10, 11, 110} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{10, 11, 110}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨10, 11, 110, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_94
theorem bank_node_95 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({36, 52, 117} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{36, 52, 117}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨36, 52, 117, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_95
theorem bank_node_96 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({45, 70, 126} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{45, 70, 126}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨45, 70, 126, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_96
theorem bank_node_97 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({30, 39, 130} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{30, 39, 130}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨30, 39, 130, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_97
theorem bank_node_98 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({11, 12, 132} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{11, 12, 132}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨11, 12, 132, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_98
theorem bank_node_99 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({22, 26, 143} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{22, 26, 143}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨22, 26, 143, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_99
theorem bank_node_100 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({63, 112, 144} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{63, 112, 144}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨63, 112, 144, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_100
theorem bank_node_101 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({72, 136, 153} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{72, 136, 153}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨72, 136, 153, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_101
theorem bank_node_102 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({33, 42, 154} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{33, 42, 154}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨33, 42, 154, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_102
theorem bank_node_103 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({12, 13, 156} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{12, 13, 156}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨12, 13, 156, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_103
theorem bank_node_104 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({44, 60, 165} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{44, 60, 165}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨44, 60, 165, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_104
theorem bank_node_105 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({70, 119, 170} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{70, 119, 170}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨70, 119, 170, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_105
theorem bank_node_106 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({55, 80, 176} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{55, 80, 176}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨55, 80, 176, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_106
theorem bank_node_107 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({13, 14, 182} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{13, 14, 182}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨13, 14, 182, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_107
theorem bank_node_108 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({66, 102, 187} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{66, 102, 187}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨66, 102, 187, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_108
theorem bank_node_109 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({90, 171, 190} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{90, 171, 190}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨90, 171, 190, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_109
theorem bank_node_110 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({26, 30, 195} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{26, 30, 195}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨26, 30, 195, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_110
theorem bank_node_111 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({77, 126, 198} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{77, 126, 198}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨77, 126, 198, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_111
theorem bank_node_112 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({60, 85, 204} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{60, 85, 204}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨60, 85, 204, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_112
theorem bank_node_113 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({39, 48, 208} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{39, 48, 208}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨39, 48, 208, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_113
theorem bank_node_114 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({88, 152, 209} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{88, 152, 209}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨88, 152, 209, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_114
theorem bank_node_115 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({99, 180, 220} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{99, 180, 220}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨99, 180, 220, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_115
theorem bank_node_116 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({52, 68, 221} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{52, 68, 221}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨52, 68, 221, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_116
theorem bank_node_117 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({84, 133, 228} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{84, 133, 228}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨84, 133, 228, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_117
theorem bank_node_118 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({110, 210, 231} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{110, 210, 231}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨110, 210, 231, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_118
theorem bank_node_119 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({65, 90, 234} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{65, 90, 234}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨65, 90, 234, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_119
theorem bank_node_120 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({42, 51, 238} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{42, 51, 238}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨42, 51, 238, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_120
theorem bank_node_121 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({78, 114, 247} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{78, 114, 247}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨78, 114, 247, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_121
theorem bank_node_122 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({30, 34, 255} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{30, 34, 255}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨30, 34, 255, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_122
theorem bank_node_123 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({91, 140, 260} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{91, 140, 260}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨91, 140, 260, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_123
theorem bank_node_124 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({70, 95, 266} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{70, 95, 266}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨70, 95, 266, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_124
theorem bank_node_125 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({16, 17, 272} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{16, 17, 272}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨16, 17, 272, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_125
theorem bank_node_126 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({104, 168, 273} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{104, 168, 273}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨104, 168, 273, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_126
theorem bank_node_127 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({132, 253, 276} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{132, 253, 276}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨132, 253, 276, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_127
theorem bank_node_128 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({60, 76, 285} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{60, 76, 285}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨60, 76, 285, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_128
theorem bank_node_129 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({117, 198, 286} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{117, 198, 286}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨117, 198, 286, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_129
theorem bank_node_130 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({130, 230, 299} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{130, 230, 299}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨130, 230, 299, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_130
theorem bank_node_131 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({48, 57, 304} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{48, 57, 304}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨48, 57, 304, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_131
theorem bank_node_132 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({17, 18, 306} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{17, 18, 306}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨17, 18, 306, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_132
theorem bank_node_133 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({143, 264, 312} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{143, 264, 312}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨143, 264, 312, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_133
theorem bank_node_134 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({126, 207, 322} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{126, 207, 322}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨126, 207, 322, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_134
theorem bank_node_135 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({34, 38, 323} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{34, 38, 323}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨34, 38, 323, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_135
theorem bank_node_136 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({156, 300, 325} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{156, 300, 325}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨156, 300, 325, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_136
theorem bank_node_137 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({105, 154, 330} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{105, 154, 330}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨105, 154, 330, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_137
theorem bank_node_138 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({51, 60, 340} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{51, 60, 340}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨51, 60, 340, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_138
theorem bank_node_139 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({18, 19, 342} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{18, 19, 342}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨18, 19, 342, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_139
theorem bank_node_140 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({120, 184, 345} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{120, 184, 345}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨120, 184, 345, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_140
theorem bank_node_141 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({154, 275, 350} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{154, 275, 350}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨154, 275, 350, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_141
theorem bank_node_142 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({68, 84, 357} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{68, 84, 357}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨68, 84, 357, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_142
theorem bank_node_143 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({112, 161, 368} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{112, 161, 368}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨112, 161, 368, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_143
theorem bank_node_144 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({85, 110, 374} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{85, 110, 374}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨85, 110, 374, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_144
theorem bank_node_145 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({182, 351, 378} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{182, 351, 378}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨182, 351, 378, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_145
theorem bank_node_146 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({19, 20, 380} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{19, 20, 380}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨19, 20, 380, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_146
theorem bank_node_147 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({165, 286, 390} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{165, 286, 390}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨165, 286, 390, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_147
theorem bank_node_148 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({102, 138, 391} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{102, 138, 391}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨102, 138, 391, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_148
theorem bank_node_149 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({38, 42, 399} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{38, 42, 399}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨38, 42, 399, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_149
theorem bank_node_150 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({144, 225, 400} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{144, 225, 400}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨144, 225, 400, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_150
theorem bank_node_151 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({119, 168, 408} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{119, 168, 408}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨119, 168, 408, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_151
theorem bank_node_152 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({90, 115, 414} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{90, 115, 414}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨90, 115, 414, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_152
theorem bank_node_153 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({57, 66, 418} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{57, 66, 418}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨57, 66, 418, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_153
theorem bank_node_154 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({195, 364, 420} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{195, 364, 420}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨195, 364, 420, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_154
theorem bank_node_155 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({136, 200, 425} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{136, 200, 425}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨136, 200, 425, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_155
theorem bank_node_156 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({176, 297, 432} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{176, 297, 432}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨176, 297, 432, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_156
theorem bank_node_157 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({210, 406, 435} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{210, 406, 435}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨210, 406, 435, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_157
theorem bank_node_158 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({76, 92, 437} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{76, 92, 437}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨76, 92, 437, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_158
theorem bank_node_159 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({153, 234, 442} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{153, 234, 442}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨153, 234, 442, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_159
theorem bank_node_160 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({126, 175, 450} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{126, 175, 450}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨126, 175, 450, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_160
theorem bank_node_161 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({95, 120, 456} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{95, 120, 456}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨95, 120, 456, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_161
theorem bank_node_162 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({170, 270, 459} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{170, 270, 459}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨170, 270, 459, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_162
theorem bank_node_163 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({60, 69, 460} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{60, 69, 460}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨60, 69, 460, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_163
theorem bank_node_164 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({21, 22, 462} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{21, 22, 462}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨21, 22, 462, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_164
theorem bank_node_165 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({208, 377, 464} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{208, 377, 464}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨208, 377, 464, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_165
end BaselineSmall
