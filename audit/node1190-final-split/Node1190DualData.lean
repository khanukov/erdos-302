import DenseData

namespace Node1190Dual
open Finset
open scoped BigOperators
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000

def refs : List MixedCaseTrimCandidate.Ref :=
  match (Node1209Dense.nodes 336).rule with
  | .extra (.caseRule rs _) => rs
  | _ => []
def entries : List (BankCase.WeightedRow ℕ) :=
  match (Node1209Dense.nodes 336).rule with
  | .extra (.caseRule _ (.dual es _)) => es
  | _ => []
def refAt (i : ℕ) : MixedCaseTrimCandidate.Ref := refs.getD i ⟨0, 0, 0⟩
def entryAt (i : ℕ) : BankCase.WeightedRow ℕ := BankCase.dualEntry entries i

def load (x : ℕ) : ℤ :=
  ∑ i ∈ (Finset.range entries.length).filter (fun i => x ∈ (entryAt i).1.1), (entryAt i).2

def objective : ℤ :=
  ∑ i ∈ Finset.range entries.length, (entryAt i).2 * BankCase.Remaining (entryAt i).1.1 (entryAt i).1.2 ∅
end Node1190Dual
