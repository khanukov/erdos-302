import ExtensionSeedCandidate
import SparseBoundary

/-! Bridge from the list proof to the actual ordered-edge boundary. This file
    asserts nothing about the origin of any literal witness. -/
namespace SparseBoundaryMathlib

open Finset

theorem list_boundary_iff (S T U : Finset ℕ) :
    SparseBoundary.Boundary S.toList T.toList U.toList ↔
      ExtensionSeedCandidate.Boundary S T U := by
  simp only [SparseBoundary.Boundary, ExtensionSeedCandidate.Boundary,
    Finset.mem_toList, Finset.subset_iff, Finset.mem_sdiff,
    UpperBridge.OrderedEdge, SparseTriple.edge]
  constructor
  · rintro ⟨ht, hu, he⟩
    refine ⟨ht, hu, ?_⟩
    intro a ha b hb c hc hedge
    exact he a b c ha hb hc hedge.2.2.2
  · rintro ⟨ht, hu, he⟩
    refine ⟨ht, hu, ?_⟩
    intro a b c ha hb hc hedge
    exact he a ha b hb c hc ⟨ha, hb, hc, hedge⟩

theorem check_iff_boundary (S T U : Finset ℕ) :
    SparseBoundary.check S.toList T.toList U.toList = true ↔
      ExtensionSeedCandidate.Boundary S T U :=
  (SparseBoundary.check_iff _ _ _).trans (list_boundary_iff S T U)

#print axioms list_boundary_iff
#print axioms check_iff_boundary
end SparseBoundaryMathlib
