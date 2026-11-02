#!/usr/bin/env python3
"""Structural dependency inventory for the pinned baseline archive replay.

This does not execute the archived verifier or validate its mathematical claims.
"""
import hashlib
import io
import json
import lzma
import math
from pathlib import Path
import sys
import zipfile

ARCHIVE = Path(__file__).resolve().parents[1] / "input/erdos302_boundary_certificates_publication.zip"
ARCHIVE_SHA256 = "9396819eb36e25926d7ae8ee78b85c61cb898801f935fccfe72ebcad491bc196"
BASE = "erdos302_boundary_certificates/baseline/"
SOURCES = ("verify.py", "bank.json.xz", "extensions.json", "upstream_intervals.json", "upstream_thresholds.json", "claim.json")
FIELDS = {"small": {"t", "v", "r"}, "externalActive": {"t", "n"},
          "trim": {"t", "ref"}, "pack": {"t", "D", "rows"},
          "qpack": {"t", "rows"}, "case": {"t", "v", "r", "cs", "tree", "root"}}


def need(condition, message):
    if not condition:
        raise ValueError(message)


def pairs(items):
    result = {}
    for k, v in items:
        need(k not in result, "duplicate JSON key: " + k)
        result[k] = v
    return result


def parse_json(data):
    return json.loads(data, object_pairs_hook=pairs, parse_constant=lambda x: (_ for _ in ()).throw(ValueError("non-finite JSON")))


def index(x, limit, label):
    need(type(x) is int and 0 <= x < limit, label)
    return x


def inventory(bank, extensions):
    need(type(bank) is dict and set(bank) == {"schema", "nodes", "images", "roots"}, "bank fields")
    need(bank["schema"] == "erdos302-standalone-finite-proof-bank-v1", "bank schema")
    nodes, images, named = bank["nodes"], bank["images"], bank["roots"]
    need(type(nodes) is list and len(nodes) > 0 and type(images) is list and type(named) is dict, "bank arrays")
    for image in images:
        need(type(image) is list and len(image) == 3, "image shape")
        i, m, d = image
        index(i, len(nodes), "image node index")
        need(type(m) is int and m > 0 and type(d) is int and d > 0 and math.gcd(m, d) == 1, "image scale")
    def resolve(j, upto):
        index(j, len(images), "image index")
        i = images[j][0]
        index(i, upto, "non-backward image dependency")
        return i
    dependencies = []
    for i, node in enumerate(nodes):
        need(type(node) is dict and type(node.get("t")) is str and node["t"] in FIELDS, "unknown node")
        t = node["t"]
        need(set(node) == FIELDS[t], "node fields")
        refs = []
        if t in ("small", "case"):
            need(type(node["v"]) is list and all(type(x) is int and x > 0 for x in node["v"]), "vertex list")
            need(type(node["r"]) is int and node["r"] > 0, "demand")
        elif t == "externalActive":
            need(type(node["n"]) is int and node["n"] > 0, "external size")
        if t == "pack":
            need(type(node["D"]) is int and node["D"] > 0, "packing denominator")
        if t in ("pack", "qpack"):
            rows = node["rows"]
            need(type(rows) is list and rows, "packing rows")
            seen = set()
            for row in rows:
                need(type(row) is list and len(row) == (2 if t == "pack" else 3), "packing row shape")
                j = index(row[0], len(images), "image index")
                need(j not in seen and all(type(x) is int and x > 0 for x in row[1:]), "packing weights or duplicate")
                seen.add(j); refs.append(j)
        elif t == "trim":
            refs = [node["ref"]]
        elif t == "case":
            need(type(node["cs"]) is list, "case constraints")
            refs = node["cs"]
        dependencies.append(sorted({resolve(j, i) for j in refs}))
    named_refs = {}
    for name, j in named.items():
        need(type(name) is str, "root name")
        named_refs[name] = resolve(j, len(nodes))
    need(type(extensions) is list, "extensions list")
    ext = []
    seen = set()
    for row in extensions:
        need(type(row) is dict and set(row) == {"source_node", "prime_level", "delete", "threshold", "required", "old", "outside", "outside_edges"}, "extension fields")
        source = index(row["source_node"], len(nodes), "extension source")
        level = index(row["prime_level"], 20, "extension level")
        need((source, level) not in seen, "duplicate extension")
        seen.add((source, level)); ext.append({"source_node": source, "prime_level": level})
    closure = {r["source_node"] for r in ext}
    todo = list(closure)
    while todo:
        for dep in dependencies[todo.pop()]:
            if dep not in closure:
                closure.add(dep); todo.append(dep)
    return {"node_count": len(nodes), "image_count": len(images),
            "operational_roots": list(range(len(nodes))), "named_roots": named_refs,
            "dependencies": dependencies, "extensions": ext,
            "extension_transitive_node_closure": sorted(closure)}


def load_archive(path=ARCHIVE):
    raw = Path(path).read_bytes()
    need(hashlib.sha256(raw).hexdigest() == ARCHIVE_SHA256, "archive SHA-256 mismatch")
    with zipfile.ZipFile(io.BytesIO(raw)) as z:
        names = z.namelist()
        need(all(names.count(BASE + name) == 1 for name in SOURCES), "missing or duplicate source")
        files = {name: z.read(BASE + name) for name in SOURCES}
    bank = parse_json(lzma.decompress(files["bank.json.xz"]))
    extensions = parse_json(files["extensions.json"])
    # Parse all JSON inputs consumed by main/upstream/renew; verify.py is bound by
    # the whole-archive digest and included in source hashes, never executed.
    for name in ("upstream_intervals.json", "upstream_thresholds.json", "claim.json"):
        parse_json(files[name])
    result = inventory(bank, extensions)
    need(result["node_count"] == 4106 and result["image_count"] == 25744 and len(result["extensions"]) == 515, "unexpected archive counts")
    result["archive_sha256"] = ARCHIVE_SHA256
    result["semantic_source_sha256"] = {name: hashlib.sha256(files[name]).hexdigest() for name in SOURCES}
    return result


def main():
    try:
        print(json.dumps(load_archive(), sort_keys=True, separators=(",", ":")))
    except (ValueError, OSError, zipfile.BadZipFile, lzma.LZMAError) as exc:
        print("inventory failed: " + str(exc), file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
