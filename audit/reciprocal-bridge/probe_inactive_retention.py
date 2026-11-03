#!/usr/bin/env python3
"""Exploratory data-only replay; NOT a Lean proof or archive authentication."""
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent


def literal(path, name):
    text = path.read_text(encoding="utf-8")
    matches = re.findall(rf"def {re.escape(name)} : Finset ℕ := \{{([^}}]*)\}}", text)
    if len(matches) != 1 or not re.fullmatch(r"\d+(?:, \d+)*", matches[0]):
        raise ValueError(f"missing or malformed literal {name}")
    values = list(map(int, matches[0].split(", ")))
    if len(values) != len(set(values)):
        raise ValueError(f"duplicate in {name}")
    return set(values)


def all_edges(universe):
    return {(b * c // (b + c), b, c) for b in universe for c in universe
            if b < c and b + c and b * c % (b + c) == 0
            and b * c // (b + c) in universe}


def inactive_edges(universe, active):
    """Recover edges by scanning pairs involving an inactive endpoint.

    When inactive x is a, recover c = ab/(b-a). When x is b or c,
    recover a = bc/(b+c). Exact equation guards reject truncated division.
    """
    found = set()
    for x in universe - active:
        for y in universe:
            if x < y:
                a, b = x, y
                c = a * b // (b - a)
                if c in universe and b < c and b * c == a * (b + c):
                    found.add((a, b, c))
            for b, c in ((x, y), (y, x)):
                if b < c and b + c:
                    a = b * c // (b + c)
                    if a in universe and b * c == a * (b + c):
                        found.add((a, b, c))
    return found


def main():
    for n in (1097, 1107, 1112, 1114):
        universe = literal(ROOT / "FourEdgeUniversesCandidate.lean", f"universe_{n}")
        active = literal(ROOT / "FourExternalCandidate.lean", f"active_{n}")
        assert universe and min(universe) > 0
        edges = all_edges(universe)
        bad = {e for e in edges if any(v not in active for v in e)}
        assert inactive_edges(universe, active) == bad == set()
        # Every actual endpoint, if removed, must be detected by both methods.
        for v in {x for edge in edges for x in edge}:
            altered = active - {v}
            expected = {e for e in edges if any(x not in altered for x in e)}
            assert expected and inactive_edges(universe, altered) == expected
        print(f"{n}: vertices={len(universe)} inactive={len(universe-active)} "
              f"edges={len(edges)} bad=0; all endpoint-removal mutations detected")


if __name__ == "__main__":
    main()
