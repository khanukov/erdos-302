import UpperBank
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace BaselineSmall
theorem bank_node_1613 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({213, 222, 5254} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{213, 222, 5254}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨213, 222, 5254, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1613
theorem bank_node_1614 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1040, 1296, 5265} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1040, 1296, 5265}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1040, 1296, 5265, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1614
theorem bank_node_1615 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1914, 3003, 5278} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1914, 3003, 5278}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1914, 3003, 5278, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1615
theorem bank_node_1616 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2255, 3936, 5280} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2255, 3936, 5280}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2255, 3936, 5280, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1616
theorem bank_node_1617 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2491, 4700, 5300} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2491, 4700, 5300}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2491, 4700, 5300, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1617
theorem bank_node_1619 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({861, 1302, 2542} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{861, 1302, 2542}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨861, 1302, 2542, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1619
theorem bank_node_1620 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({680, 969, 2280} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{680, 969, 2280}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨680, 969, 2280, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1620
theorem bank_node_1621 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({836, 1197, 2772} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{836, 1197, 2772}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨836, 1197, 2772, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1621
theorem bank_node_1622 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1406, 2775, 2850} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1406, 2775, 2850}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1406, 2775, 2850, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1622
theorem bank_node_1623 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1333, 2294, 3182} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1333, 2294, 3182}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1333, 2294, 3182, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1623
theorem bank_node_1624 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1316, 2100, 3525} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1316, 2100, 3525}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1316, 2100, 3525, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1624
theorem bank_node_1625 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({954, 1278, 3763} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{954, 1278, 3763}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨954, 1278, 3763, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1625
theorem bank_node_1626 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2070, 4095, 4186} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2070, 4095, 4186}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2070, 4095, 4186, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1626
theorem bank_node_1627 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1127, 1656, 3528} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1127, 1656, 3528}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1127, 1656, 3528, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1627
theorem bank_node_1628 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({767, 936, 4248} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{767, 936, 4248}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨767, 936, 4248, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1628
theorem bank_node_1629 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({828, 1357, 2124} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{828, 1357, 2124}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨828, 1357, 2124, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1629
theorem bank_node_1630 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({833, 1122, 3234} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{833, 1122, 3234}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨833, 1122, 3234, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1630
theorem bank_node_1631 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({627, 748, 3876} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{627, 748, 3876}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨627, 748, 3876, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1631
theorem bank_node_1632 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({588, 732, 2989} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{588, 732, 2989}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨588, 732, 2989, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1632
theorem bank_node_1633 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1196, 1725, 3900} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1196, 1725, 3900}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1196, 1725, 3900, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1633
theorem bank_node_1634 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1426, 1955, 5270} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1426, 1955, 5270}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1426, 1955, 5270, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1634
theorem bank_node_1635 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({780, 1180, 2301} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{780, 1180, 2301}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨780, 1180, 2301, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1635
theorem bank_node_1636 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({260, 285, 2964} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{260, 285, 2964}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨260, 285, 2964, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1636
theorem bank_node_1637 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({260, 276, 4485} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{260, 276, 4485}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨260, 276, 4485, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1637
theorem bank_node_1638 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({455, 504, 4680} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{455, 504, 4680}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨455, 504, 4680, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1638
theorem bank_node_1639 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1534, 2210, 5015} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1534, 2210, 5015}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1534, 2210, 5015, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1639
theorem bank_node_1640 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1829, 2790, 5310} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1829, 2790, 5310}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1829, 2790, 5310, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1640
theorem bank_node_1641 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2184, 3705, 5320} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2184, 3705, 5320}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2184, 3705, 5320, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1641
theorem bank_node_1642 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1105, 1394, 5330} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1105, 1394, 5330}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1105, 1394, 5330, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1642
theorem bank_node_1643 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2109, 3478, 5358} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2109, 3478, 5358}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2109, 3478, 5358, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1643
theorem bank_node_1644 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({871, 1040, 5360} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{871, 1040, 5360}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨871, 1040, 5360, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1644
theorem bank_node_1645 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1647, 2376, 5368} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1647, 2376, 5368}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1647, 2376, 5368, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1645
theorem bank_node_1646 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2365, 4214, 5390} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2365, 4214, 5390}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2365, 4214, 5390, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1646
theorem bank_node_1647 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({355, 380, 5396} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{355, 380, 5396}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨355, 380, 5396, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1647
theorem bank_node_1649 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({888, 1464, 2257} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{888, 1464, 2257}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨888, 1464, 2257, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1649
theorem bank_node_1650 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({714, 1003, 2478} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{714, 1003, 2478}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨714, 1003, 2478, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1650
theorem bank_node_1651 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({450, 531, 2950} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{450, 531, 2950}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨450, 531, 2950, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1651
theorem bank_node_1652 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1247, 2088, 3096} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1247, 2088, 3096}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1247, 2088, 3096, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1652
theorem bank_node_1653 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1476, 2772, 3157} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1476, 2772, 3157}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1476, 2772, 3157, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1653
theorem bank_node_1654 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({820, 1220, 2501} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{820, 1220, 2501}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨820, 1220, 2501, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1654
theorem bank_node_1655 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({931, 1292, 3332} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{931, 1292, 3332}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨931, 1292, 3332, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1655
theorem bank_node_1656 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({850, 1139, 3350} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{850, 1139, 3350}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨850, 1139, 3350, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1656
theorem bank_node_1657 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({742, 938, 3551} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{742, 938, 3551}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨742, 938, 3551, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1657
theorem bank_node_1658 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1392, 2233, 3696} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1392, 2233, 3696}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1392, 2233, 3696, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1658
theorem bank_node_1659 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({456, 520, 3705} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{456, 520, 3705}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨456, 520, 3705, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1659
theorem bank_node_1660 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({134, 138, 4623} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{134, 138, 4623}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨134, 138, 4623, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1660
theorem bank_node_1661 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({741, 910, 3990} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{741, 910, 3990}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨741, 910, 3990, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1661
theorem bank_node_1662 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2597, 4998, 5406} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2597, 4998, 5406}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2597, 4998, 5406, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1662
theorem bank_node_1663 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1449, 1978, 5418} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1449, 1978, 5418}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1449, 1978, 5418, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1663
theorem bank_node_1664 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1947, 3036, 5428} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1947, 3036, 5428}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1947, 3036, 5428, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1664
theorem bank_node_1665 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({426, 462, 5467} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{426, 462, 5467}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨426, 462, 5467, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1665
theorem bank_node_1666 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2006, 3162, 5487} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2006, 3162, 5487}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2006, 3162, 5487, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1666
theorem bank_node_1667 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({47, 48, 2256} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{47, 48, 2256}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨47, 48, 2256, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1667
theorem bank_node_1668 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1425, 2050, 4674} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1425, 2050, 4674}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1425, 2050, 4674, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1668
theorem bank_node_1669 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1586, 2262, 5307} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1586, 2262, 5307}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1586, 2262, 5307, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1669
theorem bank_node_1670 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({984, 1560, 2665} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{984, 1560, 2665}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨984, 1560, 2665, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1670
theorem bank_node_1671 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({884, 1053, 5508} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{884, 1053, 5508}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨884, 1053, 5508, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1671
theorem bank_node_1672 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2146, 3515, 5510} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2146, 3515, 5510}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2146, 3515, 5510, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1672
theorem bank_node_1673 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2703, 5304, 5512} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2703, 5304, 5512}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2703, 5304, 5512, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1673
theorem bank_node_1674 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({759, 880, 5520} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{759, 880, 5520}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨759, 880, 5520, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1674
theorem bank_node_1675 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2408, 4257, 5544} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2408, 4257, 5544}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2408, 4257, 5544, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1675
theorem bank_node_1676 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2065, 3290, 5546} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2065, 3290, 5546}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2065, 3290, 5546, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1676
theorem bank_node_1677 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({74, 75, 5550} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{74, 75, 5550}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨74, 75, 5550, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1677
theorem bank_node_1678 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2756, 5460, 5565} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2756, 5460, 5565}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2756, 5460, 5565, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1678
theorem bank_node_1679 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1472, 2001, 5568} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1472, 2001, 5568}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1472, 2001, 5568, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1679
theorem bank_node_1680 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2337, 4018, 5586} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2337, 4018, 5586}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2337, 4018, 5586, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1680
theorem bank_node_1682 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({825, 1450, 1914} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{825, 1450, 1914}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨825, 1450, 1914, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1682
theorem bank_node_1683 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({430, 530, 2279} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{430, 530, 2279}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨430, 530, 2279, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1683
theorem bank_node_1684 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({858, 1342, 2379} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{858, 1342, 2379}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨858, 1342, 2379, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1684
theorem bank_node_1685 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({902, 1386, 2583} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{902, 1386, 2583}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨902, 1386, 2583, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1685
theorem bank_node_1686 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({376, 440, 2585} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{376, 440, 2585}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨376, 440, 2585, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1686
theorem bank_node_1687 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({624, 793, 2928} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{624, 793, 2928}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨624, 793, 2928, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1687
theorem bank_node_1688 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({378, 427, 3294} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{378, 427, 3294}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨378, 427, 3294, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1688
theorem bank_node_1689 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({57, 58, 3306} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{57, 58, 3306}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨57, 58, 3306, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1689
theorem bank_node_1690 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({59, 60, 3540} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{59, 60, 3540}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨59, 60, 3540, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1690
theorem bank_node_1691 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1400, 2025, 4536} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1400, 2025, 4536}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1400, 2025, 4536, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1691
theorem bank_node_1692 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({986, 1275, 4350} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{986, 1275, 4350}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨986, 1275, 4350, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1692
theorem bank_node_1693 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1475, 2100, 4956} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1475, 2100, 4956}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1475, 2100, 4956, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1693
theorem bank_node_1694 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1298, 1782, 4779} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1298, 1782, 4779}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1298, 1782, 4779, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1694
theorem bank_node_1695 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1088, 1377, 5184} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1088, 1377, 5184}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1088, 1377, 5184, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1695
theorem bank_node_1696 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1769, 2610, 5490} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1769, 2610, 5490}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1769, 2610, 5490, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1696
theorem bank_node_1697 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2585, 4794, 5610} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2585, 4794, 5610}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2585, 4794, 5610, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1697
theorem bank_node_1698 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1891, 2852, 5612} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1891, 2852, 5612}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1891, 2852, 5612, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1698
theorem bank_node_1699 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1798, 2639, 5642} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1798, 2639, 5642}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1798, 2639, 5642, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1699
theorem bank_node_1700 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({897, 1066, 5658} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{897, 1066, 5658}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨897, 1066, 5658, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1700
theorem bank_node_1701 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2183, 3552, 5664} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2183, 3552, 5664}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2183, 3552, 5664, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1701
theorem bank_node_1702 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1952, 2976, 5673} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1952, 2976, 5673}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1952, 2976, 5673, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1702
theorem bank_node_1703 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({639, 720, 5680} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{639, 720, 5680}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨639, 720, 5680, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1703
theorem bank_node_1704 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({222, 231, 5698} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{222, 231, 5698}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨222, 231, 5698, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1704
theorem bank_node_1705 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2451, 4300, 5700} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2451, 4300, 5700}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2451, 4300, 5700, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1705
theorem bank_node_1706 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({630, 826, 2655} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{630, 826, 2655}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨630, 826, 2655, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1706
theorem bank_node_1707 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({305, 330, 4026} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{305, 330, 4026}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨305, 330, 4026, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1707
theorem bank_node_1708 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1888, 2912, 5369} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1888, 2912, 5369}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1888, 2912, 5369, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1708
theorem bank_node_1709 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1365, 1806, 5590} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1365, 1806, 5590}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1365, 1806, 5590, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1709
theorem bank_node_1710 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({989, 1518, 2838} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{989, 1518, 2838}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨989, 1518, 2838, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1710
theorem bank_node_1711 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({75, 76, 5700} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{75, 76, 5700}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨75, 76, 5700, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1711
theorem bank_node_1712 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2695, 5096, 5720} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2695, 5096, 5720}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2695, 5096, 5720, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1712
theorem bank_node_1713 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2013, 3102, 5734} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2013, 3102, 5734}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2013, 3102, 5734, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1713
theorem bank_node_1714 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1273, 1634, 5762} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1273, 1634, 5762}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1273, 1634, 5762, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1714
theorem bank_node_1715 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2301, 3822, 5782} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2301, 3822, 5782}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2301, 3822, 5782, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1715
end BaselineSmall
