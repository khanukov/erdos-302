#!/usr/bin/env python3
"""Generate the conditional direct node-1190 bridge from the pinned archive.

Archive interpretation and transcription are Python trust assumptions; the Lean
subset and soundness bridge are separately checked by Lean in the CI candidate.
"""
import argparse
from pathlib import Path
import node1209_closure as closure

OUT = closure.OUT / 'DirectCandidate.lean'

def generate(doc):
    nodes = doc['nodes']
    if len(nodes) != 376:
        raise ValueError('node inventory')
    child, root = nodes[374:376]
    # Re-extract from SHA-256 authenticated bank bytes, not from the supplied
    # document: aggregate sizes and the set difference miss coordinated edits.
    pinned = closure.extract()['nodes']
    if any(nodes[i]['support'] != pinned[i]['support'] for i in (374, 375)):
        raise ValueError('direct supports differ from pinned archive replay')
    a, b = set(child['support']), set(root['support'])
    if (child['original'], root['original'], child['demand'], root['demand'],
        len(a), len(b), sorted(b - a), len(root['references'])) != (1190, 1209, 258, 258, 899, 901, [1892, 1900], 510) or not a <= b:
        raise ValueError('unexpected direct bridge data')
    return '''import DenseData
import Node1209SourceCandidate

/- Candidate: the first 375 dense checks are explicit hypotheses. Archive
   extraction and the Python translation are not kernel provenance. -/
namespace Node1209DirectCandidate
set_option maxRecDepth 100000
set_option maxHeartbeats 100000000

theorem source_subset :
    (Node1209Dense.nodes 374).support ⊆ Node1209SourceCandidate.node.support := by
  decide

theorem source_bound
    (prefix : ∀ i < 375,
      MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes i) :
    Extended.Bound ExtensionFirstArchive.source 258 := by
  have hb := MixedCaseTrimCandidate.sound Node1209Dense.nodes 375 prefix 374 (by decide)
  have ht := Extended.bound_mono source_subset hb
  change Extended.Bound Node1209SourceCandidate.node.support
    Node1209SourceCandidate.node.demand at ht
  rw [Node1209SourceCandidate.support_identity,
    Node1209SourceCandidate.demand_identity] at ht
  exact ht

#print axioms source_subset
#print axioms source_bound
end Node1209DirectCandidate
'''

def main():
    p = argparse.ArgumentParser()
    p.add_argument('--check', action='store_true')
    args = p.parse_args()
    result = generate(closure.extract()).encode()
    if args.check:
        if OUT.read_bytes() != result:
            raise ValueError('direct candidate bytes mismatch')
    else:
        OUT.write_bytes(result)
    print('PASS direct candidate generation; archive-to-Lean provenance is external')

if __name__ == '__main__':
    main()
