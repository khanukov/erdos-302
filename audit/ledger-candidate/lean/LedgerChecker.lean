import Mathlib.Data.Rat.Defs
import Mathlib.Tactic

namespace ArchiveLedger

structure Cell where
  a : ℕ
  b : ℕ
  height : ℕ
  deriving DecidableEq, Repr
structure Level where
  prime : ℕ
  cells : List Cell
  deriving DecidableEq, Repr

def primes : List ℕ := [3, 2, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71]

def ordered : ℕ → List Cell → Bool
  | _, [] => true
  | last, c :: cs =>
    decide (last ≤ c.a ∧ c.a < c.b ∧ c.b ≤ 500001 ∧ 0 < c.height) && ordered c.b cs

def heightSum (l : Level) : ℕ := l.cells.foldl (fun s c => s + c.height) 0

def cellMass (c : Cell) : ℚ := (c.height : ℚ) * (1 / (c.a : ℚ) - 1 / (c.b : ℚ))
def levelMass (l : Level) : ℚ := l.cells.foldl (fun s c => s + cellMass c) 0

-- State is (density before this level, accumulated gain, weighted error, weight).
def step (s : ℚ × ℚ × ℕ × ℕ) (l : Level) : ℚ × ℚ × ℕ × ℕ :=
  (s.1 * ((l.prime - 1 : ℕ) : ℚ) / (l.prime : ℚ),
   s.2.1 + s.1 * levelMass l,
   s.2.2.1 + s.2.2.2 * heightSum l,
   2 * s.2.2.2)

def totals (ls : List Level) : ℚ × ℚ × ℕ × ℕ := ls.foldl step (1, 0, 0, 2)
def coefficient (ls : List Level) : ℚ := 1 - (totals ls).2.1
def error (ls : List Level) : ℕ := (totals ls).2.2.1

def targetC : ℚ :=
  (5257732070693282578339807052385333596114146444258874863366093099862086223334703221767412397 : ℚ) /
  6250046986665851271465761945238620015244311869639997944823697072137494392402703576166400000

def Arithmetic (ls : List Level) : Prop := coefficient ls = targetC ∧ error ls = 55064831540

def Valid (ls : List Level) : Prop :=
  ls.map Level.prime = primes ∧
  (ls.map (fun l => l.cells.length)).sum = 4705 ∧
  ls.all (fun l => ordered 1 l.cells) = true ∧
  Arithmetic ls

instance (ls : List Level) : Decidable (Valid ls) := by
  unfold Valid Arithmetic
  infer_instance

def check (ls : List Level) : Bool := decide (Valid ls)

theorem valid_sound {ls : List Level} (h : Valid ls) : Arithmetic ls := h.2.2.2

theorem check_sound {ls : List Level} (h : check ls = true) : Arithmetic ls :=
  valid_sound (of_decide_eq_true h)

end ArchiveLedger
