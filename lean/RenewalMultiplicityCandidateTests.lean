import RenewalMultiplicityCandidate

/-! Candidate tests; hosted compilation is required before claiming success. -/
open Finset RenewalMultiplicityCandidate

example : expansion (fun _ => 3) (fun _ n => if 0 < n then 1 else 0) 1 3 = 2 := by decide
example : expansion (fun _ => 3) (fun _ n => if 0 < n then 1 else 0) 2 3 = 5 := by decide
example : expansion (fun _ => 3) (fun _ n => if 0 < n then 1 else 0) 20 0 = 0 := by decide
example : expansion (fun _ => 3) (fun _ n => if 0 < n then 1 else 0) 0 5 = 0 := by decide

-- Two cells overlap at the same block; one has two occurrences there.
private def cells : Finset ℕ := {0, 1}
private def blocks : Finset ℕ := {1}
private def height (_ : ℕ) : ℕ := 1
private def mult (i q : ℕ) : ℕ := if q = 1 then (if i = 0 then 2 else 1) else 0
private def count (i : ℕ) : ℕ := if i = 0 then 2 else 1

example : (∑ i ∈ cells, height i * mult i 1) = 3 := by decide
example : ∀ i ∈ cells, count i = ∑ q ∈ blocks, mult i q := by decide
-- Both separate bounds hold, but their sum cannot fit demand 2.
example : mult 0 1 ≤ 2 ∧ mult 1 1 ≤ 2 := by decide
example : ¬ ((∑ i ∈ cells, height i * mult i 1) ≤ 2) := by decide
example : ¬ (2 = ∑ q ∈ blocks, mult 1 q) := by decide

-- A real edge gives positive demand: 2·3 is not 1·(2+3),
-- but 3·6 = 2·(3+6). The vertex set contains {2,3,6}.
private theorem positiveDemand : RenewalNext.Demand SmoothRenewal.Edge
    (SmoothRenewal.vertices (Icc 1 6) 6) 1 := by
  classical
  have hedge : SmoothRenewal.Edge ({2, 3, 6} : Finset ℕ) := by
    refine ⟨2, 3, 6, by decide, by decide, by decide, by decide, rfl⟩
  have hsub : ({2, 3, 6} : Finset ℕ) ⊆ SmoothRenewal.vertices (Icc 1 6) 6 := by
    intro x hx
    have hxrange : x ∈ Icc 1 6 := by
      simp only [mem_insert, mem_singleton] at hx
      rcases hx with rfl | rfl | rfl <;> decide
    rw [SmoothRenewal.vertices, mem_filter]
    refine ⟨hxrange, ?_⟩
    intro q hq hdiv
    have hle : q ≤ x := Nat.le_of_dvd (mem_Icc.mp hxrange).1 hdiv
    exact mem_Icc.mpr ⟨hq.pos, le_trans hle (mem_Icc.mp hxrange).2⟩
  intro C hc
  obtain ⟨x, hxe, hxC⟩ := hc _ hedge hsub
  exact Finset.one_le_card.mpr ⟨x, mem_inter.mpr ⟨hxC, hsub hxe⟩⟩

-- A positive, satisfiable allocation, with concrete roughness and demand.
example (A : Finset ℕ) (hA : A ⊆ Icc 1 6)
    (hf : ∀ x y z, SmoothRenewal.Triple x y z → x ∈ A → y ∈ A → z ∈ A → False) :
    A.card + 1 ≤ 6 := by
  have hr : ∀ q ∈ ({1} : Finset ℕ), SmoothPartition.Rough (Icc 1 6) q := by
    intro q hq
    have : q = 1 := by simpa using hq
    subst q
    refine ⟨by decide, ?_⟩
    intro p hp _ hdiv
    exact hp.ne_one (Nat.dvd_one.mp hdiv)
  have hd : ∀ q ∈ ({1} : Finset ℕ), RenewalNext.Demand SmoothRenewal.Edge
      (SmoothRenewal.vertices (Icc 1 6) (6 / q)) 1 := by
    intro q hq
    have : q = 1 := by simpa using hq
    subst q
    simpa using positiveDemand
  have h := occurrence_cover ({0} : Finset ℕ) ({1} : Finset ℕ) (Icc 1 6) A 6
    (fun _ => 1) (fun _ _ => 1) (fun _ => 1) (fun _ => 1)
    hA hf hr hd (by decide) (by decide)
  simpa using h
