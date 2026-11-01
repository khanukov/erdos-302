import Scaling

open ArchiveScaling

-- Actual archive image 2 = [0,4,1], node 0 support [2,3,6], demand 1.
def source : Finset ℕ := {2,3,6}

theorem source_bound : Bound source 1 := by
  intro S hs
  have he : Edge source 2 3 6 := by norm_num [Edge, source]
  rcases hs 2 3 6 he with h | h | h
  all_goals exact Finset.card_pos.mpr ⟨_, h⟩

theorem archive_image_2 : Bound ({8,12,24} : Finset ℕ) 1 := by
  have h := bound_image (U := source) (m := 4) (d := 1) (r := 1)
    (by decide) (by decide) (by intro x hx; simp) source_bound
  have himage : image source 4 1 = ({8,12,24} : Finset ℕ) := by decide
  simpa [himage] using h

-- Synthetic fractional image: [2,3,6] * 2/2 = [2,3,6].
-- Non-coprime inputs deliberately exercise the theorem's greater generality.
theorem fractional_identity : Bound (image source 2 2) 1 := by
  apply bound_image (by decide) (by decide) ?_ source_bound
  intro x hx
  exact ⟨x, by omega⟩

-- A reduced, genuinely fractional scale with exact products.
def sourceEven : Finset ℕ := {4,6,12}

theorem source_even_bound : Bound sourceEven 1 := by
  intro S hs
  have he : Edge sourceEven 4 6 12 := by norm_num [Edge, sourceEven]
  rcases hs 4 6 12 he with h | h | h
  all_goals exact Finset.card_pos.mpr ⟨_, h⟩

theorem fractional_three_halves : Bound ({6,9,18} : Finset ℕ) 1 := by
  have hex : ∀ x ∈ sourceEven, 2 ∣ x*3 := by decide
  have h := bound_image (U := sourceEven) (m := 3) (d := 2) (r := 1)
    (by decide) (by decide) hex source_even_bound
  have himage : image sourceEven 3 2 = ({6,9,18} : Finset ℕ) := by decide
  simpa [himage] using h

-- A genuinely non-integral image must fail the divisibility premise.
example : ¬ (2 ∣ 3*1) := by decide

-- Reciprocal edge relation is reflected as well as preserved.
example : Edge (image source 4 1) (scale 4 1 2) (scale 4 1 3) (scale 4 1 6) ↔ Edge source 2 3 6 := by
  apply edge_image_iff (by decide) (by decide)
  · intro x hx; simp
  all_goals norm_num [source]

#print axioms archive_image_2
#print axioms fractional_identity
