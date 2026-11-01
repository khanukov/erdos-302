import UpperBank
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace BaselineSmall
theorem bank_node_1211 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({928, 1769, 1952} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{928, 1769, 1952}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨928, 1769, 1952, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1211
theorem bank_node_1212 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({592, 848, 1961} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{592, 848, 1961}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨592, 848, 1961, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1212
theorem bank_node_1213 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({287, 336, 1968} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{287, 336, 1968}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨287, 336, 1968, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1213
theorem bank_node_1214 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({129, 138, 1978} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{129, 138, 1978}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨129, 138, 1978, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1214
theorem bank_node_1215 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({850, 1475, 2006} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{850, 1475, 2006}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨850, 1475, 2006, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1215
theorem bank_node_1216 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({328, 392, 2009} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{328, 392, 2009}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨328, 392, 2009, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1216
theorem bank_node_1217 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({172, 188, 2021} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{172, 188, 2021}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨172, 188, 2021, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1217
theorem bank_node_1218 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({840, 1416, 2065} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{840, 1416, 2065}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨840, 1416, 2065, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1218
theorem bank_node_1219 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({45, 46, 2070} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{45, 46, 2070}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨45, 46, 2070, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1219
theorem bank_node_1220 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({703, 1064, 2072} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{703, 1064, 2072}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨703, 1064, 2072, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1220
theorem bank_node_1221 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({918, 1647, 2074} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{918, 1647, 2074}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨918, 1647, 2074, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1221
theorem bank_node_1222 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1023, 1984, 2112} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1023, 1984, 2112}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1023, 1984, 2112, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1222
theorem bank_node_1223 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({451, 572, 2132} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{451, 572, 2132}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨451, 572, 2132, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1223
theorem bank_node_1224 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({910, 1586, 2135} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{910, 1586, 2135}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨910, 1586, 2135, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1224
theorem bank_node_1225 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({777, 1218, 2146} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{777, 1218, 2146}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨777, 1218, 2146, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1225
theorem bank_node_1226 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({301, 350, 2150} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{301, 350, 2150}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨301, 350, 2150, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1226
theorem bank_node_1227 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({46, 47, 2162} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{46, 47, 2162}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨46, 47, 2162, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1227
theorem bank_node_1228 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({945, 1674, 2170} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{945, 1674, 2170}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨945, 1674, 2170, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1228
theorem bank_node_1229 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({814, 1298, 2183} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{814, 1298, 2183}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨814, 1298, 2183, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1229
theorem bank_node_1230 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({900, 1525, 2196} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{900, 1525, 2196}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨900, 1525, 2196, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1230
theorem bank_node_1231 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1054, 2015, 2210} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1054, 2015, 2210}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1054, 2015, 2210, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1231
theorem bank_node_1232 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1015, 1856, 2240} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1015, 1856, 2240}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1015, 1856, 2240, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1232
theorem bank_node_1233 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({798, 1239, 2242} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{798, 1239, 2242}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨798, 1239, 2242, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1233
theorem bank_node_1234 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1122, 2211, 2278} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1122, 2211, 2278}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1122, 2211, 2278, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1234
theorem bank_node_1235 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({94, 98, 2303} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{94, 98, 2303}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨94, 98, 2303, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1235
theorem bank_node_1236 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({874, 1403, 2318} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{874, 1403, 2318}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨874, 1403, 2318, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1236
theorem bank_node_1237 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1120, 2144, 2345} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1120, 2144, 2345}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1120, 2144, 2345, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1237
theorem bank_node_1238 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({230, 255, 2346} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{230, 255, 2346}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨230, 255, 2346, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1238
theorem bank_node_1239 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({141, 150, 2350} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{141, 150, 2350}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨141, 150, 2350, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1239
theorem bank_node_1240 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({48, 49, 2352} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{48, 49, 2352}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨48, 49, 2352, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1240
theorem bank_node_1241 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({999, 1728, 2368} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{999, 1728, 2368}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨999, 1728, 2368, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1241
theorem bank_node_1242 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({188, 204, 2397} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{188, 204, 2397}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨188, 204, 2397, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1242
theorem bank_node_1243 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({559, 728, 2408} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{559, 728, 2408}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨559, 728, 2408, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1243
theorem bank_node_1244 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1116, 2077, 2412} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1116, 2077, 2412}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1116, 2077, 2412, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1244
theorem bank_node_1245 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({322, 371, 2438} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{322, 371, 2438}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨322, 371, 2438, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1245
theorem bank_node_1246 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({840, 1281, 2440} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{840, 1281, 2440}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨840, 1281, 2440, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1246
theorem bank_node_1247 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({235, 260, 2444} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{235, 260, 2444}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨235, 260, 2444, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1247
theorem bank_node_1248 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({49, 50, 2450} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{49, 50, 2450}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨49, 50, 2450, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1248
theorem bank_node_1249 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({779, 1140, 2460} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{779, 1140, 2460}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨779, 1140, 2460, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1249
theorem bank_node_1250 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1026, 1755, 2470} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1026, 1755, 2470}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1026, 1755, 2470, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1250
theorem bank_node_1251 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({975, 1600, 2496} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{975, 1600, 2496}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨975, 1600, 2496, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1251
theorem bank_node_1252 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({473, 594, 2322} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{473, 594, 2322}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨473, 594, 2322, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1252
theorem bank_node_1253 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1147, 2108, 2516} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1147, 2108, 2516}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1147, 2108, 2516, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1253
theorem bank_node_1254 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({688, 944, 2537} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{688, 944, 2537}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨688, 944, 2537, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1254
theorem bank_node_1255 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({240, 265, 2544} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{240, 265, 2544}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨240, 265, 2544, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1255
theorem bank_node_1256 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1102, 1943, 2546} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1102, 1943, 2546}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1102, 1943, 2546, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1256
theorem bank_node_1257 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({147, 156, 2548} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{147, 156, 2548}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨147, 156, 2548, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1257
theorem bank_node_1258 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1184, 2208, 2553} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1184, 2208, 2553}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1184, 2208, 2553, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1258
theorem bank_node_1259 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1260, 2485, 2556} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1260, 2485, 2556}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1260, 2485, 2556, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1259
theorem bank_node_1260 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({196, 212, 2597} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{196, 212, 2597}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨196, 212, 2597, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1260
theorem bank_node_1261 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({506, 627, 2622} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{506, 627, 2622}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨506, 627, 2622, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1261
theorem bank_node_1262 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({943, 1472, 2624} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{943, 1472, 2624}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨943, 1472, 2624, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1262
theorem bank_node_1263 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1258, 2414, 2627} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1258, 2414, 2627}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1258, 2414, 2627, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1263
theorem bank_node_1264 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({423, 504, 2632} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{423, 504, 2632}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨423, 504, 2632, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1264
theorem bank_node_1265 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({150, 159, 2650} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{150, 159, 2650}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨150, 159, 2650, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1265
theorem bank_node_1266 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1131, 1972, 2652} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1131, 1972, 2652}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1131, 1972, 2652, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1266
theorem bank_node_1267 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1295, 2520, 2664} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1295, 2520, 2664}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1295, 2520, 2664, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1267
theorem bank_node_1268 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({817, 1178, 2666} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{817, 1178, 2666}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨817, 1178, 2666, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1268
theorem bank_node_1269 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({748, 1037, 2684} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{748, 1037, 2684}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨748, 1037, 2684, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1269
theorem bank_node_1270 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1254, 2343, 2698} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1254, 2343, 2698}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1254, 2343, 2698, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1270
theorem bank_node_1271 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({798, 1159, 2562} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{798, 1159, 2562}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨798, 1159, 2562, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1271
theorem bank_node_1272 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({336, 385, 2640} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{336, 385, 2640}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨336, 385, 2640, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1272
theorem bank_node_1273 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({102, 106, 2703} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{102, 106, 2703}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨102, 106, 2703, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1273
theorem bank_node_1274 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({598, 767, 2714} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{598, 767, 2714}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨598, 767, 2714, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1274
theorem bank_node_1275 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({517, 638, 2726} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{517, 638, 2726}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨517, 638, 2726, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1275
theorem bank_node_1276 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1209, 2170, 2730} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1209, 2170, 2730}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1209, 2170, 2730, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1276
theorem bank_node_1277 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1066, 1742, 2747} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1066, 1742, 2747}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1066, 1742, 2747, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1277
theorem bank_node_1278 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({903, 1344, 2752} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{903, 1344, 2752}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨903, 1344, 2752, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1278
theorem bank_node_1279 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({52, 53, 2756} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{52, 53, 2756}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨52, 53, 2756, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1279
theorem bank_node_1280 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1248, 2272, 2769} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1248, 2272, 2769}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1248, 2272, 2769, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1280
theorem bank_node_1281 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1107, 1836, 2788} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1107, 1836, 2788}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1107, 1836, 2788, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1281
theorem bank_node_1282 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({946, 1430, 2795} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{946, 1430, 2795}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨946, 1430, 2795, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1282
theorem bank_node_1283 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({533, 702, 2214} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{533, 702, 2214}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨533, 702, 2214, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1283
theorem bank_node_1284 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({760, 1121, 2360} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{760, 1121, 2360}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨760, 1121, 2360, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1284
theorem bank_node_1285 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({329, 378, 2538} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{329, 378, 2538}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨329, 378, 2538, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1285
theorem bank_node_1286 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1092, 1876, 2613} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1092, 1876, 2613}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1092, 1876, 2613, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1286
theorem bank_node_1287 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1148, 1932, 2829} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1148, 1932, 2829}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1148, 1932, 2829, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1287
theorem bank_node_1288 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({528, 649, 2832} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{528, 649, 2832}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨528, 649, 2832, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1288
theorem bank_node_1289 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({441, 522, 2842} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{441, 522, 2842}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨441, 522, 2842, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1289
theorem bank_node_1290 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({53, 54, 2862} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{53, 54, 2862}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨53, 54, 2862, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1290
theorem bank_node_1291 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({658, 854, 2867} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{658, 854, 2867}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨658, 854, 2867, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1291
theorem bank_node_1292 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1189, 2030, 2870} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1189, 2030, 2870}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1189, 2030, 2870, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1292
theorem bank_node_1293 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({855, 1216, 2880} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{855, 1216, 2880}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨855, 1216, 2880, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1293
theorem bank_node_1294 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1365, 2590, 2886} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1365, 2590, 2886}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1365, 2590, 2886, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1294
theorem bank_node_1295 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1075, 1700, 2924} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1075, 1700, 2924}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1075, 1700, 2924, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1295
theorem bank_node_1296 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1012, 1541, 2948} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1012, 1541, 2948}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1012, 1541, 2948, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1296
theorem bank_node_1297 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1271, 2232, 2952} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1271, 2232, 2952}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1271, 2232, 2952, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1297
theorem bank_node_1298 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({357, 406, 2958} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{357, 406, 2958}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨357, 406, 2958, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1298
theorem bank_node_1299 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1443, 2812, 2964} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1443, 2812, 2964}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1443, 2812, 2964, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1299
theorem bank_node_1300 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({520, 689, 2120} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{520, 689, 2120}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨520, 689, 2120, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1300
theorem bank_node_1301 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1178, 2139, 2622} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1178, 2139, 2622}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1178, 2139, 2622, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1301
theorem bank_node_1302 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({720, 976, 2745} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{720, 976, 2745}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨720, 976, 2745, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1302
theorem bank_node_1303 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1240, 2201, 2840} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1240, 2201, 2840}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1240, 2201, 2840, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1303
theorem bank_node_1304 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1032, 1608, 2881} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1032, 1608, 2881}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1032, 1608, 2881, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1304
theorem bank_node_1305 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({490, 590, 2891} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{490, 590, 2891}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨490, 590, 2891, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1305
theorem bank_node_1306 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({159, 168, 2968} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{159, 168, 2968}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨159, 168, 2968, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1306
theorem bank_node_1307 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1482, 2926, 3003} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1482, 2926, 3003}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1482, 2926, 3003, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1307
theorem bank_node_1308 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({799, 1088, 3008} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{799, 1088, 3008}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨799, 1088, 3008, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1308
theorem bank_node_1309 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({408, 472, 3009} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{408, 472, 3009}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨408, 472, 3009, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1309
theorem bank_node_1310 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1353, 2442, 3034} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1353, 2442, 3034}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1353, 2442, 3034, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_1310
end BaselineSmall
