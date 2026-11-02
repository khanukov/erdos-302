import copy
import hashlib
import lzma
import unittest
from unittest.mock import patch

import archive_prefix as a


class PrefixTests(unittest.TestCase):
    def test_exact_four_nodes_and_rendered_cases(self):
        bank = a.load_bank()
        expected = [
            {'t': 'small', 'v': [2, 3, 6], 'r': 1},
            {'t': 'small', 'v': [2, 3, 4, 6, 12], 'r': 2},
            {'t': 'small', 'v': [4, 5, 20], 'r': 1},
            {'t': 'small', 'v': [6, 10, 15], 'r': 1},
        ]
        self.assertEqual(bank['nodes'][:4], expected)
        cases = [line for line in a.render_prefix(bank, 4).splitlines() if ' => ⟨' in line]
        self.assertEqual(cases, [
            '  | 0 => ⟨{2, 3, 6}, 1, .small⟩',
            '  | 1 => ⟨{2, 3, 4, 6, 12}, 2, .small⟩',
            '  | 2 => ⟨{4, 5, 20}, 1, .small⟩',
            '  | 3 => ⟨{6, 10, 15}, 1, .small⟩',
            '  | _ => ⟨∅, 0, .small⟩',
        ])
        with self.assertRaisesRegex(ValueError, 'unsupported node 4'):
            a.render_prefix(bank, 5)

    def test_malformed_nodes_fail_closed(self):
        bank = a.load_bank()
        mutations = [None, [], {'t': 'small', 'v': [2, 3, 6], 'r': True},
                     {'t': 'small', 'v': [2, 3, True], 'r': 1},
                     {'t': 'small', 'v': '236', 'r': 1},
                     {'t': 'small', 'v': [], 'r': 1},
                     {'t': 'small', 'v': [2, 2, 6], 'r': 1},
                     {'t': 'small', 'v': [3, 2, 6], 'r': 1},
                     {'t': 'small', 'v': [4, 6, 12], 'r': 1},
                     {'t': 'small', 'v': [2, 3, 6], 'r': 0},
                     {'t': 'small', 'v': [2, 3, 6], 'r': 4},
                     {'t': 'small', 'v': [2, 3, 6], 'r': 1, 'extra': 0},
                     {'t': 'case', 'v': [2, 3, 6], 'r': 1}]
        for mutation in mutations:
            b = copy.deepcopy(bank)
            b['nodes'][0] = mutation
            with self.subTest(mutation=mutation), self.assertRaises(ValueError):
                a.render_prefix(b, 1)
        for count in (True, 0, -1, 1.0, '1', len(bank['nodes']) + 1):
            with self.subTest(count=count), self.assertRaises(ValueError):
                a.render_prefix(bank, count)

    def test_duplicate_keys_rejected_after_hash_check(self):
        for data in (b'{"schema":1,"schema":2}',
                     b'{"nodes":[{"t":"small","t":"case"}]}'):
            raw = lzma.compress(data)
            with self.subTest(data=data), patch.object(a, 'SHA256', hashlib.sha256(raw).hexdigest()):
                with self.assertRaisesRegex(ValueError, 'duplicate JSON key'):
                    a.load_bank(raw)

    def test_malformed_bank_schema_fails_closed(self):
        samples = [b'[]', b'null', b'{"schema":"erdos302-standalone-finite-proof-bank-v1","nodes":{},"images":[],"roots":[]}',
                   b'{"schema":true,"nodes":[],"images":[],"roots":[]}',
                   b'{"schema":"erdos302-standalone-finite-proof-bank-v1","nodes":[],"images":[],"roots":[],"extra":0}']
        for data in samples:
            raw = lzma.compress(data)
            with self.subTest(data=data), patch.object(a, 'SHA256', hashlib.sha256(raw).hexdigest()):
                with self.assertRaisesRegex(ValueError, 'bank schema'):
                    a.load_bank(raw)

    def test_source_hash_and_generated_fixture(self):
        raw = a.SOURCE.read_bytes()
        with self.assertRaisesRegex(ValueError, 'SHA-256'):
            a.load_bank(raw + b'x')
        self.assertEqual(a.render_prefix(a.load_bank(), 4), a.TARGET.read_text())


if __name__ == '__main__':
    unittest.main()
