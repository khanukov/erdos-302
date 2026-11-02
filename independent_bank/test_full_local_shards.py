import copy
import hashlib
import json
import pathlib
import tempfile
import re
import unittest
from unittest.mock import patch

import full_local_shards as subject
import mixed_full_export
import mixed_full_producer
import verify_bank


class LocalShardTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        bank, intervals = verify_bank.load_archive(subject.ROOT / 'input/erdos302_boundary_certificates_publication.zip')
        cls.doc = mixed_full_export.export(bank, intervals)
        cls.rendered = mixed_full_producer.render(bank, intervals)
        with patch.object(subject.mixed_full_export, 'export', return_value=cls.doc), \
             patch.object(subject.mixed_full_producer, 'render', return_value=cls.rendered):
            cls.files, cls.manifest = subject.generate(bank, intervals, 262144)

    def test_coverage_and_all_rules(self):
        shards = self.manifest['shards']
        self.assertEqual([i for s in shards for i in range(s['start'], s['end'])], list(range(4106)))
        self.assertEqual(set(self.manifest['counts']), {'small', 'trim', 'pack', 'qpack', 'case', 'externalActive'})
        self.assertEqual(self.manifest['total_references_occurrences'], 623846)
        self.assertEqual(self.manifest['external_assumptions'], [1097, 1107, 1112, 1114])

    def test_manifest_hashes_and_exact_inventory(self):
        shards = self.manifest['shards']
        names = [s['file'] for s in shards]
        self.assertEqual(len(names), len(set(names)))
        self.assertEqual(set(self.files), set(names) | {'FullLocalCommon.lean'})
        for shard in shards:
            data = self.files[shard['file']].encode('utf8')
            self.assertEqual(shard['bytes'], len(data))
            self.assertEqual(shard['sha256'], hashlib.sha256(data).hexdigest())
        self.assertIsNone(self.manifest['archive_sha256_claim'])

    def test_real_rules_and_all_predecessor_snapshots(self):
        # Compare every arm, not just an example of each rule. Source rule
        # fields of out-of-shard nodes are deliberately synthetic.
        originals = {int(i): line for line, i in re.findall(r'^(  \| (\d+) => .+)$', self.rendered, re.M)}
        ns = self.doc['nodes']
        for shard in self.manifest['shards']:
            lo, hi = shard['start'], shard['end']
            actual = {int(i): line for line, i in re.findall(r'^(  \| (\d+) => .+)$', self.files[shard['file']], re.M)}
            refs = {r['source'] for n in ns[lo:hi] for r in n.get('references', [])} - set(range(lo, hi))
            self.assertEqual(set(actual), set(range(lo, hi)) | refs)
            for i in range(lo, hi):
                self.assertEqual(actual[i], originals[i])
            for i in refs:
                n = ns[i]
                expected = f"  | {i} => ⟨{mixed_full_producer.fs(n['support'])}, {n['demand']}, .small⟩"
                self.assertEqual(actual[i], expected)

    def test_disk_inventory_fails_closed(self):
        files = {'FullLocalCommon.lean': 'common', 'FullLocal0000.lean': 'shard'}
        manifest = {'shards': [{'file': 'FullLocal0000.lean'}]}
        with tempfile.TemporaryDirectory() as tmp:
            root = pathlib.Path(tmp)
            for name, content in files.items():
                (root / name).write_text(content, encoding='utf8')
            (root / 'manifest.json').write_text(json.dumps(manifest, indent=2, sort_keys=True) + '\n')
            subject.verify_output(root, files, manifest)
            shard = root / 'FullLocal0000.lean'
            shard.write_text('tampered')
            with self.assertRaises(ValueError):
                subject.verify_output(root, files, manifest)
            shard.write_text('shard')
            extra = root / 'unexpected.lean'
            extra.write_text('extra')
            with self.assertRaises(ValueError):
                subject.verify_output(root, files, manifest)
            extra.unlink()
            shard.unlink()
            with self.assertRaises(ValueError):
                subject.verify_output(root, files, manifest)
            shard.symlink_to(root / 'FullLocalCommon.lean')
            with self.assertRaises(ValueError):
                subject.verify_output(root, files, manifest)
            shard.unlink()
            shard.write_text('shard')
            (root / 'manifest.json').write_text('{}')
            with self.assertRaises(ValueError):
                subject.verify_output(root, files, manifest)

    def test_ordering_mutations_rejected(self):
        doc = copy.deepcopy(self.doc)
        i = next(i for i, n in enumerate(doc['nodes']) if n.get('references'))
        doc['nodes'][i]['references'][0]['source'] = i
        with patch.object(subject.mixed_full_export, 'export', return_value=doc), \
             patch.object(subject.mixed_full_producer, 'render', return_value=self.rendered):
            with self.assertRaises(ValueError):
                subject.generate(None, None, 262144)
        doc['nodes'][i]['references'][0]['source'] = True
        with patch.object(subject.mixed_full_export, 'export', return_value=doc), \
             patch.object(subject.mixed_full_producer, 'render', return_value=self.rendered):
            with self.assertRaises(ValueError):
                subject.generate(None, None, 262144)


if __name__ == '__main__':
    unittest.main()
