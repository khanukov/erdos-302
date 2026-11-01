import UpperBank
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace BaselineSmall
theorem bank_node_2448 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2720, 3744, 9945} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2720, 3744, 9945}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2720, 3744, 9945, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2448
theorem bank_node_2449 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({646, 935, 2090} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{646, 935, 2090}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨646, 935, 2090, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2449
theorem bank_node_2450 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({663, 952, 2184} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{663, 952, 2184}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨663, 952, 2184, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2450
theorem bank_node_2451 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({715, 884, 3740} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{715, 884, 3740}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨715, 884, 3740, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2451
theorem bank_node_2452 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5184, 9280, 11745} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5184, 9280, 11745}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5184, 9280, 11745, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2452
theorem bank_node_2453 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1995, 2356, 13020} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1995, 2356, 13020}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1995, 2356, 13020, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2453
theorem bank_node_2454 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({114, 115, 13110} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{114, 115, 13110}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨114, 115, 13110, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2454
theorem bank_node_2455 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3366, 4522, 13167} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3366, 4522, 13167}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3366, 4522, 13167, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2455
theorem bank_node_2456 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({888, 952, 13209} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{888, 952, 13209}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨888, 952, 13209, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2456
theorem bank_node_2457 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1221, 1342, 13542} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1221, 1342, 13542}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1221, 1342, 13542, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2457
theorem bank_node_2458 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1008, 1089, 13552} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1008, 1089, 13552}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1008, 1089, 13552, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2458
theorem bank_node_2459 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({345, 354, 13570} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{345, 354, 13570}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨345, 354, 13570, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2459
theorem bank_node_2460 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4560, 6864, 13585} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4560, 6864, 13585}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4560, 6864, 13585, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2460
theorem bank_node_2461 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4794, 7395, 13630} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4794, 7395, 13630}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4794, 7395, 13630, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2461
theorem bank_node_2462 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5896, 10385, 13640} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5896, 10385, 13640}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5896, 10385, 13640, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2462
theorem bank_node_2463 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5369, 8850, 13650} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5369, 8850, 13650}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5369, 8850, 13650, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2463
theorem bank_node_2464 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({460, 476, 13685} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{460, 476, 13685}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨460, 476, 13685, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2464
theorem bank_node_2465 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6460, 12236, 13685} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6460, 12236, 13685}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6460, 12236, 13685, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2465
theorem bank_node_2466 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4512, 6721, 13728} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4512, 6721, 13728}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4512, 6721, 13728, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2466
theorem bank_node_2467 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1443, 1612, 13764} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1443, 1612, 13764}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1443, 1612, 13764, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2467
theorem bank_node_2468 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1232, 1353, 13776} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1232, 1353, 13776}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1232, 1353, 13776, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2468
theorem bank_node_2469 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({117, 118, 13806} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{117, 118, 13806}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨117, 118, 13806, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2469
theorem bank_node_2470 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4982, 7791, 13818} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4982, 7791, 13818}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4982, 7791, 13818, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2470
theorem bank_node_2471 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3016, 3857, 13832} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3016, 3857, 13832}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3016, 3857, 13832, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2471
theorem bank_node_2472 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5551, 9272, 13832} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5551, 9272, 13832}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5551, 9272, 13832, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2472
theorem bank_node_2473 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6450, 12075, 13846} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6450, 12075, 13846}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6450, 12075, 13846, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2473
theorem bank_node_2474 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6248, 11289, 13992} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6248, 11289, 13992}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6248, 11289, 13992, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2474
theorem bank_node_2475 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1456, 1625, 14000} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1456, 1625, 14000}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1456, 1625, 14000, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2475
theorem bank_node_2477 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4240, 7049, 10640} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4240, 7049, 10640}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4240, 7049, 10640, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2477
theorem bank_node_2478 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({530, 555, 11766} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{530, 555, 11766}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨530, 555, 11766, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2478
theorem bank_node_2479 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4760, 7896, 11985} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4760, 7896, 11985}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4760, 7896, 11985, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2479
theorem bank_node_2480 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2755, 3596, 11780} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2755, 3596, 11780}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2755, 3596, 11780, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2480
theorem bank_node_2481 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4214, 6063, 13818} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4214, 6063, 13818}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4214, 6063, 13818, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2481
theorem bank_node_2482 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1581, 1870, 10230} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1581, 1870, 10230}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1581, 1870, 10230, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2482
theorem bank_node_2483 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2639, 3480, 10920} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2639, 3480, 10920}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2639, 3480, 10920, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2483
theorem bank_node_2484 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5246, 8967, 12642} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5246, 8967, 12642}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5246, 8967, 12642, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2484
theorem bank_node_2485 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3895, 5576, 12920} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3895, 5576, 12920}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3895, 5576, 12920, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2485
theorem bank_node_2486 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5192, 8673, 12936} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5192, 8673, 12936}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5192, 8673, 12936, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2486
theorem bank_node_2487 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2600, 3225, 13416} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2600, 3225, 13416}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2600, 3225, 13416, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2487
theorem bank_node_2488 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({230, 234, 13455} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{230, 234, 13455}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨230, 234, 13455, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2488
theorem bank_node_2489 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2438, 2967, 13674} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2438, 2967, 13674}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2438, 2967, 13674, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2489
theorem bank_node_2490 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5115, 8140, 13764} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5115, 8140, 13764}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5115, 8140, 13764, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2490
theorem bank_node_2491 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({234, 238, 13923} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{234, 238, 13923}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨234, 238, 13923, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2491
theorem bank_node_2492 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5642, 9486, 13923} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5642, 9486, 13923}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5642, 9486, 13923, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2492
theorem bank_node_2493 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6438, 11914, 14007} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6438, 11914, 14007}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6438, 11914, 14007, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2493
theorem bank_node_2494 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({805, 854, 14030} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{805, 854, 14030}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨805, 854, 14030, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2494
theorem bank_node_2495 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({580, 605, 14036} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{580, 605, 14036}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨580, 605, 14036, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2495
theorem bank_node_2496 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({118, 119, 14042} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{118, 119, 14042}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨118, 119, 14042, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2496
theorem bank_node_2497 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4257, 6106, 14058} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4257, 6106, 14058}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4257, 6106, 14058, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2497
theorem bank_node_2498 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5035, 7844, 14060} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5035, 7844, 14060}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5035, 7844, 14060, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2498
theorem bank_node_2499 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3045, 3886, 14070} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3045, 3886, 14070}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3045, 3886, 14070, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2499
theorem bank_node_2500 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5612, 9333, 14076} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5612, 9333, 14076}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5612, 9333, 14076, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2500
theorem bank_node_2501 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2862, 3591, 14098} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2862, 3591, 14098}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2862, 3591, 14098, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2501
theorem bank_node_2502 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4100, 5781, 14100} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4100, 5781, 14100}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4100, 5781, 14100, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2502
theorem bank_node_2503 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5824, 9920, 14105} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5824, 9920, 14105}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5824, 9920, 14105, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2503
theorem bank_node_2504 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5487, 8968, 14136} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5487, 8968, 14136}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5487, 8968, 14136, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2504
theorem bank_node_2505 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({468, 484, 14157} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{468, 484, 14157}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨468, 484, 14157, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2505
theorem bank_node_2506 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1887, 2176, 14208} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1887, 2176, 14208}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1887, 2176, 14208, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2506
theorem bank_node_2507 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4606, 6815, 14210} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4606, 6815, 14210}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4606, 6815, 14210, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2507
theorem bank_node_2508 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5796, 9765, 14260} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5796, 9765, 14260}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5796, 9765, 14260, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2508
theorem bank_node_2509 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({812, 861, 14268} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{812, 861, 14268}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨812, 861, 14268, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2509
theorem bank_node_2510 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6699, 12628, 14268} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6699, 12628, 14268}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6699, 12628, 14268, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2510
theorem bank_node_2511 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({585, 610, 14274} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{585, 610, 14274}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨585, 610, 14274, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2511
theorem bank_node_2512 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({354, 363, 14278} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{354, 363, 14278}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨354, 363, 14278, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2512
theorem bank_node_2513 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3074, 3915, 14310} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3074, 3915, 14310}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3074, 3915, 14310, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2513
theorem bank_node_2514 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5673, 9394, 14322} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5673, 9394, 14322}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5673, 9394, 14322, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2514
theorem bank_node_2515 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2700, 3325, 14364} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2700, 3325, 14364}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2700, 3325, 14364, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2515
theorem bank_node_2516 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({7140, 14196, 14365} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{7140, 14196, 14365}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨7140, 14196, 14365, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2516
theorem bank_node_2517 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({238, 242, 14399} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{238, 242, 14399}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨238, 242, 14399, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2517
theorem bank_node_2518 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2109, 2470, 14430} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2109, 2470, 14430}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2109, 2470, 14430, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2518
theorem bank_node_2519 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1904, 2193, 14448} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1904, 2193, 14448}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1904, 2193, 14448, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2519
theorem bank_node_2520 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1044, 1125, 14500} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1044, 1125, 14500}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1044, 1125, 14500, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2520
theorem bank_node_2522 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({350, 399, 2850} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{350, 399, 2850}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨350, 399, 2850, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2522
theorem bank_node_2523 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({495, 520, 10296} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{495, 520, 10296}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨495, 520, 10296, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2523
theorem bank_node_2524 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2754, 3910, 9315} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2754, 3910, 9315}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2754, 3910, 9315, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2524
theorem bank_node_2525 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2162, 2691, 10998} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2162, 2691, 10998}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2162, 2691, 10998, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2525
theorem bank_node_2526 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5124, 8845, 12180} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5124, 8845, 12180}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5124, 8845, 12180, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2526
theorem bank_node_2527 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4902, 8151, 12298} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4902, 8151, 12298}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4902, 8151, 12298, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2527
theorem bank_node_2528 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6290, 11766, 13515} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6290, 11766, 13515}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6290, 11766, 13515, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2528
theorem bank_node_2529 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5060, 8085, 13524} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5060, 8085, 13524}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5060, 8085, 13524, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2529
theorem bank_node_2530 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1430, 1599, 13530} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1430, 1599, 13530}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1430, 1599, 13530, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2530
theorem bank_node_2531 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1025, 1650, 2706} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1025, 1650, 2706}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1025, 1650, 2706, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2531
theorem bank_node_2532 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({348, 357, 13804} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{348, 357, 13804}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨348, 357, 13804, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2532
theorem bank_node_2533 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4940, 7644, 13965} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4940, 7644, 13965}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4940, 7644, 13965, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2533
theorem bank_node_2534 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({119, 120, 14280} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{119, 120, 14280}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨119, 120, 14280, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2534
theorem bank_node_2535 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({590, 615, 14514} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{590, 615, 14514}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨590, 615, 14514, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2535
theorem bank_node_2536 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({357, 366, 14518} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{357, 366, 14518}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨357, 366, 14518, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2536
theorem bank_node_2537 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5510, 8874, 14535} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5510, 8874, 14535}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5510, 8874, 14535, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2537
theorem bank_node_2538 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6279, 11040, 14560} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6279, 11040, 14560}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6279, 11040, 14560, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2538
theorem bank_node_2539 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5734, 9455, 14570} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5734, 9455, 14570}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5734, 9455, 14570, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2539
theorem bank_node_2540 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({936, 1000, 14625} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{936, 1000, 14625}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨936, 1000, 14625, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2540
theorem bank_node_2541 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6164, 10653, 14628} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6164, 10653, 14628}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6164, 10653, 14628, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2541
theorem bank_node_2542 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5605, 9086, 14630} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5605, 9086, 14630}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5605, 9086, 14630, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2542
theorem bank_node_2543 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({476, 492, 14637} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{476, 492, 14637}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨476, 492, 14637, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2543
theorem bank_node_2544 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4851, 7252, 14652} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4851, 7252, 14652}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4851, 7252, 14652, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2544
theorem bank_node_2545 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({7134, 13858, 14703} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{7134, 13858, 14703}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨7134, 13858, 14703, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2545
theorem bank_node_2546 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({7310, 14535, 14706} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{7310, 14535, 14706}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨7310, 14535, 14706, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2546
theorem bank_node_2547 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1495, 1664, 14720} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1495, 1664, 14720}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1495, 1664, 14720, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2547
theorem bank_node_2548 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6461, 11502, 14742} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6461, 11502, 14742}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6461, 11502, 14742, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2548
theorem bank_node_2549 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({826, 875, 14750} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{826, 875, 14750}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨826, 875, 14750, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2549
end BaselineSmall
