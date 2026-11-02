# Factor-count bijection candidate

`lean/FactorCountCandidate.lean` proposes a theorem, not an assumed equality: the sigma finite set of rough q and smooth t maps by multiplication to the actual archive-style cell. The proof attempts injectivity by uniqueness of the suffix decomposition and surjectivity by its existence. Hypotheses: a,b positive; every prefix element prime; prefix and suffix disjoint. Suffix primality is not needed by the definitions: nonprime suffix elements are inert. N may be zero, and the cell may be empty or reversed.

**Not CI-ready / not kernel-checked.** No Lean build was performed, per the no-heavy-Lean restriction. The candidate imports earlier unchecked candidates, notably `SmoothExistence.lean` and `SuffixBijectionCandidate.lean`; proof scripts and API names may fail. `FactorCountCandidateTests.lean` is only an interface check, also unchecked. Establish a mathlib environment, build the complete import closure and this file, correct errors, inspect `#print axioms`, and add the checked build to CI before relying on the statement. No actual archive prime-index correspondence or renewal/cover estimate is proved.

`python3 -m unittest discover -s tests -p 'test_*factor*.py'` runs finite independent-model checks including explicit counterexamples to dropping disjointness, prefix primality, a>0 or b>0. These are sanity checks, not Lean proofs.
