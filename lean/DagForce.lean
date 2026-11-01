import Dag
import CaseRules

/-! A single path-sensitive force step sourced from an earlier checked DAG
node. This is a soundness bridge, not yet a case-tree checker or a new DAG
constructor. The source may extend outside the target. -/
open Finset UpperBridge BankCase
namespace ArchiveDag

/-- A source cover supplies the residual row; only checked earlier nodes are
used. The branch state is on the target-restricted cover, and the signed
residual explicitly counts source vertices outside the target. -/
theorem force_from_prior (nodes : ℕ → Node) (count j : ℕ)
    (valid : ∀ i < count, Check nodes i) (hj : j < count)
    (T O Z : Finset ℕ) (S : Finset ℕ)
    (hcover : OrderedCover (nodes j).support S)
    (state : State T O Z (S ∩ T))
    (eq : Remaining ((nodes j).support ∩ T)
      (Residual (nodes j).support T (nodes j).demand) O =
      ((((nodes j).support ∩ T) ∩ Free T O Z).card : ℤ)) :
    State T (O ∪ (((nodes j).support ∩ T) ∩ Free T O Z)) Z (S ∩ T) := by
  have hb := sound nodes count valid j hj
  have hc := hb (S ∩ (nodes j).support) (Extended.cover_inter hcover)
  have hr := BankCase.residual_sound (nodes j).support T S (nodes j).demand hc
  have hr' : Row ((nodes j).support ∩ T)
      (Residual (nodes j).support T (nodes j).demand) (S ∩ T) := by
    simpa [Row, Finset.inter_assoc, Finset.inter_left_comm, Finset.inter_comm] using hr
  exact BankCase.force_sound state hr' eq

#print axioms force_from_prior
end ArchiveDag
