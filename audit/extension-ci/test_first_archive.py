import importlib.util
import unittest
from pathlib import Path

P = Path(__file__).with_name('first_archive.py')
spec = importlib.util.spec_from_file_location('first_archive', P)
m = importlib.util.module_from_spec(spec)
spec.loader.exec_module(m)

class FirstArchiveTests(unittest.TestCase):
    def test_shards_cover_source_coordinate_without_gaps(self):
        shards = m.shard_intervals()
        self.assertEqual(shards[0][0], 0)
        self.assertEqual(shards[-1][1], 1901)
        self.assertTrue(all(a < b for a, b in shards))
        self.assertTrue(all(shards[i][1] == shards[i+1][0] for i in range(len(shards)-1)))
        outputs = m.generate_shards()
        self.assertEqual(len(outputs), len(shards) + 2)
        for name, text in outputs.items():
            m.check_bytes((m.ROOT/'lean'/f'{name}.lean').read_bytes(), text.encode())
        for i in range(len(shards)):
            self.assertIn(f'ExtensionBoundaryShard{i:02}', outputs)
        data = outputs['ExtensionBoundaryData'].encode()
        self.assertIn(b'{236, 244, 268', data)
        with self.assertRaises(ValueError):
            m.check_bytes(data.replace(b'{236, 244, 268', b'{237, 244, 268', 1), data)
        assembly = outputs['ExtensionBoundaryAssembly'].encode()
        with self.assertRaises(ValueError):
            m.check_bytes(assembly.replace(b'import ExtensionBoundaryShard19\n', b'', 1), assembly)

    def test_bad_witness_rejected(self):
        with self.assertRaises(ValueError):
            m.validate([6,10,15], [6,10], [], 1)

    def test_genuine_boundary_and_duplicate(self):
        m.validate([6,10,15], [6,10], [15], 2)
        with self.assertRaises(ValueError):
            m.validate([6,10,15], [6,10], [15,15], 2)

    def test_deletion_literal_is_part_of_generated_artifact(self):
        text = m.generate().encode('utf-8')
        needle = b'def firstDelete : Finset \xe2\x84\x95 :=\n  {236, 244, 268'
        self.assertIn(needle, text)
        mutated = text.replace(needle, needle.replace(b'236', b'237'), 1)
        with self.assertRaises(ValueError):
            m.check_bytes(mutated, text)

    def test_generated_matches_authenticated_archive(self):
        m.check_bytes((m.ROOT/'lean/ExtensionFirstArchive.lean').read_bytes(), m.generate().encode('utf-8'))

if __name__ == '__main__':
    unittest.main()
