import MixedCaseTrimCandidate

/-! Candidate only: the extension's dependency and soundness contracts must be
proved for each payload. No assertion is made that this file has compiled. -/
namespace MixedDagLocality
open MixedDag UpperBridge

/-- The exact indices read by the core rule, plus the extension's declared
indices. This is a predicate so that repeated row occurrences are retained by
quantification over the original row family. -/
def Reads {ε : Type} (extraReads : ε → ℕ → Prop) : Rule ε → ℕ → Prop
  | .edge _ _ _, _ => False
  | .small, _ => False
  | .image j _ _, k => k = j
  | .pack _ rows _, k => ∃ r, k = (rows r).source
  | .extra e, k => extraReads e k

/-- Executable dependency enumeration; repetitions are intentionally retained. -/
def dependencyList {ε : Type} (extraSources : ε → List ℕ) : Rule ε → List ℕ
  | .edge _ _ _ => []
  | .small => []
  | .image j _ _ => [j]
  | .pack n rows _ => List.ofFn (fun r : Fin n => (rows r).source)
  | .extra e => extraSources e

/-- Membership forgets occurrences; the list itself retains their order and multiplicity. -/
theorem mem_dependencyList_iff {ε : Type}
    (extraSources : ε → List ℕ) (extraReads : ε → ℕ → Prop)
    (hextra : ∀ e j, j ∈ extraSources e ↔ extraReads e j)
    (rule : Rule ε) (j : ℕ) :
    j ∈ dependencyList extraSources rule ↔ Reads extraReads rule j := by
  cases rule <;> simp [dependencyList, Reads, hextra, List.mem_ofFn, eq_comm]

def SameData {ε : Type} (a b : ℕ → Node ε) (j : ℕ) : Prop :=
  (a j).support = (b j).support ∧ (a j).demand = (b j).demand

/-- The extension must preserve its result when current data and all declared
payload references agree. The current rule is handled separately by Check. -/
def ExtraLocal {ε : Type} (extraCheck : (ℕ → Node ε) → ℕ → ε → Prop)
    (extraReads : ε → ℕ → Prop) : Prop :=
  ∀ a b i e, SameData a b i →
    (∀ j, extraReads e j → SameData a b j) →
    (extraCheck a i e ↔ extraCheck b i e)

/-- Checker locality includes the target rule and target data, and only the
support and demand at referenced nodes. It does not require their rules. -/
theorem check_local {ε : Type}
    (extraCheck : (ℕ → Node ε) → ℕ → ε → Prop)
    (extraReads : ε → ℕ → Prop) (locality : ExtraLocal extraCheck extraReads)
    (a b : ℕ → Node ε) (i : ℕ)
    (target : SameData a b i) (rule : (a i).rule = (b i).rule)
    (deps : ∀ j, Reads extraReads (a i).rule j → SameData a b j) :
    Check extraCheck a i ↔ Check extraCheck b i := by
  rcases target with ⟨hs, hd⟩
  cases hr : (a i).rule with
  | edge x y z =>
    simp [Check, ← rule, hr, hs, hd]
  | small =>
    simp [Check, ← rule, hr, hs, hd]
  | image j m d =>
    have hj := deps j (by simp [hr, Reads])
    rcases hj with ⟨hjs, hjd⟩
    simp [Check, ← rule, hr, hs, hd, hjs, hjd]
  | pack n rows D =>
    have hsources : ∀ r, (a (rows r).source).support = (b (rows r).source).support := by
      intro r
      exact (deps _ (by simp [hr, Reads]; exact ⟨r, rfl⟩)).1
    have hdemands : ∀ r, (a (rows r).source).demand = (b (rows r).source).demand := by
      intro r
      exact (deps _ (by simp [hr, Reads]; exact ⟨r, rfl⟩)).2
    simp [Check, ← rule, hr, hs, hd, rowImage, hsources, hdemands]
  | extra e =>
    have he : ∀ j, extraReads e j → SameData a b j := by
      intro j hj
      apply deps j
      simpa [hr, Reads] using hj
    simpa [Check, ← rule, hr] using locality a b i e ⟨hs, hd⟩ he

namespace CaseTrim
open MixedCaseTrimCandidate

/-- Case references are occurrence-indexed in the checker, even though this
predicate forgets duplicate indices. Trees contain no node references. -/
def payloadReads : Payload → ℕ → Prop
  | .caseRule refs _, j => ∃ r ∈ refs, r.source = j
  | .trimRule r, j => r.source = j

def payloadSources : Payload → List ℕ
  | .caseRule refs _ => refs.map Ref.source
  | .trimRule r => [r.source]

theorem payloadReads_iff_mem (e : Payload) (j : ℕ) :
    payloadReads e j ↔ j ∈ payloadSources e := by
  cases e <;> simp [payloadReads, payloadSources, eq_comm]

