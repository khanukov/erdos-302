# Literal bank structural taxonomy and scaling probe

Run `python3 independent_bank/rule_taxonomy.py` and
`python3 -O -m unittest discover -s independent_bank -p 'test_rule_taxonomy.py' -v`.
The analyzer hashes and parses the same compressed source bytes, pinned at
`5c1a1fa4edcc1a0bc7ac3fc9cd3bc7fca4eedad6cb689b6540436ca35ed89034`;
the larger publication archive provenance is documented in REPLAY_INVENTORY.md.

The pinned data contains 4,106 nodes (3,528 small, 448 pack, 122 case,
4 externalActive, 3 trim, 1 qpack), 25,744 image definitions and **623,846
image uses**: 567,484 pack, 56,352 case, 7 qpack and 3 trim. Each use is
checked against its actual consumer for a strictly earlier source node, not
merely an in-range image index. Maximum backward distance is 4,105. Distinct
uses are counted, not deduplicated; a dependency-only graph does not carry
weights, scales, order or repeated occurrences. Case `cs` is an ordered list of
occurrences: repeated image references are permitted and counted separately.
Tree constraint indices address positions in that list. A dual row may refer to
two distinct positions that happen to contain the same image, but repeating the
same constraint index within one dual row is rejected.

The 122 case trees contain 1,352 dual, 1,230 split and 44 force rows; all
2,504 child edges point backward, every case-tree row is reachable from its
root, and all constraint indices are in range. Budget and row are supported
structurally but do not occur in this archive. Tests cover all five tree forms,
self and forward image references, bad child references, invalid constraint
references, unknown rules, unreachable rows, duplicate packing images and
Boolean impostors. Unknown schema variants are rejected. Counts refer to
literal structural data only.

This is a **structural taxonomy**, not a generator or semantic replay: it does
not establish supports, normalization, scale integrality, capacity, case path
semantics, external hypotheses, mathematical bounds or archive-byte-to-Lean
correspondence. Existing `ArchiveDag.sound`, `ArchivePack.sound`,
`BankCase.check_sound` and `BankCase.dualCheck_sound` are potential formal
building blocks, not evidence that this Python test or these 4,106 archive nodes
have been kernel-checked. The 623,846 references and case-tree size show why
static per-node templates alone are not a scalable replay strategy; a generated,
sharded representation with checked dependencies and a verified archive bridge
remains necessary. No Lean build is run by this probe.
