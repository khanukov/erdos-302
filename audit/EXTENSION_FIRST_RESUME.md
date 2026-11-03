# First extension candidate (2026-11-02)

This is a staged candidate, **not a completed or kernel-verified proof**. No
Lean build, axiom gate, hosted run, or remote operation was performed for this
revision. The new declarations may fail elaboration or exhaust resources.

The generator hashes and parses the same pinned archive bytes through
`load_inputs`, interprets the full bank conditionally, and validates all 515
extension rows. It then emits the first node-1209 support (901 vertices),
level-15 target (837 vertices), the row's deletion list, and a proposed executable pair-boundary
certificate. The deletion literal is generated from the authenticated row, not
an independently maintained Lean definition; mutation is rejected by the same
byte comparison used by the CLI. `test_generated_matches_authenticated_archive` compares the
entire generated Lean file byte-for-byte. These Python checks are not a kernel
proof of archive-to-literal correspondence, smoothness, bank validity, or any
profile theorem; the full interpretation still assumes the four external
active-profile bounds documented in `EXTENSION_515_CANDIDATE.md`.

`PairBoundary` considers each ordered pair b<c and calculates a=bc/(b+c);
the explicit equality guard avoids accepting a truncated nonintegral
candidate. `pair_boundary_sound` proposes to derive the cubic boundary from
this pair check using natural division cancellation. The row theorem has no
boundary hypothesis, but its 258 source-demand hypothesis remains. The prefix
theorem additionally assumes the requested P is contained in the literal
target; it does not establish that target equals the formal smooth subset or
that P is a specific profile prefix. No theorem yet links source with an
actual checked bank node, nor connects the seed to the archive max recurrence.
The finite checker is monolithic over 901² pairs, with a finite heartbeat and
CI timeout; its feasibility is untested and may require sharding. The 514
other extension witnesses, archive translation proof, external leaves,
recurrence/corrections, tail, and final endpoint remain open.

The diagnostic workflow stages the complete exact local closure and proposes
explicit axiom gates for both generic and literal declarations. It is configured
for push, pull request, and manual dispatch, but has not been run. The source and exclusion inventory
tests and Python checks are evidence of staging and data replay only. The
example with one actual reciprocal triple proposes a nonvacuous positive
Lean test, while the negative example proposes rejection of an uncovered edge;
these too require compilation before they count as tests.
