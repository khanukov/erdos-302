import copy
import json
import lzma
from pathlib import Path
import subprocess
import sys
import unittest
import zipfile

import replay_inventory as inv


class ReplayInventoryTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        with zipfile.ZipFile(inv.ARCHIVE) as z:
            cls.bank = inv.parse_json(lzma.decompress(z.read(inv.BASE + 'bank.json.xz')))
            cls.extensions = inv.parse_json(z.read(inv.BASE + 'extensions.json'))
        cls.result = inv.load_archive()

    def test_actual_archive_and_checked_in_inventory(self):
        x = self.result
        self.assertEqual(x['operational_roots'], list(range(4106)))
        self.assertEqual(x['named_roots'], {})
        self.assertEqual(len(x['extensions']), 515)
        self.assertEqual(len(x['extension_transitive_node_closure']), 3596)
        self.assertEqual(set(x['semantic_source_sha256']), set(inv.SOURCES))
        expected = json.dumps(x, sort_keys=True, separators=(',', ':')) + '\n'
        self.assertEqual((Path(inv.__file__).parent / 'replay_inventory.json').read_text(), expected)
        for args in ([], ['-O']):
            output = subprocess.check_output([sys.executable, *args, inv.__file__], text=True)
            self.assertEqual(output, expected)

    def test_strict_backward_edges_all_dependency_kinds(self):
        for typ in ('pack', 'qpack', 'trim', 'case'):
            with self.subTest(typ=typ):
                b = copy.deepcopy(self.bank)
                i = next(i for i, n in enumerate(b['nodes']) if n['t'] == typ)
                node = b['nodes'][i]
                j = node['ref'] if typ == 'trim' else node['cs'][0] if typ == 'case' else node['rows'][0][0]
                b['images'][j][0] = i
                with self.assertRaisesRegex(ValueError, 'non-backward'):
                    inv.inventory(b, self.extensions)

    def test_invalid_extensions_and_unknown_rule_fail_closed(self):
        e = copy.deepcopy(self.extensions)
        e[0]['source_node'] = len(self.bank['nodes'])
        with self.assertRaises(ValueError): inv.inventory(self.bank, e)
        e = copy.deepcopy(self.extensions)
        e.append(copy.deepcopy(e[0]))
        with self.assertRaises(ValueError): inv.inventory(self.bank, e)
        b = copy.deepcopy(self.bank)
        b['nodes'][0]['t'] = 'unknown'
        with self.assertRaises(ValueError): inv.inventory(b, self.extensions)

    def test_json_and_archive_fail_closed(self):
        with self.assertRaises(ValueError): inv.parse_json('{"x":1,"x":2}')
        with self.assertRaises(ValueError): inv.parse_json('{"x":NaN}')
        with self.assertRaisesRegex(ValueError, 'SHA-256 mismatch'):
            inv.load_archive(Path(__file__))


if __name__ == '__main__':
    unittest.main()
