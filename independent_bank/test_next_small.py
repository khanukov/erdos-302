import copy
import unittest
import archive_prefix
import next_small

class NextSmallTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.bank = archive_prefix.load_bank()

    def test_real_node_six_and_prefix_boundary(self):
        text = next_small.render(self.bank, 6, 7)
        self.assertIn('{12, 21, 28}', text)
        self.assertIn('ArchiveTrim5.sound', text)
        self.assertIn('ArchiveDag.small_sound', text)
        self.assertIn('∀ i < 7', text)

    def test_overstated_demand_is_transcribed_for_lean_to_reject(self):
        bank = copy.deepcopy(self.bank)
        bank['nodes'][6]['r'] = 2
        text = next_small.render(bank, 6, 7)
        self.assertIn('⟨{12, 21, 28}, 2, .small⟩', text)

    def test_negative_kernel_example_is_integrated(self):
        root = next_small.ROOT
        example = (root / 'lean/ArchiveNextSmallTest.lean').read_text()
        integration = (root / 'lean/UpperIntegration.lean').read_text()
        self.assertIn('¬ ArchiveDag.SmallCheck', example)
        self.assertIn('import ArchiveNextSmallTest', integration)
        self.assertIn('#print axioms ArchiveNextSmallTest.overstated_rejected', integration)

    def test_unsupported_case_fails_closed(self):
        with self.assertRaises(ValueError):
            next_small.render(self.bank, 6, 8)

    def test_boolean_and_unknown_fields_fail_closed(self):
        for mutate in (lambda n: n.update(r=True), lambda n: n.update(extra=0),
                       lambda n: n.update(v=[True, 21, 28])):
            bank = copy.deepcopy(self.bank)
            mutate(bank['nodes'][6])
            with self.assertRaises(ValueError):
                next_small.render(bank, 6, 7)

if __name__ == '__main__': unittest.main()
