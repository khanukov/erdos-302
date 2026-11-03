import SparseTriple
open SparseTriple
example : (6,10,15) ∈ candidates [6,10,15] [6] := by decide
example : (6,10,15) ∈ candidates [6,10,15] [10] := by decide
example : (6,10,15) ∈ candidates [6,10,15] [15] := by decide
example : (6,10,14) ∉ candidates [6,10,15,14] [6] := by decide
example : (6,10,15) ∉ candidates [6,10] [6] := by decide
