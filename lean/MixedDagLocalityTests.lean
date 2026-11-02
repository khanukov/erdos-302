import MixedDagLocality

/- Interface tests: the theorem must expose actual source dependencies rather
   than require semantic bounds for every earlier node. -/
#check MixedDagLocality.check_local
#check MixedDagLocality.mem_dependencyList_iff
#check MixedDagLocality.sound_one
#print axioms MixedDagLocality.check_local
#print axioms MixedDagLocality.sound_one

open MixedDag MixedCaseTrimCandidate

-- These typed contracts fail if a theorem gains stronger premises or changes its conclusion.
example {ε : Type} (sources : ε → List ℕ) (reads : ε → ℕ → Prop)
    (h : ∀ e j, j ∈ sources e ↔ reads e j) (r : Rule ε) (j : ℕ) :
    j ∈ MixedDagLocality.dependencyList sources r ↔ MixedDagLocality.Reads reads r j :=
  MixedDagLocality.mem_dependencyList_iff sources reads h r j

example {ε : Type} (check : (ℕ → Node ε) → ℕ → ε → Prop)
    (reads : ε → ℕ → Prop) (locality : MixedDagLocality.ExtraLocal check reads)
    (a b : ℕ → Node ε) (i : ℕ)
    (target : MixedDagLocality.SameData a b i) (rule : (a i).rule = (b i).rule)
    (deps : ∀ j, MixedDagLocality.Reads reads (a i).rule j →
      MixedDagLocality.SameData a b j) : Check check a i ↔ Check check b i :=
  MixedDagLocality.check_local check reads locality a b i target rule deps

example {ε : Type} (check : (ℕ → Node ε) → ℕ → ε → Prop)
    (reads : ε → ℕ → Prop)
    (extraSound : ∀ ns i e, check ns i e →
      (∀ j, reads e j → Extended.Bound (ns j).support (ns j).demand) →
      Extended.Bound (ns i).support (ns i).demand)
    (ns : ℕ → Node ε) (i : ℕ) (valid : Check check ns i)
    (prior : ∀ j, MixedDagLocality.Reads reads (ns i).rule j →
      Extended.Bound (ns j).support (ns j).demand) :
    Extended.Bound (ns i).support (ns i).demand :=
  MixedDagLocality.sound_one check reads extraSound ns i valid prior

example : MixedDagLocality.ExtraLocal extraCheck MixedDagLocality.CaseTrim.payloadReads :=
  MixedDagLocality.CaseTrim.extra_local

def ref : Ref := ⟨0, 1, 1⟩

-- Occurrences are retained, even if the same source is mentioned twice.
example (tree : BankCase.Tree ℕ) :
    MixedDagLocality.CaseTrim.payloadSources (.caseRule [ref, ref] tree) = [0, 0] := by
  rfl
example (tree : BankCase.Tree ℕ) :
    MixedDagLocality.dependencyList MixedDagLocality.CaseTrim.payloadSources
      (.extra (.caseRule [ref, ref] tree)) = [0, 0] := by
  rfl
-- Both payload forms expose the referenced source and exclude unrelated nodes.
example (tree : BankCase.Tree ℕ) :
    MixedDagLocality.CaseTrim.payloadReads (.caseRule [ref] tree) 0 ∧
    ¬ MixedDagLocality.CaseTrim.payloadReads (.caseRule [ref] tree) 1 := by
  simp [MixedDagLocality.CaseTrim.payloadReads, ref]
example : MixedDagLocality.CaseTrim.payloadReads (.trimRule ref) 0 ∧
    ¬ MixedDagLocality.CaseTrim.payloadReads (.trimRule ref) 1 := by
  simp [MixedDagLocality.CaseTrim.payloadReads, ref]

def good (j : ℕ) : Node Payload :=
  if j = 0 then ⟨{2, 3, 6}, 1, .small⟩
  else ⟨{2, 3, 6}, 1, .extra (.trimRule ref)⟩
def bad (j : ℕ) : Node Payload :=
  if j = 0 then ⟨{2, 3, 6}, 0, .small⟩
  else ⟨{2, 3, 6}, 1, .extra (.trimRule ref)⟩

-- The current node is identical, but changing the hidden trim source demand
-- invalidates the checker: a core-only dependency set would be unsound.
example : MixedDagLocality.SameData good bad 1 := by
  simp [MixedDagLocality.SameData, good, bad]
example : MixedDagLocality.CaseTrim.payloadReads (.trimRule ref) 0 := by
  simp [MixedDagLocality.CaseTrim.payloadReads, ref]
example : Check extraCheck good 1 := by
  unfold Check extraCheck TrimCheck RefCheck image good ref UpperBridge.OrderedEdge
  decide
example : ¬ Check extraCheck bad 1 := by
  unfold Check extraCheck TrimCheck RefCheck image bad ref UpperBridge.OrderedEdge
  decide

-- Concrete specialization cannot assume bounds for unrelated predecessors.
example (ns : ℕ → Node Payload) (i : ℕ) (valid : Check extraCheck ns i)
    (prior : ∀ j, MixedDagLocality.Reads MixedDagLocality.CaseTrim.payloadReads
      (ns i).rule j → Extended.Bound (ns j).support (ns j).demand) :
    Extended.Bound (ns i).support (ns i).demand :=
  MixedDagLocality.caseTrim_sound_one ns i valid prior

#print axioms MixedDagLocality.CaseTrim.extra_sound
#print axioms MixedDagLocality.caseTrim_sound_one
