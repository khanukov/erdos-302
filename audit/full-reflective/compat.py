#!/usr/bin/env python3
"""Apply reviewed, hash-pinned compatibility changes to staged sources."""
import hashlib
from pathlib import Path
import sys

ORIGINAL_SHA256 = '8a2114568a3b5af0e2345b31b4d8d83a45cd051582b4173d3138fae37d5b78d8'
TRANSFORMED_SHA256 = '4fa3fc96cea57888d23e08e5de3a5acf0f62c80f38cac0d7f2e33891af78a394'
OLD = b'Finset.sum_inter_add_sum_diff'
NEW = b'Finset.sum_inter_add_sum_sdiff'
GROUP_ORIGINAL_SHA256 = '47d616df958b2f0178edc836551093e3eaef29e152fdbfe89b83c9acf2e497ff'
GROUP_TRANSFORMED_SHA256 = 'd8c7f614ccbad624a0227e957b5b891a75eb2a6206499455805cd21ee4a636e2'
GROUP29_ORIGINAL_SHA256 = '901e79e6fbe312193938982f08d50b08f1c930167ab585b33617c5ee0df56b5e'
GROUP29_TRANSFORMED_SHA256 = 'ffca2ef8c4ca888c3da150b6ff1643a4dedaafc672170a582960ad6d6470cce8'
GROUP30_ORIGINAL_SHA256 = 'ffc6b48c60712ca2002dfc91b3fb6d71dc00ccc68618d25593cc231a15d4f734'
GROUP30_TRANSFORMED_SHA256 = 'ff5bfb7b29eb4cfd8fb02029447ec1648bc7212083cdd41502b7a4b91dda0bab'
GROUP174_ORIGINAL_SHA256 = '725f9e4de2261a95cb83bd1e92d53b09525519fcac03e71e3a30b210143ac03e'
GROUP174_TRANSFORMED_SHA256 = 'c9bdd5c0490ff152e6860f1ea094b9e8c935668126e9cb777020756ac8b138bf'
GROUP175_ORIGINAL_SHA256 = '42d9c86f305cfac698904c47d97b5ff298d318e66bd22d946b4a0dd54b0910fc'
GROUP175_TRANSFORMED_SHA256 = 'a474c5916b900e6317474310a9e26d8ba4ea373a55b9245635318957bd1e73b1'
THEOREM175 = b'theorem rl_T02_c162_G_valid :'
THEOREM174 = b'theorem rl_T02_c139_G_valid :'
THEOREM30 = b'theorem rl_P02_c64_G_valid :'
THEOREMS29 = (b'theorem rl_P02_c62_G_valid :', b'theorem rl_P02_c63_G_valid :')
THEOREM = b'theorem rl_P02_c60_G_valid :'
OPTION = b'set_option maxHeartbeats 1000000 in\n'


def digest(data):
    return hashlib.sha256(data).hexdigest()


