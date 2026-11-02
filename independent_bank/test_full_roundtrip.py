import unittest
import subprocess
import sys
import verify_bank
import full_roundtrip


class FullRoundtripTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        path = verify_bank.Path(__file__).resolve().parents[1] / 'input/erdos302_boundary_certificates_publication.zip'
        cls.bank, cls.intervals = verify_bank.load_archive(path)
        root = path.parents[1]
        output = subprocess.run([sys.executable, str(root / 'independent_bank/mixed_full_producer.py')],
                                cwd=root, check=True, stdout=subprocess.PIPE).stdout
        prefix = f'/- CLI loaded pinned archive SHA-256 {verify_bank.HASH}; not a provenance proof. -/\n'.encode()
        if not output.startswith(prefix):
            raise AssertionError('CLI authentication prefix mismatch')
        cls.text = output[len(prefix):].decode('utf-8')
        if prefix + cls.text.encode('utf-8') != output:
            raise AssertionError('CLI artifact is not exact UTF-8')

    def test_full_semantics_and_authenticated_bytes(self):
        stats = full_roundtrip.check(self.bank, self.intervals, self.text)
        self.assertEqual(stats['arms'], 4106)
        self.assertEqual(stats['references'], 623846)
        self.assertGreater(stats['outside'], 0)

    def test_unauthenticated_input_rejected(self):
        altered = dict(self.bank)
        altered['nodes'] = list(self.bank['nodes'])
        altered['nodes'][1097] = dict(altered['nodes'][1097], n=421)
        with self.assertRaisesRegex(ValueError, 'not pinned archive'):
            full_roundtrip.check(altered, self.intervals, self.text)

    def test_whole_artifact_and_syntax_mutations_fail(self):
        text = self.text
        arm = next(x for x in text.splitlines(keepends=True) if x.startswith('  | 5 => '))
        mutations = [text.replace(arm, arm + arm, 1), text.replace(arm, '', 1),
                     text.replace(arm, arm.replace(' => ', ' BAD => '), 1),
                     text.replace('NOT COMPILED', 'COMPILED', 1), text + '-- extra\n']
        for bad in mutations:
            with self.assertRaises(ValueError):
                full_roundtrip.validate_bytes(self.text, bad)
        del mutations
        for token in ('.small', '.external', '.trimRule', '.caseRule', '.pack',
                      '.budget', '.row', '.force', '.split', '.dual'):
            if token in text:
                with self.subTest(token=token), self.assertRaises(ValueError):
                    full_roundtrip.validate_bytes(text, text.replace(token, token + ' BAD', 1))
