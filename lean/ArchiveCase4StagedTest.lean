import ArchiveCase4Staged

example : Extended.Bound
    ({2, 3, 4, 5, 6, 7, 8, 10, 12, 14, 15, 16, 20, 21, 24} : Finset ℕ) 3 :=
  ArchiveCase4Staged.sound 4 (by decide)

example : Extended.Bound ({2, 3, 6} : Finset ℕ) 1 :=
  ArchiveCase4Staged.sound 0 (by decide)

example : ArchiveCase4.imageRefs = [(0, 2, 1, 1), (1, 3, 1, 1), (2, 0, 4, 1)] := rfl
