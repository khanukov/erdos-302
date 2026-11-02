import MixedDag
import CaseTree

/-! Candidate semantic combinators for a mixed DAG.  These declarations have
not yet been compiled. Archive transcription and checker integration are separate. -/
namespace MixedCaseTrimCandidate
open UpperBridge

/-- A scaled reference to a strictly earlier node. -/
structure Ref where
  source : ℕ
  numerator : ℕ
  denominator : ℕ

inductive Payload where
  | caseRule (refs : List Ref) (tree : BankCase.Tree ℕ)
  | trimRule (ref : Ref)

def image (nodes : ℕ → MixedDag.Node Payload) (r : Ref) : Finset ℕ :=
  ArchiveScaling.image (nodes r.source).support r.numerator r.denominator

def row (nodes : ℕ → MixedDag.Node Payload) (r : Ref) : BankCase.Constraint ℕ :=
  (image nodes r, ((nodes r.source).demand : ℤ))

def RefCheck (nodes : ℕ → MixedDag.Node Payload) (i : ℕ) (r : Ref) : Prop :=
  r.source < i ∧ 0 < r.numerator ∧ 0 < r.denominator ∧
  (∀ x ∈ (nodes r.source).support, r.denominator ∣ x * r.numerator)

def CaseCheck (nodes : ℕ → MixedDag.Node Payload) (i : ℕ)
    (refs : List Ref) (tree : BankCase.Tree ℕ) : Prop :=
  (∀ r ∈ refs, RefCheck nodes i r ∧ image nodes r ⊆ (nodes i).support) ∧
  BankCase.check (refs.map (row nodes)) (nodes i).support ∅ ∅
    (nodes i).demand tree = true

def TrimCheck (nodes : ℕ → MixedDag.Node Payload) (i : ℕ) (r : Ref) : Prop :=
  RefCheck nodes i r ∧ (nodes i).support ⊆ image nodes r ∧
  (∀ a ∈ image nodes r, ∀ b ∈ image nodes r, ∀ c ∈ image nodes r,
    OrderedEdge (image nodes r) a b c →
    a ∈ (nodes i).support ∧ b ∈ (nodes i).support ∧ c ∈ (nodes i).support) ∧
  (nodes i).demand ≤ (nodes r.source).demand

def extraCheck (nodes : ℕ → MixedDag.Node Payload) (i : ℕ) (e : Payload) : Prop :=
  match e with
  | .caseRule refs tree => CaseCheck nodes i refs tree
  | .trimRule ref => TrimCheck nodes i ref

instance (nodes : ℕ → MixedDag.Node Payload) (i : ℕ) (e : Payload) :
    Decidable (extraCheck nodes i e) := by
  cases e <;> simp only [extraCheck, CaseCheck, TrimCheck, RefCheck, UpperBridge.OrderedEdge] <;> infer_instance

theorem image_bound (nodes : ℕ → MixedDag.Node Payload) (i : ℕ) (r : Ref)
    (h : RefCheck nodes i r)
    (prior : ∀ j < i, Extended.Bound (nodes j).support (nodes j).demand) :
    Extended.Bound (image nodes r) (nodes r.source).demand := by
  rcases h with ⟨hj, hm, hd, hex⟩
  exact ArchivePack.scaled_bound hm hd hex (prior r.source hj)

theorem case_sound (nodes : ℕ → MixedDag.Node Payload) (i : ℕ)
    (refs : List Ref) (tree : BankCase.Tree ℕ)
    (valid : CaseCheck nodes i refs tree)
    (prior : ∀ j < i, Extended.Bound (nodes j).support (nodes j).demand) :
    Extended.Bound (nodes i).support (nodes i).demand := by
  rcases valid with ⟨hrefs, hcheck⟩
  intro S hS
  let C := S ∩ (nodes i).support
  have hC : OrderedCover (nodes i).support C := Extended.cover_inter hS
  have hrows : ∀ c ∈ refs.map (row nodes), BankCase.Row c.1 c.2 C := by
    intro c hc
    obtain ⟨r, hr, rfl⟩ := List.mem_map.mp hc
    have hb := image_bound nodes i r (hrefs r hr).1 prior
    have hv := hb (C ∩ image nodes r)
      (Extended.cover_inter (Extended.cover_mono (hrefs r hr).2 hC))
    simpa [row, BankCase.Row] using hv
  by_contra hn
  have hsmall : (C.card : ℤ) ≤ ((nodes i).demand : ℤ) - 1 := by
    have hc : C.card ≤ S.card := Finset.card_le_card Finset.inter_subset_left
    omega
  have hs : BankCase.State (nodes i).support ∅ ∅ C := by
    simp [BankCase.State, C]
  exact BankCase.check_sound (refs.map (row nodes)) (nodes i).support ∅ ∅ C
    (nodes i).demand tree hcheck hs hsmall hrows

theorem trim_sound (nodes : ℕ → MixedDag.Node Payload) (i : ℕ) (r : Ref)
    (valid : TrimCheck nodes i r)
    (prior : ∀ j < i, Extended.Bound (nodes j).support (nodes j).demand) :
    Extended.Bound (nodes i).support (nodes i).demand := by
  rcases valid with ⟨hr, hsub, hkeep, hdemand⟩
  have hk : ∀ a b c, OrderedEdge (image nodes r) a b c →
      a ∈ (nodes i).support ∧ b ∈ (nodes i).support ∧ c ∈ (nodes i).support := by
    intro a b c he
    exact hkeep a he.1 b he.2.1 c he.2.2.1 he
  have hb := Extended.trim_bound hsub hk (image_bound nodes i r hr prior)
  intro S hs
  exact le_trans hdemand (hb S hs)

/-- The only semantic premises are prior bounds supplied by MixedDag's induction. -/
theorem extra_sound : ∀ nodes i e, extraCheck nodes i e →
    (∀ j < i, Extended.Bound (nodes j).support (nodes j).demand) →
    Extended.Bound (nodes i).support (nodes i).demand := by
  intro nodes i e h prior
  cases e with
  | caseRule refs tree => exact case_sound nodes i refs tree h prior
  | trimRule ref => exact trim_sound nodes i ref h prior

/-- Soundness of the combined checker, with no external semantic premise. -/
theorem sound (nodes : ℕ → MixedDag.Node Payload) (count : ℕ)
    (valid : ∀ i < count, MixedDag.Check extraCheck nodes i) :
    ∀ i < count, Extended.Bound (nodes i).support (nodes i).demand :=
  MixedDag.sound extraCheck extra_sound nodes count valid

#print axioms image_bound
#print axioms case_sound
#print axioms trim_sound
#print axioms extra_sound
#print axioms sound
end MixedCaseTrimCandidate