def main(root):
    leaf = root / 'Erdos302ReflectiveLeafFC.lean'
    original = leaf.read_bytes()
    if digest(original) != ORIGINAL_SHA256 or original.count(OLD) != 4:
        raise ValueError('unexpected upstream leaf bytes or occurrence count')
    transformed = original.replace(OLD, NEW)
    if digest(transformed) != TRANSFORMED_SHA256:
        raise ValueError('unexpected transformed leaf bytes')
    group = root / 'Erdos302RLGroup0027FC.lean'
    group_original = group.read_bytes()
    if digest(group_original) != GROUP_ORIGINAL_SHA256 or group_original.count(THEOREM) != 1:
        raise ValueError('unexpected upstream group bytes or occurrence count')
    group_transformed = group_original.replace(THEOREM, OPTION + THEOREM)
    if digest(group_transformed) != GROUP_TRANSFORMED_SHA256:
        raise ValueError('unexpected transformed group bytes')
    group29 = root / 'Erdos302RLGroup0029FC.lean'
    group29_original = group29.read_bytes()
    if digest(group29_original) != GROUP29_ORIGINAL_SHA256 or any(group29_original.count(t) != 1 for t in THEOREMS29):
        raise ValueError('unexpected upstream group 0029 bytes or occurrence count')
    group29_transformed = group29_original
    for theorem in THEOREMS29:
        group29_transformed = group29_transformed.replace(theorem, OPTION + theorem)
    if digest(group29_transformed) != GROUP29_TRANSFORMED_SHA256:
        raise ValueError('unexpected transformed group 0029 bytes')
    group30 = root / 'Erdos302RLGroup0030FC.lean'
    group30_original = group30.read_bytes()
    if digest(group30_original) != GROUP30_ORIGINAL_SHA256 or group30_original.count(THEOREM30) != 1:
        raise ValueError('unexpected upstream group 0030 bytes or occurrence count')
    group30_transformed = group30_original.replace(THEOREM30, OPTION + THEOREM30)
    if digest(group30_transformed) != GROUP30_TRANSFORMED_SHA256:
        raise ValueError('unexpected transformed group 0030 bytes')
    group174 = root / 'Erdos302RLGroup0174FC.lean'
    group174_original = group174.read_bytes()
    if digest(group174_original) != GROUP174_ORIGINAL_SHA256 or group174_original.count(THEOREM174) != 1:
        raise ValueError('unexpected upstream group 0174 bytes or occurrence count')
    group174_transformed = group174_original.replace(THEOREM174, OPTION + THEOREM174)
    if digest(group174_transformed) != GROUP174_TRANSFORMED_SHA256:
        raise ValueError('unexpected transformed group 0174 bytes')
    group175 = root / 'Erdos302RLGroup0175FC.lean'
    group175_original = group175.read_bytes()
    if digest(group175_original) != GROUP175_ORIGINAL_SHA256 or group175_original.count(THEOREM175) != 1:
        raise ValueError('unexpected upstream group 0175 bytes or occurrence count')
    group175_transformed = group175_original.replace(THEOREM175, OPTION + THEOREM175)
    if digest(group175_transformed) != GROUP175_TRANSFORMED_SHA256:
        raise ValueError('unexpected transformed group 0175 bytes')
    leaf.write_bytes(transformed)
    group.write_bytes(group_transformed)
    group29.write_bytes(group29_transformed)
    group30.write_bytes(group30_transformed)
    group174.write_bytes(group174_transformed)
    group175.write_bytes(group175_transformed)
    if digest(leaf.read_bytes()) != TRANSFORMED_SHA256:
        raise ValueError('staged leaf write verification failed')
    if digest(group.read_bytes()) != GROUP_TRANSFORMED_SHA256:
        raise ValueError('staged group write verification failed')
    if digest(group29.read_bytes()) != GROUP29_TRANSFORMED_SHA256:
        raise ValueError('staged group 0029 write verification failed')
    if digest(group30.read_bytes()) != GROUP30_TRANSFORMED_SHA256:
        raise ValueError('staged group 0030 write verification failed')
    if digest(group174.read_bytes()) != GROUP174_TRANSFORMED_SHA256:
        raise ValueError('staged group 0174 write verification failed')
    if digest(group175.read_bytes()) != GROUP175_TRANSFORMED_SHA256:
        raise ValueError('staged group 0175 write verification failed')
    print(f'Erdos302RLGroup0175FC.lean original_sha256={GROUP175_ORIGINAL_SHA256} transformed_sha256={GROUP175_TRANSFORMED_SHA256} theorem=rl_T02_c162_G_valid maxHeartbeats=1000000 occurrences=1')
    print(f'Erdos302RLGroup0174FC.lean original_sha256={GROUP174_ORIGINAL_SHA256} transformed_sha256={GROUP174_TRANSFORMED_SHA256} theorem=rl_T02_c139_G_valid maxHeartbeats=1000000 occurrences=1')
    print(f'Erdos302ReflectiveLeafFC.lean original_sha256={ORIGINAL_SHA256} transformed_sha256={TRANSFORMED_SHA256} replacements=4')
    print(f'Erdos302RLGroup0027FC.lean original_sha256={GROUP_ORIGINAL_SHA256} transformed_sha256={GROUP_TRANSFORMED_SHA256} theorem=rl_P02_c60_G_valid maxHeartbeats=1000000')
    print(f'Erdos302RLGroup0029FC.lean original_sha256={GROUP29_ORIGINAL_SHA256} transformed_sha256={GROUP29_TRANSFORMED_SHA256} theorems=rl_P02_c62_G_valid,rl_P02_c63_G_valid maxHeartbeats=1000000 occurrences=2')
    print(f'Erdos302RLGroup0030FC.lean original_sha256={GROUP30_ORIGINAL_SHA256} transformed_sha256={GROUP30_TRANSFORMED_SHA256} theorem=rl_P02_c64_G_valid maxHeartbeats=1000000 occurrences=1')


if __name__ == '__main__':
    if len(sys.argv) != 2:
        raise SystemExit('usage: compat.py STAGED_ROOT')
    main(Path(sys.argv[1]))
