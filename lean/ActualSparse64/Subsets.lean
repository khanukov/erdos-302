import ActualSparse64.Data

namespace ActualSparse64
set_option maxRecDepth 100000
set_option maxHeartbeats 40000000

theorem target_subset : ∀ x, x ∈ T → x ∈ S := by
  intro x hx
  have h : T.all (fun x => decide (x ∈ S)) = true := by decide
  exact of_decide_eq_true (List.all_eq_true.mp h x hx)

theorem delete_subset : ∀ x, x ∈ D → x ∈ S ∧ x ∉ T := by
  intro x hx
  have h : D.all (fun x => decide (x ∈ S ∧ x ∉ T)) = true := by decide
  exact of_decide_eq_true (List.all_eq_true.mp h x hx)

end ActualSparse64
