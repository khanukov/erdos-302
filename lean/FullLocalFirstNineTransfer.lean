import FullLocal0000
import FirstRealShard

/-! CI candidate: transfer the nine checked literal nodes to the generated first
snapshot. No whole-bank check or archive-to-Lean theorem is asserted. -/
namespace FullLocalFirstNineTransfer
open MixedDag MixedDagLocality MixedCaseTrimCandidate

abbrev localNodes := FullLocalShards.S0.nodes

def lowerRule : Rule FullLocalAssemblyCandidate.Payload → Rule Payload
  | .edge a b c => .edge a b c
  | .small => .small
  | .image j m d => .image j m d
  | .pack n rows d => .pack n rows d
  | .extra (.ordinary e) => .extra e
  | .extra .external => .small

def lower (ns : ℕ → Node FullLocalAssemblyCandidate.Payload) : ℕ → Node Payload :=
  fun j => ⟨(ns j).support, (ns j).demand, lowerRule (ns j).rule⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 4000000 in
/-- The equality is kernel checked for each of the nine literal fields. -/
theorem fields (j : ℕ) (hj : j < 9) :
    SameData FirstRealData.nodes (lower localNodes) j := by
  interval_cases j <;> constructor <;> rfl

set_option maxRecDepth 100000 in
set_option maxHeartbeats 4000000 in
theorem rules (i : ℕ) (hi : i < 9) :
    (FirstRealData.nodes i).rule = (lower localNodes i).rule := by
  interval_cases i <;> rfl

theorem reads_bounded (i : ℕ) (hi : i < 9) (j : ℕ)
    (h : Reads CaseTrim.payloadReads (FirstRealData.nodes i).rule j) : j < 9 := by
  interval_cases i <;> simp_all [FirstRealData.nodes, Reads, CaseTrim.payloadReads] <;> omega

/-- Apply the verified locality theorem, rather than re-running the check. -/
theorem lower_checked (i : ℕ) (hi : i < 9) :
    Check MixedCaseTrimCandidate.extraCheck (lower localNodes) i := by
  apply (check_local MixedCaseTrimCandidate.extraCheck CaseTrim.payloadReads
    CaseTrim.extra_local FirstRealData.nodes (lower localNodes) i
    (fields i hi) (rules i hi) (fun j hj => fields j (reads_bounded i hi j hj))).mp
  exact FirstRealShard.checked i hi

set_option maxRecDepth 100000 in
set_option maxHeartbeats 4000000 in
/-- The wrapper does not alter any checker field on these actual nodes. -/
theorem local_checked (i : ℕ) (hi : i < 9) :
    Check FullLocalAssemblyCandidate.extraCheck localNodes i := by
  have h := lower_checked i hi
  interval_cases i <;> exact h

/-- Corrupt the demand of the actual dependency of node 5. -/
def changed (j : ℕ) : Node Payload :=
  if j = 4 then ⟨(FirstRealData.nodes 4).support, 0, (FirstRealData.nodes 4).rule⟩
  else FirstRealData.nodes j

theorem changed_dependency_rejected : ¬ SameData FirstRealData.nodes changed 4 := by
  simp [SameData, changed, FirstRealData.nodes]

theorem changed_dependency_is_read :
    Reads CaseTrim.payloadReads (FirstRealData.nodes 5).rule 4 := by
  simp [Reads, CaseTrim.payloadReads, FirstRealData.nodes]

theorem changed_check_false : ¬ Check MixedCaseTrimCandidate.extraCheck changed 5 := by
  intro h
  change TrimCheck changed 5 ⟨4, 1, 1⟩ at h
  have hd := h.2.2.2
  simp [changed, FirstRealData.nodes] at hd

#print axioms fields
#print axioms rules
#print axioms reads_bounded
#print axioms lower_checked
#print axioms local_checked
#print axioms changed_dependency_rejected
#print axioms changed_dependency_is_read
#print axioms changed_check_false
end FullLocalFirstNineTransfer
