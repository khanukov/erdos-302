"""Translate exactly archive case 4, not the bank or arbitrary certificates.

Archive identity is checked by load_archive in the CLI; Python is not a proof.
"""
import json
from math import gcd
from pathlib import Path
import sys

from bank_interpreter import CheckError, interpret
from verify_bank import load_archive, small_only

class TranslationError(ValueError):
    pass

# Pin every transitively consumed source field, image row, and case field.
EXPECTED = {
    'case': {'t':'case','v':[2,3,4,5,6,7,8,10,12,14,15,16,20,21,24],
             'r':3,'cs':[0,1,2],
             'tree':[['dual',100000000,[[0,100000000],[1,100000000],[2,100000000]]]],'root':0},
    'images': [[2,1,1],[3,1,1],[0,4,1]],
    'sources': [{'t':'small','v':[2,3,6],'r':1},
                {'t':'small','v':[4,5,20],'r':1},
                {'t':'small','v':[6,10,15],'r':1}],
    'source_indices': [0,2,3],
}

def _canonical(x):
    return json.dumps(x, sort_keys=True, separators=(',', ':'), allow_nan=False)

def translate(bank):
    try:
        nodes, images = bank['nodes'], bank['images']
        n = nodes[4]
        actual = {'case':n, 'images':[images[j] for j in (0,1,2)],
                  'sources':[nodes[j] for j in (0,2,3)], 'source_indices':[0,2,3]}
        if _canonical(actual) != _canonical(EXPECTED):
            raise TranslationError('case 4 or a referenced source/image differs from the pinned instance')
        # Interpret exactly the required prefix, including the extra small node 1.
        out = interpret(nodes[:5], images, small_only)
        target, demand = out[4]
        if list(target) != n['v'] or demand != n['r'] or gcd(*n['v']) != 1:
            raise TranslationError('normalized target or demand mismatch')
        rows = []
        for j in n['cs']:
            src, m, d = images[j]
            support, r = out[src]
            if src >= 4 or m <= 0 or d <= 0 or gcd(m,d) != 1 or any(v*m % d for v in support):
                raise TranslationError('invalid image')
            u = {v*m//d for v in support}
            t = set(target)
            rows.append((sorted(u & t), r - len(u - t)))
        dual = n['tree'][0]
        return {'support':list(target), 'demand':demand, 'rows':rows,
                'image_refs':[(j,*images[j]) for j in n['cs']],
                'source_nodes':[(i,list(out[i][0]),out[i][1]) for i in (0,2,3)],
                'entries':[(i,w) for i,w in dual[2]], 'denominator':dual[1]}
    except (KeyError, IndexError, TypeError, CheckError, ValueError) as exc:
        if isinstance(exc, TranslationError):
            raise
        raise TranslationError(str(exc)) from exc

def _set(xs):
    return '{' + ', '.join(map(str, xs)) + '}' if xs else '∅'

def render(x):
    def row(r): return f'({_set(r[0])}, ({r[1]} : ℤ))'
    rows = ', '.join(row(r) for r in x['rows'])
    refs = ', '.join(f'({j}, {i}, {m}, {d})' for j,i,m,d in x['image_refs'])
    sources = ', '.join(f'({i}, {_set(s)}, {k})' for i,s,k in x['source_nodes'])
    entries = ', '.join(f'({row(x["rows"][i])}, ({w} : ℤ))' for i,w in x['entries'])
    return f'''import CaseTree

/- Generated from archive node 4; Python transcription is not a Lean theorem
   relating the archive bytes or source nodes to these data. -/
namespace ArchiveCase4

def target : Finset ℕ := {_set(x['support'])}
def demand : ℕ := {x['demand']}
-- (image index, source index, numerator, denominator); source index, support, demand.
def imageRefs : List (ℕ × ℕ × ℕ × ℕ) := [{refs}]
def sourceNodes : List (ℕ × Finset ℕ × ℕ) := [{sources}]
def rows : List (BankCase.Constraint ℕ) := [{rows}]
def tree : BankCase.Tree ℕ := BankCase.Tree.dual [{entries}] {x['denominator']}

-- Host CI must kernel-check this candidate; generation is not verification.
theorem check_valid : BankCase.check rows target ∅ ∅ demand tree = true := by
  simp only [tree, rows, target, demand, BankCase.check] <;> decide
#print axioms check_valid
end ArchiveCase4
'''

def main():
    root = Path(__file__).resolve().parents[1]
    bank, _ = load_archive(root / 'input/erdos302_boundary_certificates_publication.zip')
    print(render(translate(bank)), end='')

if __name__ == '__main__':
    try: main()
    except (TranslationError, CheckError, OSError, ValueError) as exc:
        print(f'REJECTED: {exc}', file=sys.stderr)
        sys.exit(1)
