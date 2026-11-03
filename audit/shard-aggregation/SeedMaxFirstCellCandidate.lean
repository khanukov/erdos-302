import ActualPrefix32Sound
import ArchiveLedger

/-! CI candidate: the level whose newly adjoined prime is 2, on 1..11.
The preceding level is zero here. The old-level interval contribution is
[6,24); all remaining old intervals start at 48. The finite smoothness table
covers the positive support vertices of nodes 0..31, all at most 120.
No archive-byte correspondence or full-profile statement is asserted. -/
namespace SeedMaxFirstCellCandidate
open Finset
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

def smooth23 (x : ℕ) : Bool :=
  decide (x ∈ ([1,2,3,4,6,8,9,12,16,18,24,27,32,36,48,54,64,72,81,96,108] : List ℕ))

def nodeSeed (i n : ℕ) : ℕ :=
  let S := (ActualPrefix32Data.nodes i).support
  let outside := (S.filter fun x => smooth23 x = false ∧ x % 2 = 0).card
  let above := (S.filter fun x => smooth23 x = true ∧ n < x).card
  if n ∈ S ∧ smooth23 n = true then
    (ActualPrefix32Data.nodes i).demand - outside - above
  else 0

def seed (n : ℕ) : ℕ := (Finset.range 32).sup (fun i => nodeSeed i n)

/-- Fuel makes the two recursive calls structural; n steps suffice for n. -/
def oldAux : ℕ → ℕ → ℕ
  | 0, _ => 0
  | _ + 1, 0 => 0
  | fuel + 1, n + 1 => oldAux fuel ((n + 1) / 2) +
      (if 6 ≤ n + 1 ∧ n + 1 < 24 then 1 else 0)

def profileAux : ℕ → ℕ → ℕ
  | 0, _ => 0
  | _ + 1, 0 => 0
  | fuel + 1, n + 1 =>
      max (profileAux fuel ((n + 1) / 2))
        (max (profileAux fuel n) (max (oldAux (n + 1) (n + 1)) (seed (n + 1))))

def profile (n : ℕ) : ℕ := profileAux n n

/-- Remove the old-profile term to check that the verified seed, rather than
that term, drives the result throughout this shard. -/
def seedOnlyAux : ℕ → ℕ → ℕ
  | 0, _ => 0
  | _ + 1, 0 => 0
  | fuel + 1, n + 1 =>
      max (seedOnlyAux fuel ((n + 1) / 2))
        (max (seedOnlyAux fuel n) (seed (n + 1)))

def seedOnly (n : ℕ) : ℕ := seedOnlyAux n n

def derivedCorrection (n : ℕ) : ℕ := profile n - profile (n / 2)

def literalCorrection (n : ℕ) : ℕ :=
  (((ArchiveLedger.ledger.getD 1 ⟨0, []⟩).cells).map
    fun c => if c.a ≤ n ∧ n < c.b then c.height else 0).sum

/-- Genuine support bound of a maximizing seed at the first positive point. -/
theorem node0_bound : Extended.Bound ({2, 3, 6} : Finset ℕ) 1 := by
  simpa [ActualPrefix32Data.nodes] using ActualPrefix32.sound 0 (by decide)

theorem first_seed : nodeSeed 0 6 = 1 ∧ seed 6 = 1 := by decide +kernel

theorem derived_matches_literal : ∀ n ∈ Finset.Icc 1 11,
    derivedCorrection n = literalCorrection n := by decide +kernel

theorem seed_only_suffices : ∀ n ∈ Finset.Icc 0 11,
    profile n = seedOnly n := by decide +kernel

theorem seed_only_correction : ∀ n ∈ Finset.Icc 1 11,
    seedOnly n - seedOnly (n / 2) = literalCorrection n := by decide +kernel

theorem recurrence_on_shard : ∀ n ∈ Finset.Icc 1 11,
    profile n = max (profile (n / 2))
      (max (profile (n - 1)) (max (oldAux n n) (seed n))) := by decide +kernel

/-- Joint statement makes the witness and the derived ledger correction explicit
proof dependencies rather than merely colocated facts. -/
theorem witnessed_correction :
    Extended.Bound ({2, 3, 6} : Finset ℕ) 1 ∧
    nodeSeed 0 6 = 1 ∧
    (∀ n ∈ Finset.Icc 1 11,
      seedOnly n - seedOnly (n / 2) = literalCorrection n) := by
  exact ⟨node0_bound, first_seed.1, seed_only_correction⟩

theorem positive_literal : derivedCorrection 6 = 1 ∧ literalCorrection 6 = 1 := by
  decide +kernel

#print axioms recurrence_on_shard
#print axioms witnessed_correction
#print axioms seed_only_suffices
#print axioms seed_only_correction
#print axioms node0_bound
#print axioms first_seed
#print axioms derived_matches_literal
#print axioms positive_literal
end SeedMaxFirstCellCandidate
