import re
import unittest
from pathlib import Path
import generate_recurrence_pilot as gen
import reconstruct_report_profiles as archive

PATH = gen.ROOT / 'input/erdos302_boundary_certificates_publication.zip'


def independently_check(values, cells, prime, limit=80):
    """Difference-array replay, independent of the generator's per-cell sum."""
    if type(prime) is not int or prime != 2 or len(values) != limit + 1 or values[0] != 0:
        return False
    diff = [0] * (limit + 2)
    for a, b, h in cells:
        if a <= limit:
            diff[a] += h
        if b <= limit:
            diff[b] -= h
    d = 0
    for n in range(1, limit + 1):
        d += diff[n]
        if values[n] != values[n // prime] + d:
            return False
    return True


class PilotTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.report, _ = archive.read_archive(PATH)
        cls.cells = cls.report['levels'][1]['cells']
        text = gen.render(PATH)
        match = re.search(r'def current : List Nat := \[([0-9, ]+)\]', text)
        if not match:
            raise ValueError('missing table')
        cls.values = [int(v) for v in match.group(1).split(', ')]

    def test_independent_replay_and_boundaries(self):
        self.assertEqual(self.report['levels'][0]['cells'], [])
        self.assertEqual(self.cells[:4], [[6,24,1], [48,54,1], [54,72,2], [72,144,3]])
        self.assertTrue(independently_check(self.values, self.cells, 2))
        self.assertEqual([self.values[i] for i in (0, 5, 6, 23, 24, 48, 54, 72)], [0,0,1,2,2,3,4,5])

    def test_mutations_fail(self):
        values = self.values.copy(); values[6] += 1
        self.assertFalse(independently_check(values, self.cells, 2))
        values = self.values.copy(); values[-1] += 1
        self.assertFalse(independently_check(values, self.cells, 2))
        values = self.values.copy(); values[0] = 1
        self.assertFalse(independently_check(values, self.cells, 2))
        self.assertFalse(independently_check(self.values[:-1], self.cells, 2))
        self.assertFalse(independently_check(self.values, self.cells, 3))
        cells = [row.copy() for row in self.cells]; cells[0][2] += 1
        self.assertFalse(independently_check(self.values, cells, 2))
        cells = [row.copy() for row in self.cells]; cells[0][1] += 1
        self.assertFalse(independently_check(self.values, cells, 2))

    def test_equation_decidable_before_recurrence(self):
        text = gen.render(PATH)
        declaration = 'instance (n : Nat) : Decidable (equation n)'
        self.assertIn(declaration, text)
        self.assertLess(text.index(declaration), text.index('theorem recurrence :'))
        self.assertIn('theorem recurrence : ∀ n ∈ Finset.Icc 1 80, equation n := by', text)

    def test_complete_generated_file(self):
        self.assertEqual(gen.OUTPUT.read_text(), gen.render(PATH))
        self.assertNotEqual(gen.OUTPUT.read_text().replace('import ArchiveLedger', 'import Std'), gen.render(PATH))
        self.assertNotEqual(gen.OUTPUT.read_text().replace('theorem recurrence', 'theorem recurrence (hrec : False)'), gen.render(PATH))

if __name__ == '__main__':
    unittest.main()
