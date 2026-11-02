import unittest
from pathlib import Path

import archive_seed


class ArchiveSeedTest(unittest.TestCase):
    def test_pinned_first_node_is_exactly_emitted(self):
        node = archive_seed.load_first_node()
        self.assertEqual(node, {"t": "small", "v": [2, 3, 6], "r": 1})
        self.assertEqual(archive_seed.render(node), archive_seed.TARGET.read_text())

    def test_rejects_changed_source_bytes(self):
        raw = archive_seed.SOURCE.read_bytes()
        with self.assertRaisesRegex(ValueError, "SHA-256"):
            archive_seed.load_first_node(raw + b"x")

    def test_rejects_unsupported_nodes(self):
        for node in ({"t": "small", "v": [2, 2, 6], "r": 1},
                     {"t": "edge", "v": [2, 3, 6], "r": 1},
                     {"t": "small", "v": [2, 3, 6], "r": True}):
            with self.subTest(node=node), self.assertRaises(ValueError):
                archive_seed.render(node)


if __name__ == "__main__":
    unittest.main()
