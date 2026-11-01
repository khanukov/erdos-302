import UpperBank
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace BaselineSmall
theorem bank_node_2244 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1767, 2128, 10416} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1767, 2128, 10416}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1767, 2128, 10416, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2244
theorem bank_node_2245 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2728, 3689, 10472} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2728, 3689, 10472}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2728, 3689, 10472, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2245
theorem bank_node_2246 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3444, 5125, 10500} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3444, 5125, 10500}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3444, 5125, 10500, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2246
theorem bank_node_2247 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3969, 6370, 10530} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3969, 6370, 10530}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3969, 6370, 10530, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2247
theorem bank_node_2248 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1520, 1776, 10545} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1520, 1776, 10545}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1520, 1776, 10545, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2248
theorem bank_node_2249 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3854, 6063, 10578} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3854, 6063, 10578}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3854, 6063, 10578, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2249
theorem bank_node_2250 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5106, 9867, 10582} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5106, 9867, 10582}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5106, 9867, 10582, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2250
theorem bank_node_2251 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5025, 9514, 10650} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5025, 9514, 10650}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5025, 9514, 10650, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2251
theorem bank_node_2252 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3485, 5166, 10710} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3485, 5166, 10710}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3485, 5166, 10710, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2252
theorem bank_node_2253 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5100, 9724, 10725} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5100, 9724, 10725}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5100, 9724, 10725, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2253
theorem bank_node_2254 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5254, 10295, 10730} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5254, 10295, 10730}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5254, 10295, 10730, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2254
theorem bank_node_2255 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2457, 3186, 10738} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2457, 3186, 10738}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2457, 3186, 10738, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2255
theorem bank_node_2256 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3354, 4875, 10750} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3354, 4875, 10750}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3354, 4875, 10750, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2256
theorem bank_node_2257 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4212, 6916, 10773} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4212, 6916, 10773}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4212, 6916, 10773, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2257
theorem bank_node_2258 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2139, 2668, 10788} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2139, 2668, 10788}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2139, 2668, 10788, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2258
theorem bank_node_2259 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3219, 4588, 10788} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3219, 4588, 10788}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3219, 4588, 10788, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2259
theorem bank_node_2260 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1974, 2415, 10810} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1974, 2415, 10810}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1974, 2415, 10810, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2260
theorem bank_node_2261 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4293, 7102, 10854} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4293, 7102, 10854}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4293, 7102, 10854, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2261
theorem bank_node_2262 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4928, 9024, 10857} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4928, 9024, 10857}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4928, 9024, 10857, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2262
theorem bank_node_2263 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5092, 9581, 10868} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5092, 9581, 10868}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5092, 9581, 10868, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2263
theorem bank_node_2264 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3306, 4750, 10875} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3306, 4750, 10875}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3306, 4750, 10875, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2264
theorem bank_node_2265 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1274, 1443, 10878} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1274, 1443, 10878}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1274, 1443, 10878, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2265
theorem bank_node_2266 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3655, 5504, 10880} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3655, 5504, 10880}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3655, 5504, 10880, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2266
theorem bank_node_2267 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4182, 6783, 10906} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4182, 6783, 10906}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4182, 6783, 10906, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2267
theorem bank_node_2268 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5005, 9230, 10934} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5005, 9230, 10934}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5005, 9230, 10934, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2268
theorem bank_node_2269 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2325, 2950, 10974} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2325, 2950, 10974}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2325, 2950, 10974, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2269
theorem bank_node_2271 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1988, 2772, 7029} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1988, 2772, 7029}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1988, 2772, 7029, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2271
theorem bank_node_2272 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({68, 69, 4692} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{68, 69, 4692}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨68, 69, 4692, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2272
theorem bank_node_2273 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1200, 1456, 6825} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1200, 1456, 6825}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1200, 1456, 6825, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2273
theorem bank_node_2274 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3010, 4235, 10406} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3010, 4235, 10406}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3010, 4235, 10406, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2274
theorem bank_node_2275 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({616, 680, 6545} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{616, 680, 6545}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨616, 680, 6545, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2275
theorem bank_node_2276 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({595, 644, 7820} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{595, 644, 7820}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨595, 644, 7820, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2276
theorem bank_node_2277 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({364, 380, 8645} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{364, 380, 8645}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨364, 380, 8645, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2277
theorem bank_node_2278 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2210, 2886, 9435} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2210, 2886, 9435}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2210, 2886, 9435, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2278
theorem bank_node_2279 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3034, 4403, 9758} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3034, 4403, 9758}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3034, 4403, 9758, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2279
theorem bank_node_2280 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4484, 7965, 10260} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4484, 7965, 10260}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4484, 7965, 10260, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2280
theorem bank_node_2281 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3920, 6321, 10320} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3920, 6321, 10320}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3920, 6321, 10320, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2281
theorem bank_node_2282 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4940, 9165, 10716} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4940, 9165, 10716}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4940, 9165, 10716, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2282
theorem bank_node_2283 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4455, 7480, 11016} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4455, 7480, 11016}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4455, 7480, 11016, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2283
theorem bank_node_2284 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5244, 10005, 11020} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5244, 10005, 11020}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5244, 10005, 11020, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2284
theorem bank_node_2285 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1824, 2185, 11040} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1824, 2185, 11040}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1824, 2185, 11040, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2285
theorem bank_node_2286 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5159, 9648, 11088} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5159, 9648, 11088}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5159, 9648, 11088, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2286
theorem bank_node_2287 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2821, 3782, 11102} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2821, 3782, 11102}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2821, 3782, 11102, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2287
theorem bank_node_2288 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({105, 106, 11130} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{105, 106, 11130}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨105, 106, 11130, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2288
theorem bank_node_2289 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2668, 3509, 11132} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2668, 3509, 11132}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2668, 3509, 11132, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2289
theorem bank_node_2290 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3567, 5248, 11136} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3567, 5248, 11136}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3567, 5248, 11136, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2290
theorem bank_node_2291 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5236, 9860, 11165} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5236, 9860, 11165}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5236, 9860, 11165, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2291
theorem bank_node_2292 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5396, 10437, 11172} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5396, 10437, 11172}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5396, 10437, 11172, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2292
theorem bank_node_2293 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2350, 2975, 11186} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2350, 2975, 11186}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2350, 2975, 11186, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2293
theorem bank_node_2294 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2185, 2714, 11210} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2185, 2714, 11210}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2185, 2714, 11210, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2294
theorem bank_node_2295 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3995, 6204, 11220} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3995, 6204, 11220}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3995, 6204, 11220, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2295
theorem bank_node_2296 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1666, 1955, 11270} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1666, 1955, 11270}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1666, 1955, 11270, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2296
theorem bank_node_2297 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4880, 8601, 11280} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4880, 8601, 11280}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4880, 8601, 11280, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2297
theorem bank_node_2298 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3741, 5590, 11310} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3741, 5590, 11310}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3741, 5590, 11310, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2298
theorem bank_node_2299 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5226, 9715, 11310} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5226, 9715, 11310}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5226, 9715, 11310, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2299
theorem bank_node_2300 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4779, 8260, 11340} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4779, 8260, 11340}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4779, 8260, 11340, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2300
theorem bank_node_2301 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2697, 3538, 11346} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2697, 3538, 11346}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2697, 3538, 11346, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2301
theorem bank_node_2302 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3608, 5289, 11352} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3608, 5289, 11352}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3608, 5289, 11352, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2302
theorem bank_node_2303 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2538, 3267, 11374} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2538, 3267, 11374}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2538, 3267, 11374, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2303
theorem bank_node_2304 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5467, 10508, 11396} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5467, 10508, 11396}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5467, 10508, 11396, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2304
theorem bank_node_2305 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2208, 2737, 11424} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2208, 2737, 11424}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2208, 2737, 11424, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2305
theorem bank_node_2306 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4042, 6251, 11438} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4042, 6251, 11438}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4042, 6251, 11438, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2306
theorem bank_node_2307 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5040, 9009, 11440} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5040, 9009, 11440}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5040, 9009, 11440, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2307
theorem bank_node_2308 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1862, 2223, 11466} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1862, 2223, 11466}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1862, 2223, 11466, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2308
theorem bank_node_2310 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({740, 1140, 2109} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{740, 1140, 2109}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨740, 1140, 2109, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2310
theorem bank_node_2311 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({55, 56, 3080} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{55, 56, 3080}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨55, 56, 3080, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2311
theorem bank_node_2312 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1598, 1887, 10434} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1598, 1887, 10434}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1598, 1887, 10434, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2312
theorem bank_node_2313 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4165, 6566, 11390} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4165, 6566, 11390}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4165, 6566, 11390, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2313
theorem bank_node_2314 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2470, 3146, 11495} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2470, 3146, 11495}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2470, 3146, 11495, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2314
theorem bank_node_2315 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4941, 8662, 11502} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4941, 8662, 11502}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4941, 8662, 11502, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2315
theorem bank_node_2316 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4002, 6118, 11571} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4002, 6118, 11571}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4002, 6118, 11571, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2316
theorem bank_node_2317 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5022, 8866, 11583} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5022, 8866, 11583}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5022, 8866, 11583, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2317
theorem bank_node_2318 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2565, 3294, 11590} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2565, 3294, 11590}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2565, 3294, 11590, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2318
theorem bank_node_2319 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2400, 3025, 11616} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2400, 3025, 11616}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2400, 3025, 11616, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2319
theorem bank_node_2320 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2976, 4000, 11625} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2976, 4000, 11625}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2976, 4000, 11625, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2320
theorem bank_node_2321 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3367, 4736, 11648} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3367, 4736, 11648}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3367, 4736, 11648, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2321
theorem bank_node_2322 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4089, 6298, 11658} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4089, 6298, 11658}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4089, 6298, 11658, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2322
theorem bank_node_2323 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1881, 2242, 11682} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1881, 2242, 11682}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1881, 2242, 11682, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2323
theorem bank_node_2324 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3960, 5985, 11704} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3960, 5985, 11704}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3960, 5985, 11704, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2324
theorem bank_node_2325 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5775, 11400, 11704} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5775, 11400, 11704}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5775, 11400, 11704, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2325
theorem bank_node_2326 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5002, 8723, 11726} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5002, 8723, 11726}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5002, 8723, 11726, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2326
theorem bank_node_2327 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4505, 7314, 11730} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4505, 7314, 11730}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4505, 7314, 11730, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2327
theorem bank_node_2328 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2914, 3875, 11750} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2914, 3875, 11750}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2914, 3875, 11750, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2328
theorem bank_node_2329 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5360, 9849, 11760} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5360, 9849, 11760}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5360, 9849, 11760, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2329
theorem bank_node_2330 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4263, 6664, 11832} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4263, 6664, 11832}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4263, 6664, 11832, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2330
theorem bank_node_2331 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2254, 2783, 11858} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2254, 2783, 11858}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2254, 2783, 11858, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2331
theorem bank_node_2332 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3404, 4773, 11868} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3404, 4773, 11868}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3404, 4773, 11868, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2332
theorem bank_node_2333 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4136, 6345, 11880} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4136, 6345, 11880}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4136, 6345, 11880, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2333
theorem bank_node_2334 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5166, 9135, 11890} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5166, 9135, 11890}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5166, 9135, 11890, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2334
theorem bank_node_2335 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3255, 4480, 11904} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3255, 4480, 11904}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3255, 4480, 11904, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2335
theorem bank_node_2336 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5427, 9916, 11988} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5427, 9916, 11988}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5427, 9916, 11988, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2336
theorem bank_node_2337 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2784, 3625, 12000} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2784, 3625, 12000}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2784, 3625, 12000, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2337
theorem bank_node_2338 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1368, 1729, 6552} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1368, 1729, 6552}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1368, 1729, 6552, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2338
theorem bank_node_2339 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3311, 5160, 9240} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3311, 5160, 9240}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3311, 5160, 9240, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2339
theorem bank_node_2340 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2376, 3105, 10120} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2376, 3105, 10120}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2376, 3105, 10120, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2340
theorem bank_node_2341 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3060, 4356, 10285} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3060, 4356, 10285}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3060, 4356, 10285, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2341
theorem bank_node_2342 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3315, 4836, 10540} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3315, 4836, 10540}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3315, 4836, 10540, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2342
theorem bank_node_2343 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3182, 4551, 10578} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3182, 4551, 10578}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3182, 4551, 10578, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2343
theorem bank_node_2344 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4845, 8094, 12070} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4845, 8094, 12070}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4845, 8094, 12070, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2344
theorem bank_node_2345 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({6006, 11935, 12090} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{6006, 11935, 12090}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨6006, 11935, 12090, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2345
end BaselineSmall
