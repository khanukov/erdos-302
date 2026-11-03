# Dynamic occurrence paths: checked sublemma and gaps

`lean/OccurrencePath.lean` defines an inductive dynamic path with `k < n` at each step and next argument `n / p j ^ k`. `path_mem` and `mem_path` prove that its values are exactly the values in the real `occurrences` list. `occurrence_position_path` applies this to each list position; `path_shape` proves the level bound and exponent-list length. No primality or bijection hypothesis is used. The paths include zero arguments and equal arguments at distinct positions.

This does **not** yet establish that each path has a unique list position, that positions are injectively represented by choices, the product/quotient formula, or a list-to-Finsupp equivalence. Therefore it does not prove the occurrence–smooth-factor bijection, positivity/surjectivity, quotient-cell restriction, multiplicity accounting, or the final bound. The value-membership converse is not a position uniqueness theorem.

The isolated `occurrence-path-candidate.yml` is a CI candidate, not a reported hosted success. It rebuilds the actual occurrence recursion, path theorem and bounded examples using digest-pinned Lean and gates theorem axioms. The bounded examples cover empty input, zero arguments, equal arguments at distinct list entries, and small levels/arguments; they are not a substitute for the universal proofs.
