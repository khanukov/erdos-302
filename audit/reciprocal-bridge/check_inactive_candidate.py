#!/usr/bin/env python3
"""Fail closed on forbidden proof shortcuts and changed sample projections."""
import re
from pathlib import Path
from probe_inactive_retention import literal

root = Path(__file__).resolve().parent
source = (root / 'InactiveRetentionCandidate.lean').read_text(encoding='utf-8')
# Conservative lexical scan: forbidden words in comments also fail.
if re.search(r'\b(?:sorry|admit|native_decide|axiom|unsafe)\b', source):
    raise SystemExit('forbidden token in candidate source')
if re.findall(r'^import\s+(.+)$', source, re.M) != ['UpperBridge']:
    raise SystemExit('unexpected import closure')
u = literal(root / 'FourEdgeUniversesCandidate.lean', 'universe_1097')
v = literal(root / 'FourExternalCandidate.lean', 'active_1097')
su = literal(root / 'InactiveRetentionCandidate.lean', 'sampleU')
sv = literal(root / 'InactiveRetentionCandidate.lean', 'sampleV')
if su != {1, 2, 3, 6} or sv != {2, 3, 6} or not su <= u or sv != su & v:
    raise SystemExit('sample does not match node 1097 literal projection')
print('PASS: source scan and sample projection (not archive authentication)')
