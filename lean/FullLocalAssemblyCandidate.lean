import MixedDagLocality

/-! Uncompiled assembly candidate. Each index selects its own snapshot; no global
rule array is required. The four external bounds remain explicit assumptions.
The finite local checks, dependency order and snapshot agreement are obligations,
not assumed to have been proved by generating the data. -/
namespace FullLocalAssemblyCandidate
open MixedDag MixedDagLocality

inductive Payload where
  | ordinary (value : MixedCaseTrimCandidate.Payload)
  | external

def projection (ns : ℕ → Node Payload) : ℕ → Node MixedCaseTrimCandidate.Payload :=
  fun i => ⟨(ns i).support, (ns i).demand, .small⟩

def extraReads : Payload → ℕ → Prop
  | .ordinary e, j => CaseTrim.payloadReads e j
  | .external, _ => False

def extraSources : Payload → List ℕ
  | .ordinary e => CaseTrim.payloadSources e
  | .external => []

def extraCheck (ns : ℕ → Node Payload) (i : ℕ) : Payload → Prop
  | .ordinary e => MixedCaseTrimCandidate.extraCheck (projection ns) i e
  | .external => i ∈ ([1097, 1107, 1112, 1114] : List ℕ) ∧
      Extended.Bound (ns i).support (ns i).demand

theorem sources_correct (e : Payload) (j : ℕ) :
    j ∈ extraSources e ↔ extraReads e j := by
  cases e with
  | ordinary e => exact (CaseTrim.payloadReads_iff_mem e j).symm
  | external => simp [extraSources, extraReads]

theorem extra_sound : ∀ ns i e, extraCheck ns i e →
    (∀ j, extraReads e j → Extended.Bound (ns j).support (ns j).demand) →
    Extended.Bound (ns i).support (ns i).demand := by
  intro ns i e valid prior
  cases e with
  | external => exact valid.2
  | ordinary e =>
    apply CaseTrim.extra_sound (projection ns) i e valid
    intro j hj
    exact prior j hj

/-- A snapshot's current node is canonical; its dependency nodes may be
synthetic records, provided their support and demand match the owner's view. -/
theorem assemble (view : ℕ → ℕ → Node Payload) (limit : ℕ)
    (external1097 : Extended.Bound (view 1097 1097).support (view 1097 1097).demand)
    (external1107 : Extended.Bound (view 1107 1107).support (view 1107 1107).demand)
    (external1112 : Extended.Bound (view 1112 1112).support (view 1112 1112).demand)
    (external1114 : Extended.Bound (view 1114 1114).support (view 1114 1114).demand)
    (valid : ∀ i, i < limit → i ∉ ([1097, 1107, 1112, 1114] : List ℕ) →
      Check extraCheck (view i) i)
    (backward : ∀ i, i < limit → ∀ j,
      Reads extraReads ((view i i).rule) j → j < i)
    (agree : ∀ i, i < limit → ∀ j,
      Reads extraReads ((view i i).rule) j → SameData (view i) (view j) j) :
    ∀ i, i < limit → Extended.Bound (view i i).support (view i i).demand := by
  intro i
  induction i using Nat.strong_induction_on with
  | h i ih =>
    intro hi
    by_cases h1097 : i = 1097
    · subst i; exact external1097
    by_cases h1107 : i = 1107
    · subst i; exact external1107
    by_cases h1112 : i = 1112
    · subst i; exact external1112
    by_cases h1114 : i = 1114
    · subst i; exact external1114
    have notExternal : i ∉ ([1097, 1107, 1112, 1114] : List ℕ) := by
      simp [h1097, h1107, h1112, h1114]
    apply sound_one extraCheck extraReads extra_sound (view i) i (valid i hi notExternal)
    intro j hj
    have hjlt := backward i hi j hj
    have bound := ih j hjlt (lt_trans hjlt hi)
    have same := agree i hi j hj
    simpa only [same.1, same.2] using bound

#print axioms assemble
end FullLocalAssemblyCandidate
