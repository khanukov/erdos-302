import UpperBank
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace BaselineSmall
theorem bank_node_1716 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2074, 3230, 5795} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2074, 3230, 5795}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2074, 3230, 5795, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1716
theorem bank_node_1718 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({488, 552, 4209} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{488, 552, 4209}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨488, 552, 4209, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1718
theorem bank_node_1719 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({390, 426, 4615} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{390, 426, 4615}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨390, 426, 4615, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1719
theorem bank_node_1720 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2124, 3420, 5605} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2124, 3420, 5605}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2124, 3420, 5605, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1720
theorem bank_node_1721 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({440, 504, 3465} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{440, 504, 3465}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨440, 504, 3465, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1721
theorem bank_node_1722 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1242, 1771, 4158} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1242, 1771, 4158}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1242, 1771, 4158, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1722
theorem bank_node_1723 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({704, 825, 4800} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{704, 825, 4800}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨704, 825, 4800, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1723
theorem bank_node_1724 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1344, 1785, 5440} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1344, 1785, 5440}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1344, 1785, 5440, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1724
theorem bank_node_1725 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1827, 2668, 5796} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1827, 2668, 5796}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1827, 2668, 5796, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1725
theorem bank_node_1726 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({782, 1311, 1938} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{782, 1311, 1938}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨782, 1311, 1938, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1726
theorem bank_node_1727 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({781, 902, 5822} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{781, 902, 5822}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨781, 902, 5822, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1727
theorem bank_node_1728 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2805, 5406, 5830} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2805, 5406, 5830}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2805, 5406, 5830, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1728
theorem bank_node_1729 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2360, 3960, 5841} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2360, 3960, 5841}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2360, 3960, 5841, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1729
theorem bank_node_1730 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({76, 77, 5852} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{76, 77, 5852}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨76, 77, 5852, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1730
theorem bank_node_1731 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2135, 3360, 5856} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2135, 3360, 5856}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2135, 3360, 5856, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1731
theorem bank_node_1732 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({360, 441, 1960} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{360, 441, 1960}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨360, 441, 1960, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1732
theorem bank_node_1733 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2046, 3135, 5890} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2046, 3135, 5890}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2046, 3135, 5890, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1733
theorem bank_node_1734 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1407, 1848, 5896} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1407, 1848, 5896}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1407, 1848, 5896, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1734
theorem bank_node_1735 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2419, 4100, 5900} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2419, 4100, 5900}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2419, 4100, 5900, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1735
theorem bank_node_1737 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({860, 1260, 2709} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{860, 1260, 2709}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨860, 1260, 2709, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1737
theorem bank_node_1738 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({574, 770, 2255} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{574, 770, 2255}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨574, 770, 2255, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1738
theorem bank_node_1739 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1880, 3480, 4089} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1880, 3480, 4089}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1880, 3480, 4089, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1739
theorem bank_node_1740 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({492, 636, 2173} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{492, 636, 2173}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨492, 636, 2173, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1740
theorem bank_node_1741 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2378, 4059, 5742} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2378, 4059, 5742}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2378, 4059, 5742, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1741
theorem bank_node_1742 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({483, 532, 5244} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{483, 532, 5244}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨483, 532, 5244, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1742
theorem bank_node_1743 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1206, 1530, 5695} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1206, 1530, 5695}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1206, 1530, 5695, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1743
theorem bank_node_1744 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1953, 2914, 5922} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1953, 2914, 5922}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1953, 2914, 5922, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1744
theorem bank_node_1745 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2679, 4888, 5928} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2679, 4888, 5928}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2679, 4888, 5928, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1745
theorem bank_node_1746 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1173, 1462, 5934} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1173, 1462, 5934}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1173, 1462, 5934, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1746
theorem bank_node_1747 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2915, 5724, 5940} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2915, 5724, 5940}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2915, 5724, 5940, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1747
theorem bank_node_1748 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1856, 2697, 5952} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1856, 2697, 5952}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1856, 2697, 5952, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1748
theorem bank_node_1749 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2257, 3626, 5978} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2257, 3626, 5978}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2257, 3626, 5978, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1749
theorem bank_node_1750 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1755, 2484, 5980} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1755, 2484, 5980}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1755, 2484, 5980, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1750
theorem bank_node_1751 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2016, 3040, 5985} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2016, 3040, 5985}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2016, 3040, 5985, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1751
theorem bank_node_1752 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({629, 918, 1998} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{629, 918, 1998}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨629, 918, 1998, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1752
theorem bank_node_1754 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1161, 1890, 3010} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1161, 1890, 3010}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1161, 1890, 3010, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1754
theorem bank_node_1755 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({660, 804, 3685} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{660, 804, 3685}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨660, 804, 3685, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1755
theorem bank_node_1756 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({284, 300, 5325} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{284, 300, 5325}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨284, 300, 5325, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1756
theorem bank_node_1757 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({874, 1235, 2990} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{874, 1235, 2990}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨874, 1235, 2990, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1757
theorem bank_node_1758 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({413, 462, 3894} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{413, 462, 3894}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨413, 462, 3894, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1758
theorem bank_node_1759 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({315, 340, 4284} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{315, 340, 4284}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨315, 340, 4284, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1759
theorem bank_node_1760 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({806, 975, 4650} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{806, 975, 4650}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨806, 975, 4650, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1760
theorem bank_node_1761 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({536, 600, 5025} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{536, 600, 5025}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨536, 600, 5025, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1761
theorem bank_node_1762 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2072, 3441, 5208} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2072, 3441, 5208}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2072, 3441, 5208, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1762
theorem bank_node_1763 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1386, 1870, 5355} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1386, 1870, 5355}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1386, 1870, 5355, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1763
theorem bank_node_1764 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({518, 567, 5994} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{518, 567, 5994}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨518, 567, 5994, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1764
theorem bank_node_1765 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({77, 78, 6006} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{77, 78, 6006}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨77, 78, 6006, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1765
theorem bank_node_1766 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2537, 4386, 6018} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2537, 4386, 6018}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2537, 4386, 6018, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1766
theorem bank_node_1767 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2318, 3762, 6039} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2318, 3762, 6039}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2318, 3762, 6039, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1767
theorem bank_node_1768 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2793, 5194, 6042} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2793, 5194, 6042}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2793, 5194, 6042, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1768
theorem bank_node_1769 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1984, 2945, 6080} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1984, 2945, 6080}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1984, 2945, 6080, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1769
theorem bank_node_1770 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2726, 4935, 6090} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2726, 4935, 6090}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2726, 4935, 6090, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1770
theorem bank_node_1771 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2379, 3900, 6100} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2379, 3900, 6100}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2379, 3900, 6100, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1771
theorem bank_node_1773 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({396, 477, 2332} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{396, 477, 2332}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨396, 477, 2332, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1773
theorem bank_node_1774 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1645, 2870, 3854} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1645, 2870, 3854}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1645, 2870, 3854, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1774
theorem bank_node_1775 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({962, 1638, 2331} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{962, 1638, 2331}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨962, 1638, 2331, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1775
theorem bank_node_1776 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1850, 3219, 4350} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1850, 3219, 4350}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1850, 3219, 4350, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1776
theorem bank_node_1777 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1121, 1482, 4602} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1121, 1482, 4602}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1121, 1482, 4602, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1777
theorem bank_node_1778 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1235, 1596, 5460} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1235, 1596, 5460}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1235, 1596, 5460, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1778
theorem bank_node_1779 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1728, 2457, 5824} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1728, 2457, 5824}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1728, 2457, 5824, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1779
theorem bank_node_1780 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1065, 1290, 6106} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1065, 1290, 6106}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1065, 1290, 6106, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1780
theorem bank_node_1781 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1885, 2726, 6110} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1885, 2726, 6110}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1885, 2726, 6110, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1781
theorem bank_node_1782 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2655, 4680, 6136} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2655, 4680, 6136}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2655, 4680, 6136, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1782
theorem bank_node_1783 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({525, 574, 6150} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{525, 574, 6150}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨525, 574, 6150, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1783
theorem bank_node_1784 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1675, 2300, 6164} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1675, 2300, 6164}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1675, 2300, 6164, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1784
theorem bank_node_1785 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1136, 1392, 6177} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1136, 1392, 6177}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1136, 1392, 6177, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1785
theorem bank_node_1786 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({924, 1708, 2013} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{924, 1708, 2013}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨924, 1708, 2013, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1786
theorem bank_node_1787 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2294, 3663, 6138} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2294, 3663, 6138}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2294, 3663, 6138, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1787
theorem bank_node_1788 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3080, 6105, 6216} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3080, 6105, 6216}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3080, 6105, 6216, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1788
theorem bank_node_1789 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2501, 4182, 6222} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2501, 4182, 6222}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2501, 4182, 6222, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1789
theorem bank_node_1790 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1742, 2418, 6231} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1742, 2418, 6231}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1742, 2418, 6231, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1790
theorem bank_node_1791 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1207, 1496, 6248} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1207, 1496, 6248}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1207, 1496, 6248, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1791
theorem bank_node_1792 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2773, 4982, 6254} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2773, 4982, 6254}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2773, 4982, 6254, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1792
theorem bank_node_1793 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3021, 5830, 6270} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3021, 5830, 6270}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3021, 5830, 6270, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1793
theorem bank_node_1794 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1809, 2538, 6298} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1809, 2538, 6298}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1809, 2538, 6298, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1794
theorem bank_node_1795 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2331, 3700, 6300} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2331, 3700, 6300}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2331, 3700, 6300, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1795
theorem bank_node_1796 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1020, 1420, 3621} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1020, 1420, 3621}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1020, 1420, 3621, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1796
theorem bank_node_1797 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2623, 4472, 6344} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2623, 4472, 6344}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2623, 4472, 6344, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1797
theorem bank_node_1798 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2891, 5292, 6372} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2891, 5292, 6372}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2891, 5292, 6372, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1798
theorem bank_node_1799 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3135, 6160, 6384} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3135, 6160, 6384}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3135, 6160, 6384, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1799
theorem bank_node_1800 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1860, 2821, 5460} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1860, 2821, 5460}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1860, 2821, 5460, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1800
theorem bank_node_1801 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({814, 935, 6290} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{814, 935, 6290}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨814, 935, 6290, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1801
theorem bank_node_1802 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2145, 3234, 6370} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2145, 3234, 6370}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2145, 3234, 6370, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1802
theorem bank_node_1803 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2684, 4620, 6405} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2684, 4620, 6405}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2684, 4620, 6405, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1803
theorem bank_node_1804 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({986, 1827, 2142} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{986, 1827, 2142}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨986, 1827, 2142, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1804
theorem bank_node_1805 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1056, 2080, 2145} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1056, 2080, 2145}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1056, 2080, 2145, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1805
theorem bank_node_1806 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({962, 1131, 6438} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{962, 1131, 6438}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨962, 1131, 6438, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1806
theorem bank_node_1807 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3074, 5883, 6438} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3074, 5883, 6438}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3074, 5883, 6438, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1807
theorem bank_node_1808 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({825, 946, 6450} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{825, 946, 6450}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨825, 946, 6450, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1808
theorem bank_node_1809 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({684, 765, 6460} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{684, 765, 6460}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨684, 765, 6460, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1809
theorem bank_node_1810 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1420, 1820, 6461} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1420, 1820, 6461}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1420, 1820, 6461, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1810
theorem bank_node_1811 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2745, 4770, 6466} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2745, 4770, 6466}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2745, 4770, 6466, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1811
theorem bank_node_1812 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({80, 81, 6480} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{80, 81, 6480}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨80, 81, 6480, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1812
theorem bank_node_1813 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1725, 2350, 6486} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1725, 2350, 6486}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1725, 2350, 6486, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1813
theorem bank_node_1814 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3009, 5610, 6490} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3009, 5610, 6490}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3009, 5610, 6490, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1814
theorem bank_node_1816 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2156, 4092, 4557} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2156, 4092, 4557}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2156, 4092, 4557, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1816
theorem bank_node_1817 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({354, 390, 3835} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{354, 390, 3835}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨354, 390, 3835, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1817
theorem bank_node_1818 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({215, 240, 2064} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{215, 240, 2064}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨215, 240, 2064, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1818
theorem bank_node_1819 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1491, 1932, 6532} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1491, 1932, 6532}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1491, 1932, 6532, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1819
theorem bank_node_1820 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3068, 5772, 6549} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3068, 5772, 6549}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3068, 5772, 6549, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1820
end BaselineSmall