theorem extra_local : ExtraLocal extraCheck payloadReads := by
  intro a b i e hi hdeps
  rcases hi with ⟨hs, hd⟩
  cases e with
  | trimRule r =>
    have h := hdeps r.source (by simp [payloadReads])
    rcases h with ⟨hrs, hrd⟩
    simp [extraCheck, TrimCheck, RefCheck, image, hs, hd, hrs, hrd]
  | caseRule refs tree =>
    have hsrc : ∀ r ∈ refs, SameData a b r.source := by
      intro r hr
      exact hdeps r.source ⟨r, hr, rfl⟩
    have href : ∀ r ∈ refs, (RefCheck a i r ↔ RefCheck b i r) := by
      intro r hr
      have h := hsrc r hr
      simp [RefCheck, h.1]
    have hmap : refs.map (row a i) = refs.map (row b i) := by
      apply List.map_congr_left
      intro r hr
      have h := hsrc r hr
      simp [row, image, hs, h.1, h.2]
    simp only [extraCheck, CaseCheck, hs, hd, hmap]
    constructor <;> intro h <;> constructor
    · intro r hr; exact (href r hr).mp (h.1 r hr)
    · exact h.2
    · intro r hr; exact (href r hr).mpr (h.1 r hr)
    · exact h.2

/-- Soundness needs bounds only for the payload's declared sources. -/
theorem extra_sound : ∀ nodes i e, extraCheck nodes i e →
    (∀ j, payloadReads e j → Extended.Bound (nodes j).support (nodes j).demand) →
    Extended.Bound (nodes i).support (nodes i).demand := by
  intro nodes i e valid prior
  cases e with
  | caseRule refs tree =>
    exact case_sound nodes i refs tree valid
      (fun r hr => prior r.source ⟨r, hr, rfl⟩)
  | trimRule r =>
    exact trim_sound nodes i r valid (prior r.source rfl)

end CaseTrim

/-- One-node soundness, conditional only on bounds at actual dependencies.
For extension rules the local semantic contract is an explicit premise, not
an assumption that arbitrary unreferenced predecessors have bounds. -/
theorem sound_one {ε : Type}
    (extraCheck : (ℕ → Node ε) → ℕ → ε → Prop)
    (extraReads : ε → ℕ → Prop)
    (extraSound : ∀ ns i e, extraCheck ns i e →
      (∀ j, extraReads e j → Extended.Bound (ns j).support (ns j).demand) →
      Extended.Bound (ns i).support (ns i).demand)
    (ns : ℕ → Node ε) (i : ℕ) (valid : Check extraCheck ns i)
    (prior : ∀ j, Reads extraReads (ns i).rule j →
      Extended.Bound (ns j).support (ns j).demand) :
    Extended.Bound (ns i).support (ns i).demand := by
  unfold Check at valid
  dsimp only at valid
  cases hr : (ns i).rule with
  | edge a b c =>
    simp only [hr] at valid
    rcases valid with ⟨hu, hk, he⟩
    rw [hu]
    intro S hs
    exact le_trans hk (Extended.edge_bound he S hs)
  | small =>
    simp only [hr] at valid
    exact ArchiveDag.small_sound valid
  | image j m d =>
    simp only [hr] at valid
    rcases valid with ⟨hj, hm, hd, hex, hu, hk⟩
    have hb := prior j (by simp [hr, Reads])
    have him := ArchivePack.scaled_bound hm hd hex hb
    rw [hu]
    intro S hs
    exact le_trans hk (him S hs)
  | pack count rows D =>
    simp only [hr] at valid
    rcases valid with ⟨hrows, hpack⟩
    apply ArchivePack.sound Finset.univ (fun r => rowImage ns (rows r))
      (fun r => (rows r).weight) (fun r => (ns (rows r).source).demand)
      D (ns i).demand (ns i).support hpack
    intro r _
    obtain ⟨href, hm, hd, hex⟩ := hrows r
    exact ArchivePack.scaled_bound hm hd hex
      (prior (rows r).source (by simp [hr, Reads]; exact ⟨r, rfl⟩))
  | extra e =>
    simp only [hr] at valid
    apply extraSound ns i e valid
    intro j hj
    exact prior j (by simpa [hr, Reads] using hj)

/-- Specialization with the case/trim contract discharged from declared reads. -/
theorem caseTrim_sound_one (ns : ℕ → Node MixedCaseTrimCandidate.Payload) (i : ℕ)
    (valid : Check MixedCaseTrimCandidate.extraCheck ns i)
    (prior : ∀ j, Reads CaseTrim.payloadReads (ns i).rule j →
      Extended.Bound (ns j).support (ns j).demand) :
    Extended.Bound (ns i).support (ns i).demand :=
  sound_one MixedCaseTrimCandidate.extraCheck CaseTrim.payloadReads CaseTrim.extra_sound ns i valid prior

#print axioms caseTrim_sound_one
#print axioms mem_dependencyList_iff
#print axioms check_local
#print axioms CaseTrim.payloadReads_iff_mem
#print axioms CaseTrim.extra_local
#print axioms CaseTrim.extra_sound
#print axioms sound_one
end MixedDagLocality
