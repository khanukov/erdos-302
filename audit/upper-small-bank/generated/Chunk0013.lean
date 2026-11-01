import UpperBank
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace BaselineSmall
theorem bank_node_2139 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2961, 5170, 6930} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2961, 5170, 6930}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2961, 5170, 6930, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2139
theorem bank_node_2140 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2201, 3162, 7242} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2201, 3162, 7242}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2201, 3162, 7242, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2140
theorem bank_node_2141 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2325, 3286, 7950} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2325, 3286, 7950}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2325, 3286, 7950, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2141
theorem bank_node_2142 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1653, 2014, 9222} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1653, 2014, 9222}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1653, 2014, 9222, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2142
theorem bank_node_2143 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4189, 7670, 9230} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4189, 7670, 9230}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4189, 7670, 9230, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2143
theorem bank_node_2144 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4485, 8710, 9246} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4485, 8710, 9246}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4485, 8710, 9246, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2144
theorem bank_node_2145 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3774, 6375, 9250} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3774, 6375, 9250}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3774, 6375, 9250, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2145
theorem bank_node_2146 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3675, 6076, 9300} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3675, 6076, 9300}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3675, 6076, 9300, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2146
theorem bank_node_2147 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1596, 2380, 4845} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1596, 2380, 4845}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1596, 2380, 4845, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2147
theorem bank_node_2148 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1771, 2300, 7700} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1771, 2300, 7700}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1771, 2300, 7700, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2148
theorem bank_node_2149 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3816, 6625, 9000} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3816, 6625, 9000}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3816, 6625, 9000, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2149
theorem bank_node_2150 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3080, 4680, 9009} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3080, 4680, 9009}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3080, 4680, 9009, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2150
theorem bank_node_2151 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({651, 700, 9300} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{651, 700, 9300}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨651, 700, 9300, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2151
theorem bank_node_2152 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2960, 4329, 9360} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2960, 4329, 9360}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2960, 4329, 9360, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2152
theorem bank_node_2153 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4331, 8052, 9372} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4331, 8052, 9372}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4331, 8052, 9372, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2153
theorem bank_node_2154 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4623, 9112, 9384} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4623, 9112, 9384}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4623, 9112, 9384, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2154
theorem bank_node_2155 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3465, 5490, 9394} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3465, 5490, 9394}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3465, 5490, 9394, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2155
theorem bank_node_2156 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2835, 4060, 9396} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2835, 4060, 9396}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2835, 4060, 9396, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2156
theorem bank_node_2158 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({231, 240, 6160} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{231, 240, 6160}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨231, 240, 6160, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2158
theorem bank_node_2159 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3225, 5074, 8850} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3225, 5074, 8850}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3225, 5074, 8850, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2159
theorem bank_node_2160 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2706, 3795, 9430} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2706, 3795, 9430}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2706, 3795, 9430, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2160
theorem bank_node_2161 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3354, 5203, 9438} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3354, 5203, 9438}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3354, 5203, 9438, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2161
theorem bank_node_2162 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4402, 8246, 9443} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4402, 8246, 9443}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4402, 8246, 9443, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2162
theorem bank_node_2163 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3724, 6125, 9500} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3724, 6125, 9500}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3724, 6125, 9500, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2163
theorem bank_node_2164 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({50, 51, 2550} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{50, 51, 2550}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨50, 51, 2550, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2164
theorem bank_node_2165 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2840, 4440, 7881} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2840, 4440, 7881}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2840, 4440, 7881, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2165
theorem bank_node_2166 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({285, 294, 9310} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{285, 294, 9310}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨285, 294, 9310, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2166
theorem bank_node_2167 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4473, 8442, 9514} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4473, 8442, 9514}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4473, 8442, 9514, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2167
theorem bank_node_2168 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4070, 7095, 9546} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4070, 7095, 9546}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4070, 7095, 9546, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2168
theorem bank_node_2169 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3619, 5828, 9548} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3619, 5828, 9548}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3619, 5828, 9548, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2169
theorem bank_node_2170 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2997, 4366, 9558} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2997, 4366, 9558}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2997, 4366, 9558, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2170
theorem bank_node_2171 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4544, 8640, 9585} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4544, 8640, 9585}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4544, 8640, 9585, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2171
theorem bank_node_2172 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3975, 6784, 9600} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3975, 6784, 9600}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3975, 6784, 9600, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2172
theorem bank_node_2174 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({182, 186, 8463} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{182, 186, 8463}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨182, 186, 8463, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2174
theorem bank_node_2175 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2343, 3432, 7384} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2343, 3432, 7384}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2343, 3432, 7384, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2175
theorem bank_node_2176 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({957, 1078, 8526} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{957, 1078, 8526}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨957, 1078, 8526, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2176
theorem bank_node_2177 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3572, 5781, 9348} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3572, 5781, 9348}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3572, 5781, 9348, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2177
theorem bank_node_2178 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3120, 4641, 9520} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3120, 4641, 9520}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3120, 4641, 9520, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2178
theorem bank_node_2179 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3696, 6000, 9625} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3696, 6000, 9625}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3696, 6000, 9625, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2179
theorem bank_node_2180 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3078, 4522, 9639} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3078, 4522, 9639}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3078, 4522, 9639, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2180
theorem bank_node_2181 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4615, 8840, 9656} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4615, 8840, 9656}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4615, 8840, 9656, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2181
theorem bank_node_2182 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1023, 1144, 9672} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1023, 1144, 9672}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1023, 1144, 9672, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2182
theorem bank_node_2183 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3280, 4961, 9680} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3280, 4961, 9680}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3280, 4961, 9680, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2183
theorem bank_node_2185 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2204, 3045, 7980} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2204, 3045, 7980}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2204, 3045, 7980, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2185
theorem bank_node_2186 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({455, 480, 8736} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{455, 480, 8736}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨455, 480, 8736, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2186
theorem bank_node_2187 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3666, 5875, 9750} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3666, 5875, 9750}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3666, 5875, 9750, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2187
theorem bank_node_2188 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4757, 9246, 9798} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4757, 9246, 9798}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4757, 9246, 9798, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2188
theorem bank_node_2190 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1118, 1287, 8514} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1118, 1287, 8514}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1118, 1287, 8514, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2190
theorem bank_node_2191 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({819, 988, 4788} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{819, 988, 4788}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨819, 988, 4788, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2191
theorem bank_node_2192 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2295, 3024, 9520} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2295, 3024, 9520}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2295, 3024, 9520, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2192
theorem bank_node_2193 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3240, 4840, 9801} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3240, 4840, 9801}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3240, 4840, 9801, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2193
theorem bank_node_2194 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4028, 6837, 9804} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4028, 6837, 9804}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4028, 6837, 9804, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2194
theorem bank_node_2195 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4366, 7847, 9842} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4366, 7847, 9842}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4366, 7847, 9842, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2195
theorem bank_node_2196 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3927, 6528, 9856} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3927, 6528, 9856}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3927, 6528, 9856, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2196
theorem bank_node_2197 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1209, 1378, 9858} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1209, 1378, 9858}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1209, 1378, 9858, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2197
theorem bank_node_2198 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2635, 3596, 9860} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2635, 3596, 9860}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2635, 3596, 9860, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2198
theorem bank_node_2199 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1034, 1155, 9870} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1034, 1155, 9870}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1034, 1155, 9870, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2199
theorem bank_node_2200 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3321, 5002, 9882} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3321, 5002, 9882}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3321, 5002, 9882, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2200
theorem bank_node_2201 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2494, 3335, 9890} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2494, 3335, 9890}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2494, 3335, 9890, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2201
theorem bank_node_2202 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({99, 100, 9900} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{99, 100, 9900}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨99, 100, 9900, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2202
theorem bank_node_2204 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1886, 3567, 4002} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1886, 3567, 4002}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1886, 3567, 4002, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2204
theorem bank_node_2205 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2175, 3016, 7800} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2175, 3016, 7800}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2175, 3016, 7800, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2205
theorem bank_node_2206 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({98, 99, 9702} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{98, 99, 9702}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨98, 99, 9702, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2206
theorem bank_node_2207 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3198, 4719, 9922} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3198, 4719, 9922}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3198, 4719, 9922, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2207
theorem bank_node_2208 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4899, 9660, 9940} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4899, 9660, 9940}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4899, 9660, 9940, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2208
theorem bank_node_2209 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4350, 7714, 9975} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4350, 7714, 9975}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4350, 7714, 9975, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2209
theorem bank_node_2210 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4514, 8235, 9990} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4514, 8235, 9990}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4514, 8235, 9990, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2210
theorem bank_node_2211 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({552, 616, 5313} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{552, 616, 5313}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨552, 616, 5313, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2211
theorem bank_node_2212 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3315, 5916, 7540} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3315, 5916, 7540}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3315, 5916, 7540, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2212
theorem bank_node_2213 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2001, 2530, 9570} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2001, 2530, 9570}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2001, 2530, 9570, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2213
theorem bank_node_2214 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4392, 8113, 9576} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4392, 8113, 9576}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4392, 8113, 9576, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2214
theorem bank_node_2215 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1364, 2325, 3300} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1364, 2325, 3300}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1364, 2325, 3300, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2215
theorem bank_node_2216 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4081, 6890, 10010} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4081, 6890, 10010}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4081, 6890, 10010, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2216
theorem bank_node_2217 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4970, 9870, 10011} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4970, 9870, 10011}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4970, 9870, 10011, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2217
theorem bank_node_2218 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3483, 5332, 10044} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3483, 5332, 10044}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3483, 5332, 10044, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2218
theorem bank_node_2219 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4425, 7906, 10050} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4425, 7906, 10050}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4425, 7906, 10050, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2219
theorem bank_node_2220 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1045, 1166, 10070} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1045, 1166, 10070}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1045, 1166, 10070, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2220
theorem bank_node_2221 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3564, 5500, 10125} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3564, 5500, 10125}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3564, 5500, 10125, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2221
theorem bank_node_2222 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4575, 8296, 10200} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4575, 8296, 10200}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4575, 8296, 10200, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2222
theorem bank_node_2223 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1748, 2109, 10212} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1748, 2109, 10212}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1748, 2109, 10212, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2223
theorem bank_node_2224 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2838, 3927, 10234} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2838, 3927, 10234}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2838, 3927, 10234, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2224
theorem bank_node_2225 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3526, 5375, 10250} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3526, 5375, 10250}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3526, 5375, 10250, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2225
theorem bank_node_2226 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({5112, 10153, 10296} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{5112, 10153, 10296}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨5112, 10153, 10296, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2226
theorem bank_node_2227 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4389, 7638, 10318} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4389, 7638, 10318}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4389, 7638, 10318, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2227
theorem bank_node_2228 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3807, 6016, 10368} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3807, 6016, 10368}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3807, 6016, 10368, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2228
theorem bank_node_2229 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3145, 4514, 10370} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3145, 4514, 10370}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3145, 4514, 10370, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2229
theorem bank_node_2230 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4466, 7830, 10395} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4466, 7830, 10395}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4466, 7830, 10395, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2230
theorem bank_node_2231 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4958, 9447, 10434} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4958, 9447, 10434}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4958, 9447, 10434, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2231
theorem bank_node_2232 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({4543, 8024, 10472} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{4543, 8024, 10472}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨4543, 8024, 10472, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2232
theorem bank_node_2233 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({741, 1102, 2262} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{741, 1102, 2262}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨741, 1102, 2262, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2233
theorem bank_node_2234 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2345, 3570, 6834} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2345, 3570, 6834}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2345, 3570, 6834, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2234
theorem bank_node_2235 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({572, 741, 2508} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{572, 741, 2508}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨572, 741, 2508, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2235
theorem bank_node_2236 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1520, 1881, 7920} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1520, 1881, 7920}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1520, 1881, 7920, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2236
theorem bank_node_2237 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2926, 4370, 8855} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2926, 4370, 8855}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2926, 4370, 8855, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2237
theorem bank_node_2238 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({470, 495, 9306} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{470, 495, 9306}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨470, 495, 9306, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2238
theorem bank_node_2239 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2604, 3565, 9660} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2604, 3565, 9660}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2604, 3565, 9660, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2239
theorem bank_node_2240 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({1547, 1836, 9828} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{1547, 1836, 9828}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨1547, 1836, 9828, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2240
theorem bank_node_2241 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2666, 3627, 10062} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2666, 3627, 10062}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2666, 3627, 10062, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2241
theorem bank_node_2242 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({3108, 4477, 10164} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{3108, 4477, 10164}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨3108, 4477, 10164, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2242
theorem bank_node_2243 : ∀ S : Finset ℕ,
    UpperBridge.OrderedCover ({2093, 2622, 10374} : Finset ℕ) S → 1 ≤ S.card := by
  apply UpperBank.ordered_sound (E := {{2093, 2622, 10374}})
  · decide
  · intro e he
    simp only [Finset.mem_insert, Finset.mem_singleton] at he
    subst e
    exact ⟨2093, 2622, 10374, by unfold UpperBridge.OrderedEdge; decide, rfl⟩
#print axioms bank_node_2243
end BaselineSmall
