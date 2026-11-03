import ActualSparse64.Vertex118
import ActualSparse64.Vertex122
import ActualSparse64.Vertex134
import ActualSparse64.Vertex142
import ActualSparse64.Vertex177
import ActualSparse64.Vertex183
import ActualSparse64.Vertex201
import ActualSparse64.Vertex213
import ActualSparse64.Vertex236
import ActualSparse64.Vertex244
import ActualSparse64.Vertex268
import ActualSparse64.Vertex284
import ActualSparse64.Vertex295
import ActualSparse64.Vertex305
import ActualSparse64.Vertex335
import ActualSparse64.Vertex354
import ActualSparse64.Vertex355
import ActualSparse64.Vertex366
import ActualSparse64.Vertex402
import ActualSparse64.Vertex426
import ActualSparse64.Vertex472
import ActualSparse64.Vertex488
import ActualSparse64.Vertex531
import ActualSparse64.Vertex536
import ActualSparse64.Vertex549
import ActualSparse64.Vertex568
import ActualSparse64.Vertex590
import ActualSparse64.Vertex603
import ActualSparse64.Vertex610
import ActualSparse64.Vertex639
import ActualSparse64.Vertex670
import ActualSparse64.Vertex708
import ActualSparse64.Vertex710
import ActualSparse64.Vertex732
import ActualSparse64.Vertex804
import ActualSparse64.Vertex852
import ActualSparse64.Vertex885
import ActualSparse64.Vertex915
import ActualSparse64.Vertex1005
import ActualSparse64.Vertex1062
import ActualSparse64.Vertex1065
import ActualSparse64.Vertex1098
import ActualSparse64.Vertex1180
import ActualSparse64.Vertex1206
import ActualSparse64.Vertex1220
import ActualSparse64.Vertex1239
import ActualSparse64.Vertex1278
import ActualSparse64.Vertex1281
import ActualSparse64.Vertex1340
import ActualSparse64.Vertex1407
import ActualSparse64.Vertex1416
import ActualSparse64.Vertex1420
import ActualSparse64.Vertex1464
import ActualSparse64.Vertex1593
import ActualSparse64.Vertex1608
import ActualSparse64.Vertex1652
import ActualSparse64.Vertex1704
import ActualSparse64.Vertex1708
import ActualSparse64.Vertex1711
import ActualSparse64.Vertex1770
import ActualSparse64.Vertex1829
import ActualSparse64.Vertex1830
import ActualSparse64.Vertex1876
import ActualSparse64.Vertex1888
import SparseBoundaryMathlib
import ExtensionBoundaryData

/-! Candidate only until this whole module and all 64 shards compile and pass
    axiom gates. Literal archive transcription is not archive-byte proof. -/
namespace ActualSparse64
set_option maxRecDepth 100000
set_option maxHeartbeats 40000000

theorem outside_eq : SparseBoundary.outside S T = V := by decide

theorem target_subset : ∀ x, x ∈ T → x ∈ S := by
  intro x hx
  have h : T.all (fun x => decide (x ∈ S)) = true := by decide
  exact of_decide_eq_true (List.all_eq_true.mp h x hx)

theorem delete_subset : ∀ x, x ∈ D → x ∈ S ∧ x ∉ T := by
  intro x hx
  have h : D.all (fun x => decide (x ∈ S ∧ x ∉ T)) = true := by decide
  exact of_decide_eq_true (List.all_eq_true.mp h x hx)

