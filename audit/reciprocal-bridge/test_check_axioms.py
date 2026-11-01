import unittest
from check_axioms import check

class AxiomChecks(unittest.TestCase):
    def test_standard_axioms(self):
        check("'N.x' depends on axioms: [propext,\n Classical.choice, Quot.sound]", ['N.x'])
        check("'N.x' does not depend on any axioms", ['N.x'])

    def test_reject_missing_duplicates_and_forbidden(self):
        for text in ('', "'N.x' depends on axioms: [sorryAx]", "'N.x' depends on axioms: [Fake.custom]", "'N.x' does not depend on any axioms\n'N.x' does not depend on any axioms"):
            with self.subTest(text=text), self.assertRaises(ValueError):
                check(text, ['N.x'])

if __name__ == '__main__':
    unittest.main()
