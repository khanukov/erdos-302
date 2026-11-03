import pathlib
import re
import unittest

ROOT = pathlib.Path(__file__).resolve().parents[1]


class GraphDemandCIGate(unittest.TestCase):
    def test_graph_demand_is_in_automatic_dependency_complete_gate(self):
        workflow = (ROOT / '.github/workflows/first-real-shard.yml').read_text()
        for token in ('  pull_request:', '  push:',
                      'UpperRenewal Projection BankProfile ArchiveSeedNode0 BankProfileTests',
                      'GraphDemandSeedSoundCandidate GraphDemandSeedSoundContract',
                      'GraphDemandSeedSoundCandidate.archived_first_cell_bound',
                      'GraphDemandSeedSoundContract.archived_contract'):
            self.assertIn(token, workflow)

    def test_transitive_local_imports_are_compiled_in_order(self):
        workflow = (ROOT / '.github/workflows/first-real-shard.yml').read_text()
        loops = re.findall(r'for f in ([\w ]+); do\n\s+(?:echo "Checking \$f"\n\s+)?(?:timeout \d+m )?lean -o', workflow)
        order = [name for loop in loops for name in loop.split()]
        sources = {p.stem: p for directory in ('lean', 'audit/shard-aggregation',
                   'audit/ledger-candidate/lean') for p in (ROOT / directory).glob('*.lean')}
        seen = set()

        def check(name):
            if name in seen or name not in sources:
                return
            seen.add(name)
            self.assertEqual(order.count(name), 1, name)
            for line in sources[name].read_text().splitlines():
                if line.startswith('import '):
                    for dep in line.split()[1:]:
                        if dep in sources:
                            check(dep)
                            self.assertLess(order.index(dep), order.index(name), (dep, name))

        check('GraphDemandSeedSoundContract')


if __name__ == '__main__':
    unittest.main()
