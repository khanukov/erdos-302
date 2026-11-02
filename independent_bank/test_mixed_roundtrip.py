"""Independent semantic checks of emitted case trees and packing rules."""

import math
import re
import unittest
from fractions import Fraction

import archive_prefix
import mixed_prefix_export
import mixed_lean_producer


def require(condition):
    if not condition:
        raise AssertionError('round-trip mismatch')


def check_roundtrip(doc, text):
    # Consume the whole definition, not a regex-selected subset of its arms.
    header = 'def nodes : ℕ → MixedDag.Node Payload\n'
    footer = '\n\n/- Exact checker obligation:'
    require(text.count(header) == 1 and text.count(footer) == 1)
    section = text.split(header, 1)[1].split(footer, 1)[0]
    arms = section.split('\n')
    require(len(arms) == len(doc['nodes']) + 1)
    require(arms[-1] == '  | _ => ⟨∅, 0, .small⟩')
    for index, n in enumerate(doc['nodes']):
        require(n['id'] == index)
        match = re.fullmatch(r'  \| (0|[1-9]\d*) => (.*)', arms[index])
        require(match is not None and int(match.group(1)) == index)
        body = match.group(2)
        support = '∅' if not n['support'] else '{' + ', '.join(map(str, n['support'])) + '}'
        require(body.startswith(f'⟨{support}, {n["demand"]}, '))
        if n['kind'] == 'pack':
            prefix = f'⟨{support}, {n["demand"]}, '
            match = re.fullmatch(re.escape(prefix) + r'\.pack (\d+) !\[(.*?)\] (\d+)⟩', body)
            require(match is not None)
            count, rows, den = match.groups(); den = int(den)
            row_pattern = r'⟨(\d+), (\d+), (\d+), (\d+)⟩'
            require(re.fullmatch(rf'(?:{row_pattern}(?:, {row_pattern})*)?', rows) is not None)
            actual = [tuple(map(int, r)) for r in re.findall(row_pattern, rows)]
            expected_den = math.lcm(*(r['denominator'] for r in n['rows']))
            expected_rows = [(r['source'], r['mul'], r['div'] * n['normalizer'], int(Fraction(r['numerator'], r['denominator']) * expected_den)) for r in n['rows']]
            require(int(count) == len(expected_rows) and den == expected_den and actual == expected_rows)
            continue
        if n['kind'] == 'basic':
            require(n['archive']['t'] == 'small')
            require(body == f'⟨{support}, {n["demand"]}, .small⟩')
            continue
        if n['kind'] == 'trim_placeholder':
            refs = n['references']
            require(len(refs) == 1 and n['archive']['t'] == 'trim')
            r = refs[0]
            source = doc['nodes'][r['source']]['support']
            raw = [v * r['mul'] // r['div'] for v in source]
            require(all(v * r['mul'] % r['div'] == 0 for v in source))
            kept = {x for a in raw for b in raw for c in raw
                    if a < b < c and a*b + a*c == b*c for x in (a, b, c)}
            require(bool(kept))
            norm = math.gcd(*kept)
            require(sorted(v // norm for v in kept) == n['support'])
            pattern = re.escape(f'⟨{support}, {n["demand"]}, ') + r'\.extra \(\.trimRule ⟨(\d+), (\d+), (\d+)⟩\)⟩'
            match = re.fullmatch(pattern, body)
            require(match is not None)
            require(tuple(map(int, match.groups())) == (r['source'], r['mul'], r['div'] * norm))
            continue
        require(n['kind'] == 'case_placeholder')
        a = n['archive']; norm = math.gcd(*a['v']); refs = n['references']
        prefix = f'⟨{support}, {n["demand"]}, '
        match = re.fullmatch(re.escape(prefix) + r'\.extra \(\.caseRule \[(.*?)\] \((.*)\)\)⟩', body)
        require(match is not None)
        ref_pattern = r'⟨(\d+), (\d+), (\d+)⟩'
        require(re.fullmatch(rf'(?:{ref_pattern}(?:, {ref_pattern})*)?', match.group(1)) is not None)
        actual_refs = [tuple(map(int, r)) for r in re.findall(ref_pattern, match.group(1))]
        require(actual_refs == [(r['source'], r['mul'], r['div'] * norm) for r in refs])
        constraints = []
        for r in refs:
            src = doc['nodes'][r['source']]
            constraints.append((tuple(v * r['mul'] // (r['div'] * norm) for v in src['support']), src['demand']))
        tree_text = match.group(2)
        token_pattern = re.compile(r'\.\w+|\d+|[{}(),\[\]]|∅')
        tokens = []
        end = 0
        for token in token_pattern.finditer(tree_text):
            require(tree_text[end:token.start()].strip() == '')
            tokens.append(token.group())
            end = token.end()
        require(tree_text[end:].strip() == '')
        pos = 0
        def take(want=None):
            nonlocal pos
            val = tokens[pos]; pos += 1
            if want is not None: require(val == want)
            return val
        def number(): return int(take())
        def constraint():
            take('('); vals = []
            if tokens[pos] == '∅': take('∅')
            else:
                take('{')
                if tokens[pos] != '}':
                    vals.append(number())
                    while tokens[pos] == ',':
                        take(','); vals.append(number())
                take('}')
            take(','); demand = number(); take(')')
            return (tuple(vals), demand)
        def tree():
            tag = take()
            if tag == '.budget': return ('budget',)
            if tag == '.row': return ('row', constraint())
            if tag == '.force':
                c = constraint(); take('('); child = tree(); take(')'); return ('force', c, child)
            if tag == '.split':
                v = number(); take('('); left = tree(); take(')'); take('('); right = tree(); take(')'); return ('split', v, left, right)
            if tag == '.dual':
                take('['); entries = []
                while tokens[pos] != ']':
                    if entries: take(',')
                    take('('); c = constraint(); take(','); w = number(); take(')'); entries.append((c, w))
                take(']'); return ('dual', number(), tuple(entries))
            raise AssertionError(tag)
        def expected(j):
            z = a['tree'][j]; tag = z[0]
            if tag == 'budget': return ('budget',)
            if tag == 'row': return ('row', constraints[z[1]])
            if tag == 'force': return ('force', constraints[z[1]], expected(z[2]))
            if tag == 'split': return ('split', z[1] // norm, expected(z[2]), expected(z[3]))
            if tag == 'dual': return ('dual', z[1], tuple((constraints[i], w) for i, w in z[2]))
            raise AssertionError(tag)
        require(tree() == expected(a['root']) and pos == len(tokens))


class RoundtripTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.doc = mixed_prefix_export.export(archive_prefix.load_bank())
        cls.text = mixed_lean_producer.render(cls.doc)

    def test_all_trees_and_pack_round_trip(self):
        check_roundtrip(self.doc, self.text)

    def test_unrecognized_tokens_rejected(self):
        for needle, replacement in [
            ('.split 12 ', '.split -12 '),
            ('.split 12 ', '.split BAD 12 '),
            ('.split 12 ', '.split 12 BAD '),
            ('.extra (.caseRule [⟨2, 1, 1⟩', '.extra (.caseRule [BAD ⟨2, 1, 1⟩'),
            ('.extra (.caseRule [⟨2, 1, 1⟩', 'BAD .extra (.caseRule [⟨2, 1, 1⟩'),
            ('.pack 7 ![⟨0, 1, 1, 1⟩', '.pack 7 ![BAD ⟨0, 1, 1, 1⟩'),
        ]:
            with self.subTest(replacement=replacement):
                self.assertIn(needle, self.text)
                with self.assertRaises((AssertionError, IndexError, ValueError)):
                    check_roundtrip(self.doc, self.text.replace(needle, replacement, 1))

    def test_every_node_arm_and_rule_mutation_rejected(self):
        lines = self.text.splitlines(keepends=True)
        arms = [(i, line) for i, line in enumerate(lines) if re.fullmatch(r'  \| \d+ => .*\n', line)]
        self.assertEqual(len(arms), len(self.doc['nodes']))
        for line_index, line in arms:
            mutated = list(lines)
            mutated[line_index] = line.replace('⟩\n', ' BAD⟩\n')
            with self.subTest(arm=line_index):
                with self.assertRaises((AssertionError, IndexError, KeyError, ValueError)):
                    check_roundtrip(self.doc, ''.join(mutated))

    def test_duplicate_missing_and_malformed_arms_rejected(self):
        arm = next(line for line in self.text.splitlines(keepends=True) if line.startswith('  | 5 => '))
        for text in (self.text.replace(arm, arm + arm, 1),
                     self.text.replace(arm, '', 1),
                     self.text.replace(arm, arm + '  | BAD => ⟨∅, 0, .small⟩\n', 1),
                     self.text.replace(arm, arm + '  garbage\n', 1),
                     self.text.replace('  | _ => ⟨∅, 0, .small⟩', '  | _ => ⟨∅, 0, .small BAD⟩', 1)):
            with self.subTest():
                with self.assertRaises((AssertionError, IndexError, KeyError, ValueError)):
                    check_roundtrip(self.doc, text)

    def test_each_rule_constructor_mutation_rejected(self):
        lines = self.text.splitlines(keepends=True)
        constructors = {'basic': '.small', 'trim_placeholder': '.trimRule',
                        'case_placeholder': '.caseRule', 'pack': '.pack'}
        for node in self.doc['nodes']:
            needle = f'  | {node["id"]} => '
            i = next(i for i, line in enumerate(lines) if line.startswith(needle))
            mutated = list(lines)
            constructor = constructors[node['kind']]
            self.assertIn(constructor, lines[i])
            mutated[i] = lines[i].replace(constructor, '.bogus', 1)
            with self.subTest(node=node['id']):
                with self.assertRaises((AssertionError, IndexError, KeyError, ValueError)):
                    check_roundtrip(self.doc, ''.join(mutated))

    def test_trim_reference_fields_mutated(self):
        for node in self.doc['nodes']:
            if node['kind'] != 'trim_placeholder':
                continue
            line = next(line for line in self.text.splitlines() if line.startswith(f'  | {node["id"]} => '))
            match = re.search(r'\.trimRule ⟨(\d+), (\d+), (\d+)⟩', line)
            self.assertIsNotNone(match)
            for i in range(1, 4):
                start, end = match.span(i)
                changed = line[:start] + str(int(match.group(i)) + 1) + line[end:]
                with self.subTest(node=node['id'], field=i):
                    with self.assertRaises((AssertionError, IndexError, KeyError, ValueError)):
                        check_roundtrip(self.doc, self.text.replace(line, changed, 1))

    def test_tree_and_pack_mutations_detected(self):
        for needle, replacement in [('.split 12 ', '.split 13 '), ('.pack 7 ![⟨0, 1, 1, 1⟩', '.pack 7 ![⟨0, 1, 1, 2⟩')]:
            self.assertIn(needle, self.text)
            with self.assertRaises((AssertionError, IndexError, ValueError)):
                check_roundtrip(self.doc, self.text.replace(needle, replacement, 1))
