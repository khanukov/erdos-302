import UpperBank
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace BaselineSmall
theorem bank_node_1511 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({585, 666, 4810} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{585, 666, 4810}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨585, 666, 4810, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1511
theorem bank_node_1512 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2014, 3458, 4823} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2014, 3458, 4823}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2014, 3458, 4823, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1512
theorem bank_node_1513 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({335, 360, 4824} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{335, 360, 4824}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨335, 360, 4824, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1513
theorem bank_node_1514 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({204, 213, 4828} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{204, 213, 4828}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨204, 213, 4828, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1514
theorem bank_node_1515 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2132, 3813, 4836} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2132, 3813, 4836}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2132, 3813, 4836, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1515
theorem bank_node_1516 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1357, 1886, 4838} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1357, 1886, 4838}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1357, 1886, 4838, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1516
theorem bank_node_1517 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2244, 4180, 4845} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2244, 4180, 4845}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2244, 4180, 4845, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1517
theorem bank_node_1518 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2067, 3588, 4876} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2067, 3588, 4876}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2067, 3588, 4876, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1518
theorem bank_node_1519 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1159, 1520, 4880} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1159, 1520, 4880}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1159, 1520, 4880, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1519
theorem bank_node_1520 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({138, 142, 4899} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{138, 142, 4899}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨138, 142, 4899, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1520
theorem bank_node_1521 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({805, 1334, 2030} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{805, 1334, 2030}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨805, 1334, 2030, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1521
theorem bank_node_1522 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({590, 690, 4071} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{590, 690, 4071}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨590, 690, 4071, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1522
theorem bank_node_1523 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({708, 852, 4189} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{708, 852, 4189}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨708, 852, 4189, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1523
theorem bank_node_1524 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({549, 630, 4270} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{549, 630, 4270}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨549, 630, 4270, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1524
theorem bank_node_1525 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({915, 1140, 4636} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{915, 1140, 4636}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨915, 1140, 4636, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1525
theorem bank_node_1526 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({330, 355, 4686} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{330, 355, 4686}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨330, 355, 4686, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1526
theorem bank_node_1527 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1653, 2494, 4902} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1653, 2494, 4902}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1653, 2494, 4902, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1527
theorem bank_node_1528 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({832, 1001, 4928} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{832, 1001, 4928}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨832, 1001, 4928, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1528
theorem bank_node_1529 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2120, 3720, 4929} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2120, 3720, 4929}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2120, 3720, 4929, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1529
theorem bank_node_1530 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1566, 2295, 4930} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1566, 2295, 4930}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1566, 2295, 4930, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1530
theorem bank_node_1531 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2236, 4085, 4940} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2236, 4085, 4940}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2236, 4085, 4940, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1531
theorem bank_node_1532 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2450, 4851, 4950} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2450, 4851, 4950}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2450, 4851, 4950, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1532
theorem bank_node_1533 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({469, 518, 4958} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{469, 518, 4958}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨469, 518, 4958, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1533
theorem bank_node_1534 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1110, 2010, 2479} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1110, 2010, 2479}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1110, 2010, 2479, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1534
theorem bank_node_1535 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({70, 71, 4970} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{70, 71, 4970}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨70, 71, 4970, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1535
theorem bank_node_1536 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2173, 3854, 4982} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2173, 3854, 4982}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2173, 3854, 4982, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1536
theorem bank_node_1537 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2397, 4606, 4998} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2397, 4606, 4998}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2397, 4606, 4998, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1537
theorem bank_node_1538 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({980, 1380, 3381} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{980, 1380, 3381}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨980, 1380, 3381, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1538
theorem bank_node_1539 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1036, 1820, 2405} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1036, 1820, 2405}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1036, 1820, 2405, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1539
theorem bank_node_1540 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1281, 1722, 5002} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1281, 1722, 5002}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1281, 1722, 5002, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1540
theorem bank_node_1541 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1980, 3276, 5005} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1980, 3276, 5005}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1980, 3276, 5005, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1541
theorem bank_node_1542 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1767, 2728, 5016} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1767, 2728, 5016}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1767, 2728, 5016, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1542
theorem bank_node_1543 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2226, 3990, 5035} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2226, 3990, 5035}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2226, 3990, 5035, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1543
theorem bank_node_1544 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1071, 1360, 5040} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1071, 1360, 5040}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1071, 1360, 5040, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1544
theorem bank_node_1545 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2035, 3404, 5060} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2035, 3404, 5060}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2035, 3404, 5060, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1545
theorem bank_node_1546 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1593, 2322, 5074} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1593, 2322, 5074}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1593, 2322, 5074, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1546
theorem bank_node_1547 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2279, 4128, 5088} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2279, 4128, 5088}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2279, 4128, 5088, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1547
theorem bank_node_1548 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({603, 684, 5092} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{603, 684, 5092}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨603, 684, 5092, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1548
theorem bank_node_1549 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2499, 4900, 5100} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2499, 4900, 5100}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2499, 4900, 5100, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1549
theorem bank_node_1551 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({90, 94, 2115} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{90, 94, 2115}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨90, 94, 2115, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1551
theorem bank_node_1552 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({387, 468, 2236} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{387, 468, 2236}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨387, 468, 2236, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1552
theorem bank_node_1553 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({246, 282, 1927} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{246, 282, 1927}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨246, 282, 1927, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1553
theorem bank_node_1554 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1073, 1914, 2442} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1073, 1914, 2442}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1073, 1914, 2442, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1554
theorem bank_node_1555 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1160, 2001, 2760} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1160, 2001, 2760}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1160, 2001, 2760, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1555
theorem bank_node_1556 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({690, 915, 2806} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{690, 915, 2806}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨690, 915, 2806, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1556
theorem bank_node_1557 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({611, 780, 2820} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{611, 780, 2820}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨611, 780, 2820, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1557
theorem bank_node_1558 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1128, 1704, 3337} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1128, 1704, 3337}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1128, 1704, 3337, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1558
theorem bank_node_1559 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1175, 1800, 3384} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1175, 1800, 3384}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1175, 1800, 3384, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1559
theorem bank_node_1560 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({561, 682, 3162} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{561, 682, 3162}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨561, 682, 3162, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1560
theorem bank_node_1561 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1050, 1675, 2814} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1050, 1675, 2814}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1050, 1675, 2814, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1561
theorem bank_node_1562 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({420, 469, 4020} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{420, 469, 4020}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨420, 469, 4020, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1562
theorem bank_node_1563 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({940, 1340, 3149} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{940, 1340, 3149}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨940, 1340, 3149, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1563
theorem bank_node_1564 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({784, 1040, 3185} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{784, 1040, 3185}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨784, 1040, 3185, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1564
theorem bank_node_1565 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1485, 2214, 4510} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1485, 2214, 4510}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1485, 2214, 4510, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1565
theorem bank_node_1566 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({925, 1550, 2294} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{925, 1550, 2294}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨925, 1550, 2294, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1566
theorem bank_node_1567 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1178, 1539, 5022} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1178, 1539, 5022}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1178, 1539, 5022, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1567
theorem bank_node_1568 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({212, 228, 3021} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{212, 228, 3021}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨212, 228, 3021, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1568
theorem bank_node_1569 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({848, 1104, 3657} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{848, 1104, 3657}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨848, 1104, 3657, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1569
theorem bank_node_1570 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({244, 260, 3965} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{244, 260, 3965}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨244, 260, 3965, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1570
theorem bank_node_1571 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({638, 759, 4002} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{638, 759, 4002}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨638, 759, 4002, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1571
theorem bank_node_1572 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1736, 2697, 4872} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1736, 2697, 4872}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1736, 2697, 4872, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1572
theorem bank_node_1573 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({71, 72, 5112} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{71, 72, 5112}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨71, 72, 5112, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1573
theorem bank_node_1574 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2090, 3534, 5115} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2090, 3534, 5115}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2090, 3534, 5115, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1574
theorem bank_node_1575 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2214, 3895, 5130} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2214, 3895, 5130}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2214, 3895, 5130, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1575
theorem bank_node_1576 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1652, 2436, 5133} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1652, 2436, 5133}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1652, 2436, 5133, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1576
theorem bank_node_1577 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2444, 4653, 5148} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2444, 4653, 5148}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2444, 4653, 5148, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1577
theorem bank_node_1578 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({670, 770, 5159} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{670, 770, 5159}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨670, 770, 5159, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1578
theorem bank_node_1579 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2145, 3666, 5170} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2145, 3666, 5170}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2145, 3666, 5170, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1579
theorem bank_node_1580 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1938, 3094, 5187} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1938, 3094, 5187}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1938, 3094, 5187, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1580
theorem bank_node_1581 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1711, 2552, 5192} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1711, 2552, 5192}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1711, 2552, 5192, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1581
theorem bank_node_1582 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2385, 4410, 5194} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2385, 4410, 5194}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2385, 4410, 5194, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1582
theorem bank_node_1584 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({612, 901, 1908} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{612, 901, 1908}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨612, 901, 1908, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1584
theorem bank_node_1585 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({897, 1426, 2418} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{897, 1426, 2418}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨897, 1426, 2418, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1585
theorem bank_node_1586 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1118, 1794, 2967} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1118, 1794, 2967}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1118, 1794, 2967, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1586
theorem bank_node_1587 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({637, 806, 3038} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{637, 806, 3038}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨637, 806, 3038, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1587
theorem bank_node_1588 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1035, 1564, 3060} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1035, 1564, 3060}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1035, 1564, 3060, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1588
theorem bank_node_1589 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({645, 870, 2494} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{645, 870, 2494}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨645, 870, 2494, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1589
theorem bank_node_1590 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({54, 55, 2970} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{54, 55, 2970}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨54, 55, 2970, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1590
theorem bank_node_1591 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({477, 558, 3286} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{477, 558, 3286}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨477, 558, 3286, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1591
theorem bank_node_1592 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({516, 660, 2365} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{516, 660, 2365}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨516, 660, 2365, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1592
theorem bank_node_1593 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({564, 708, 2773} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{564, 708, 2773}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨564, 708, 2773, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1593
theorem bank_node_1594 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({570, 670, 3819} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{570, 670, 3819}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨570, 670, 3819, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1594
theorem bank_node_1595 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({522, 603, 3886} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{522, 603, 3886}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨522, 603, 3886, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1595
theorem bank_node_1596 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1045, 1406, 4070} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1045, 1406, 4070}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1045, 1406, 4070, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1596
theorem bank_node_1597 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({371, 420, 3180} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{371, 420, 3180}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨371, 420, 3180, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1597
theorem bank_node_1598 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1239, 1680, 4720} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1239, 1680, 4720}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1239, 1680, 4720, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1598
theorem bank_node_1599 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({930, 1155, 4774} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{930, 1155, 4774}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨930, 1155, 4774, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1599
theorem bank_node_1600 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({636, 780, 3445} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{636, 780, 3445}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨636, 780, 3445, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1600
theorem bank_node_1601 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({204, 220, 2805} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{204, 220, 2805}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨204, 220, 2805, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1601
theorem bank_node_1602 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1064, 1425, 4200} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1064, 1425, 4200}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1064, 1425, 4200, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1602
theorem bank_node_1603 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({195, 204, 4420} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{195, 204, 4420}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨195, 204, 4420, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1603
theorem bank_node_1604 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1674, 2635, 4590} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1674, 2635, 4590}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1674, 2635, 4590, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1604
theorem bank_node_1605 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({656, 912, 2337} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{656, 912, 2337}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨656, 912, 2337, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1605
theorem bank_node_1606 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({715, 836, 4940} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{715, 836, 4940}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨715, 836, 4940, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1606
theorem bank_node_1607 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1197, 1558, 5166} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1197, 1558, 5166}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1197, 1558, 5166, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1607
theorem bank_node_1608 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1464, 2040, 5185} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1464, 2040, 5185}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1464, 2040, 5185, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1608
theorem bank_node_1609 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({737, 858, 5226} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{737, 858, 5226}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨737, 858, 5226, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1609
theorem bank_node_1610 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1995, 3220, 5244} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1995, 3220, 5244}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1995, 3220, 5244, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1610
theorem bank_node_1611 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1525, 2150, 5246} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1525, 2150, 5246}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1525, 2150, 5246, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1611
theorem bank_node_1612 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2438, 4554, 5247} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2438, 4554, 5247}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2438, 4554, 5247, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1612
end BaselineSmall
