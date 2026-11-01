import UpperBank
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace BaselineSmall
theorem bank_node_2346 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4730, 7755, 12126} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4730, 7755, 12126}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4730, 7755, 12126, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2346
theorem bank_node_2347 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4930, 8294, 12155} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4930, 8294, 12155}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4930, 8294, 12155, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2347
theorem bank_node_2348 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4611, 7420, 12180} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4611, 7420, 12180}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4611, 7420, 12180, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2348
theorem bank_node_2349 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({954, 1035, 12190} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{954, 1035, 12190}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨954, 1035, 12190, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2349
theorem bank_node_2350 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3913, 5762, 12194} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3913, 5762, 12194}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3913, 5762, 12194, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2350
theorem bank_node_2351 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5015, 8496, 12240} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5015, 8496, 12240}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5015, 8496, 12240, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2351
theorem bank_node_2352 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2646, 3375, 12250} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2646, 3375, 12250}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2646, 3375, 12250, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2352
theorem bank_node_2353 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2475, 3100, 12276} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2475, 3100, 12276}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2475, 3100, 12276, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2353
theorem bank_node_2354 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5751, 10792, 12312} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5751, 10792, 12312}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5751, 10792, 12312, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2354
theorem bank_node_2355 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1938, 2299, 12342} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1938, 2299, 12342}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1938, 2299, 12342, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2355
theorem bank_node_2356 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({111, 112, 12432} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{111, 112, 12432}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨111, 112, 12432, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2356
theorem bank_node_2357 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4872, 8008, 12441} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4872, 8008, 12441}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4872, 8008, 12441, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2357
theorem bank_node_2358 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3813, 5494, 12462} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3813, 5494, 12462}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3813, 5494, 12462, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2358
theorem bank_node_2359 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5074, 8555, 12470} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5074, 8555, 12470}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5074, 8555, 12470, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2359
theorem bank_node_2360 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5270, 9114, 12495} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5270, 9114, 12495}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5270, 9114, 12495, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2360
theorem bank_node_2361 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1634, 1995, 9030} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1634, 1995, 9030}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1634, 1995, 9030, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2361
theorem bank_node_2362 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({816, 1105, 3120} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{816, 1105, 3120}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨816, 1105, 3120, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2362
theorem bank_node_2363 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2024, 2553, 9768} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2024, 2553, 9768}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2024, 2553, 9768, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2363
theorem bank_node_2364 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({855, 936, 9880} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{855, 936, 9880}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨855, 936, 9880, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2364
theorem bank_node_2365 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2805, 3894, 10030} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2805, 3894, 10030}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2805, 3894, 10030, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2365
theorem bank_node_2366 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4080, 6384, 11305} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4080, 6384, 11305}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4080, 6384, 11305, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2366
theorem bank_node_2367 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4956, 8437, 12012} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4956, 8437, 12012}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4956, 8437, 12012, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2367
theorem bank_node_2368 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1560, 1785, 12376} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1560, 1785, 12376}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1560, 1785, 12376, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2368
theorem bank_node_2369 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3666, 5187, 12502} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3666, 5187, 12502}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3666, 5187, 12502, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2369
theorem bank_node_2370 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5822, 10863, 12546} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5822, 10863, 12546}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5822, 10863, 12546, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2370
theorem bank_node_2371 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5994, 11470, 12555} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5994, 11470, 12555}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5994, 11470, 12555, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2371
theorem bank_node_2372 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4277, 6486, 12558} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4277, 6486, 12558}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4277, 6486, 12558, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2372
theorem bank_node_2373 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1768, 2057, 12584} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1768, 2057, 12584}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1768, 2057, 12584, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2373
theorem bank_node_2374 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1378, 1547, 12614} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1378, 1547, 12614}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1378, 1547, 12614, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2374
theorem bank_node_2375 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3999, 5848, 12648} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3999, 5848, 12648}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3999, 5848, 12648, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2375
theorem bank_node_2376 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2871, 3712, 12672} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2871, 3712, 12672}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2871, 3712, 12672, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2376
theorem bank_node_2377 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3854, 5535, 12690} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3854, 5535, 12690}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3854, 5535, 12690, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2377
theorem bank_node_2378 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1680, 1936, 12705} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1680, 1936, 12705}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1680, 1936, 12705, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2378
theorem bank_node_2379 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5016, 8265, 12760} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5016, 8265, 12760}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5016, 8265, 12760, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2379
theorem bank_node_2380 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3552, 4921, 12768} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3552, 4921, 12768}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3552, 4921, 12768, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2380
theorem bank_node_2381 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1785, 2074, 12810} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1785, 2074, 12810}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1785, 2074, 12810, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2381
theorem bank_node_2382 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1590, 1815, 12826} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1590, 1815, 12826}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1590, 1815, 12826, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2382
theorem bank_node_2383 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5307, 9028, 12876} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5307, 9028, 12876}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5307, 9028, 12876, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2383
theorem bank_node_2384 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({336, 345, 12880} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{336, 345, 12880}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨336, 345, 12880, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2384
theorem bank_node_2385 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2900, 3741, 12900} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2900, 3741, 12900}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2900, 3741, 12900, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2385
theorem bank_node_2386 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5695, 10184, 12920} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5695, 10184, 12920}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5695, 10184, 12920, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2386
theorem bank_node_2388 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2484, 3213, 10948} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2484, 3213, 10948}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2484, 3213, 10948, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2388
theorem bank_node_2389 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1584, 1840, 11385} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1584, 1840, 11385}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1584, 1840, 11385, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2389
theorem bank_node_2390 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1900, 2261, 11900} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1900, 2261, 11900}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1900, 2261, 11900, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2390
theorem bank_node_2391 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1040, 1209, 7440} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1040, 1209, 7440}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1040, 1209, 7440, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2391
theorem bank_node_2392 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3045, 4270, 10614} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3045, 4270, 10614}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3045, 4270, 10614, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2392
theorem bank_node_2393 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3003, 4092, 11284} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3003, 4092, 11284}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3003, 4092, 11284, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2393
theorem bank_node_2394 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2277, 2806, 12078} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2277, 2806, 12078}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2277, 2806, 12078, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2394
theorem bank_node_2395 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({756, 805, 12420} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{756, 805, 12420}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨756, 805, 12420, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2395
theorem bank_node_2396 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3956, 5805, 12420} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3956, 5805, 12420}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3956, 5805, 12420, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2396
theorem bank_node_2397 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2726, 3567, 11562} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2726, 3567, 11562}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2726, 3567, 11562, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2397
theorem bank_node_2398 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3096, 4945, 8280} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3096, 4945, 8280}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3096, 4945, 8280, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2398
theorem bank_node_2399 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1886, 2415, 8610} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1886, 2415, 8610}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1886, 2415, 8610, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2399
theorem bank_node_2400 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3003, 4524, 8932} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3003, 4524, 8932}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3003, 4524, 8932, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2400
theorem bank_node_2401 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3198, 4879, 9282} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3198, 4879, 9282}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3198, 4879, 9282, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2401
theorem bank_node_2402 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2150, 2775, 9546} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2150, 2775, 9546}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2150, 2775, 9546, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2402
theorem bank_node_2403 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3440, 5289, 9840} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3440, 5289, 9840}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3440, 5289, 9840, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2403
theorem bank_node_2404 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2436, 3220, 10005} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2436, 3220, 10005}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2436, 3220, 10005, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2404
theorem bank_node_2405 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2958, 4114, 10527} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2958, 4114, 10527}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2958, 4114, 10527, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2405
theorem bank_node_2406 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2790, 3751, 10890} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2790, 3751, 10890}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2790, 3751, 10890, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2406
theorem bank_node_2407 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1287, 1456, 11088} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1287, 1456, 11088}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1287, 1456, 11088, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2407
theorem bank_node_2408 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1683, 1972, 11484} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1683, 1972, 11484}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1683, 1972, 11484, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2408
theorem bank_node_2409 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1144, 1265, 11960} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1144, 1265, 11960}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1144, 1265, 11960, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2409
theorem bank_node_2410 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3135, 4224, 12160} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3135, 4224, 12160}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3135, 4224, 12160, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2410
theorem bank_node_2411 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4785, 7810, 12354} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4785, 7810, 12354}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4785, 7810, 12354, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2411
theorem bank_node_2412 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2346, 2875, 12750} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2346, 2875, 12750}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2346, 2875, 12750, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2412
theorem bank_node_2413 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4641, 7242, 12922} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4641, 7242, 12922}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4641, 7242, 12922, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2413
theorem bank_node_2414 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4508, 6909, 12972} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4508, 6909, 12972}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4508, 6909, 12972, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2414
theorem bank_node_2415 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4371, 6580, 13020} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4371, 6580, 13020}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4371, 6580, 13020, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2415
theorem bank_node_2416 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5964, 11005, 13020} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5964, 11005, 13020}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5964, 11005, 13020, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2416
theorem bank_node_2417 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1802, 2091, 13038} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1802, 2091, 13038}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1802, 2091, 13038, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2417
theorem bank_node_2418 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6314, 12243, 13038} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6314, 12243, 13038}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6314, 12243, 13038, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2418
theorem bank_node_2419 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6480, 12880, 13041} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6480, 12880, 13041}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6480, 12880, 13041, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2419
theorem bank_node_2420 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1404, 1573, 13068} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1404, 1573, 13068}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1404, 1573, 13068, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2420
theorem bank_node_2421 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5865, 10626, 13090} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5865, 10626, 13090}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5865, 10626, 13090, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2421
theorem bank_node_2422 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({777, 826, 13098} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{777, 826, 13098}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨777, 826, 13098, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2422
theorem bank_node_2423 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4823, 7632, 13104} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4823, 7632, 13104}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4823, 7632, 13104, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2423
theorem bank_node_2424 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4692, 7293, 13156} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4692, 7293, 13156}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4692, 7293, 13156, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2424
theorem bank_node_2425 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4557, 6958, 13206} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4557, 6958, 13206}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4557, 6958, 13206, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2425
theorem bank_node_2426 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5655, 9880, 13224} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5655, 9880, 13224}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5655, 9880, 13224, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2426
theorem bank_node_2427 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2014, 2375, 13250} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2014, 2375, 13250}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2014, 2375, 13250, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2427
theorem bank_node_2428 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6035, 11076, 13260} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6035, 11076, 13260}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6035, 11076, 13260, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2428
theorem bank_node_2429 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4650, 7150, 13299} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4650, 7150, 13299}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4650, 7150, 13299, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2429
theorem bank_node_2430 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5934, 10695, 13330} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5934, 10695, 13330}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5934, 10695, 13330, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2430
theorem bank_node_2431 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4876, 7685, 13340} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4876, 7685, 13340}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4876, 7685, 13340, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2431
theorem bank_node_2432 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5829, 10318, 13398} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5829, 10318, 13398}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5829, 10318, 13398, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2432
theorem bank_node_2433 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2415, 2944, 13440} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2415, 2944, 13440}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2415, 2944, 13440, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2433
theorem bank_node_2434 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4606, 7007, 13442} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4606, 7007, 13442}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4606, 7007, 13442, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2434
theorem bank_node_2435 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3663, 5032, 13464} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3663, 5032, 13464}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3663, 5032, 13464, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2435
theorem bank_node_2436 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5187, 8436, 13468} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5187, 8436, 13468}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5187, 8436, 13468, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2436
theorem bank_node_2437 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4836, 7540, 13485} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4836, 7540, 13485}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4836, 7540, 13485, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2437
theorem bank_node_2438 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5916, 10540, 13485} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5916, 10540, 13485}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5916, 10540, 13485, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2438
theorem bank_node_2439 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4465, 6674, 13490} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4465, 6674, 13490}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4465, 6674, 13490, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2439
theorem bank_node_2440 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1836, 2125, 13500} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1836, 2125, 13500}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1836, 2125, 13500, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2440
theorem bank_node_2442 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3864, 7000, 8625} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3864, 7000, 8625}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3864, 7000, 8625, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2442
theorem bank_node_2443 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4214, 6615, 11610} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4214, 6615, 11610}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4214, 6615, 11610, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2443
theorem bank_node_2444 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1615, 1904, 10640} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1615, 1904, 10640}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1615, 1904, 10640, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2444
theorem bank_node_2445 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5762, 10251, 13158} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5762, 10251, 13158}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5762, 10251, 13158, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2445
theorem bank_node_2446 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({497, 546, 5538} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{497, 546, 5538}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨497, 546, 5538, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2446
theorem bank_node_2447 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({429, 550, 1950} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{429, 550, 1950}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨429, 550, 1950, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2447
end BaselineSmall