theorem all_shards : ∀ v, v ∈ V → SparseBoundaryShards.shard S D v = true := by
  intro v hv
  simp only [V, List.mem_cons, List.mem_singleton] at hv
  rcases hv with h118 | h122 | h134 | h142 | h177 | h183 | h201 | h213 | h236 | h244 | h268 | h284 | h295 | h305 | h335 | h354 | h355 | h366 | h402 | h426 | h472 | h488 | h531 | h536 | h549 | h568 | h590 | h603 | h610 | h639 | h670 | h708 | h710 | h732 | h804 | h852 | h885 | h915 | h1005 | h1062 | h1065 | h1098 | h1180 | h1206 | h1220 | h1239 | h1278 | h1281 | h1340 | h1407 | h1416 | h1420 | h1464 | h1593 | h1608 | h1652 | h1704 | h1708 | h1711 | h1770 | h1829 | h1830 | h1876 | h1888
  · subst v; exact shard118_full
  · subst v; exact shard122_full
  · subst v; exact shard134_full
  · subst v; exact shard142_full
  · subst v; exact shard177_full
  · subst v; exact shard183_full
  · subst v; exact shard201_full
  · subst v; exact shard213_full
  · subst v; exact shard236_full
  · subst v; exact shard244_full
  · subst v; exact shard268_full
  · subst v; exact shard284_full
  · subst v; exact shard295_full
  · subst v; exact shard305_full
  · subst v; exact shard335_full
  · subst v; exact shard354_full
  · subst v; exact shard355_full
  · subst v; exact shard366_full
  · subst v; exact shard402_full
  · subst v; exact shard426_full
  · subst v; exact shard472_full
  · subst v; exact shard488_full
  · subst v; exact shard531_full
  · subst v; exact shard536_full
  · subst v; exact shard549_full
  · subst v; exact shard568_full
  · subst v; exact shard590_full
  · subst v; exact shard603_full
  · subst v; exact shard610_full
  · subst v; exact shard639_full
  · subst v; exact shard670_full
  · subst v; exact shard708_full
  · subst v; exact shard710_full
  · subst v; exact shard732_full
  · subst v; exact shard804_full
  · subst v; exact shard852_full
  · subst v; exact shard885_full
  · subst v; exact shard915_full
  · subst v; exact shard1005_full
  · subst v; exact shard1062_full
  · subst v; exact shard1065_full
  · subst v; exact shard1098_full
  · subst v; exact shard1180_full
  · subst v; exact shard1206_full
  · subst v; exact shard1220_full
  · subst v; exact shard1239_full
  · subst v; exact shard1278_full
  · subst v; exact shard1281_full
  · subst v; exact shard1340_full
  · subst v; exact shard1407_full
  · subst v; exact shard1416_full
  · subst v; exact shard1420_full
  · subst v; exact shard1464_full
  · subst v; exact shard1593_full
  · subst v; exact shard1608_full
  · subst v; exact shard1652_full
  · subst v; exact shard1704_full
  · subst v; exact shard1708_full
  · subst v; exact shard1711_full
  · subst v; exact shard1770_full
  · subst v; exact shard1829_full
  · subst v; exact shard1830_full
  · subst v; exact shard1876_full
  · subst v; exact shard1888_full

theorem checked : SparseBoundary.check S T D = true := by
  apply SparseBoundaryShards.assemble S T D V target_subset delete_subset
  · intro x hx; rw [outside_eq] at hx; exact hx
  · exact all_shards

theorem source_eq : S.toFinset = ExtensionFirstArchive.source := by decide
theorem target_eq : T.toFinset = ExtensionFirstArchive.target := by decide
theorem delete_eq : D.toFinset = ExtensionFirstArchive.firstDelete := by decide

theorem boundary : ExtensionSeedCandidate.Boundary ExtensionFirstArchive.source
    ExtensionFirstArchive.target ExtensionFirstArchive.firstDelete := by
  have h := (SparseBoundary.check_iff S T D).mp checked
  have h' : SparseBoundary.Boundary S.toFinset.toList T.toFinset.toList D.toFinset.toList := by
    simpa only [SparseBoundary.Boundary, Finset.mem_toList, List.mem_toFinset] using h
  have h'' := (SparseBoundaryMathlib.list_boundary_iff S.toFinset T.toFinset D.toFinset).mp h'
  simpa only [source_eq, target_eq, delete_eq] using h''

#print axioms outside_eq
#print axioms all_shards
#print axioms source_eq
#print axioms target_eq
#print axioms delete_eq
#print axioms boundary
end ActualSparse64
