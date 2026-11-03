import unittest

import first_local_correspondence as subject


class FirstLocalCorrespondenceTests(unittest.TestCase):
    def test_actual_nine_arms_match_and_mutation_is_rejected(self):
        full, first = subject.load_inputs()
        subject.check(full, first)
        with self.assertRaises(ValueError):
            subject.check(full.replace('| 0 => ⟨{2, 3, 6}, 1, .small⟩',
                                       '| 0 => ⟨{2, 3, 6}, 2, .small⟩', 1), first)
        subject.check(full, first, full)
        with self.assertRaises(ValueError):
            subject.check(full, first, full.replace('| 0 => ⟨{2, 3, 6}, 1, .small⟩',
                                                     '| 0 => ⟨{2, 3, 6}, 2, .small⟩', 1))
        with self.assertRaises(ValueError):
            subject.check(full, first.replace('| 1 =>', '| 10 =>', 1))


if __name__ == '__main__':
    unittest.main()
