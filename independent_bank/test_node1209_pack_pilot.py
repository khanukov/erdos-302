import unittest
import node1209_pack_pilot as pilot

class PilotTest(unittest.TestCase):
    def test_generated_pilot_matches_pinned_input(self):
        self.assertEqual(pilot.OUTPUT.read_bytes(), pilot.generate().encode())

    def test_mutated_generated_bytes_rejected(self):
        text = pilot.generate().encode()
        self.assertFalse(pilot.matches(text.replace(b'219', b'220', 1)))
        self.assertFalse(pilot.matches(text.replace(b'import Dag', b'import Weighted', 1)))
        self.assertFalse(pilot.matches(text.replace(b'theorem row_bounds', b'theorem altered_bounds', 1)))
        self.assertFalse(pilot.matches(text.replace(b'1209', b'1208', 1)))
        self.assertFalse(pilot.matches(text + b'\n'))

    def test_occurrences_preserved(self):
        rows = pilot.rows()
        self.assertEqual(len(rows), 8)
        self.assertEqual([r['image'] for r in rows], [4, 212, 558, 1181, 218, 221, 972, 223])
        self.assertEqual([r['weight'] for r in rows], [219, 229, 87, 199, 50, 475, 475, 37])
