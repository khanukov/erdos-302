# Conditional seed subset replay

`seed_subset.py` selects the first maximizing seed witness at points where the
seed strictly exceeds every other recurrence operand, unions these witnesses
across all 20 levels, and replays the recurrence using only that subset. It
compares each resulting profile hash and correction-cell list with the full
replay. Ties and source order are deterministic. This is a **sufficient** subset
for this replay, not a minimality claim; no search for a minimum was performed.

The committed `seed_subset_certificate.json` has SHA-256
`a1ed7778bdfd154d37964bce592b957bb9b039379fa35d58a8a80a6fd235e0f9`.
It records 556 bank seed witnesses and 515 extension rows. The transitive
dependency closure of their roots contains all 4,106 bank nodes, including the
four external-assumption nodes. Thus the smaller seed set does not eliminate the
full bank dependency burden. The final level contains 5,520 positive correction
runs; masks include all tied active operands, while an active seed records its
first maximizing witness, which need not itself be selected when tied.

This is conditional, data-only Python evidence, not a Lean proof. The four
external old-profile bounds remain assumptions, as described in README.md;
the Python interpreter and recurrence are not formally proved sound. It does
not establish archive-to-Lean correspondence, an infinite tail, or a final
unconditional theorem. The archive hash binds bytes, not author provenance.
A previous independent in-memory replay reproduced the committed bytes; this
is not a claim that a hosted workflow has run for this commit.

Run the inexpensive tests in normal and optimized Python:

```
python3 -B -m unittest discover -s independent_bank -p test_seed_subset.py -v
python3 -B -O -m unittest discover -s independent_bank -p test_seed_subset.py -v
```

The manually dispatched `Conditional seed subset replay` workflow is bounded
to 20 minutes, runs both test modes, and performs one full in-memory replay,
comparing its canonical JSON bytes to the committed certificate without writing
it. The timeout is a limit, not a guarantee of hosted completion. It uses the
pinned archive and does not execute code from it. No hosted run, publication, or
Lean build is implied by adding the workflow.
