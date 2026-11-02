import Dag

/-! Candidate rule for a pack of scaled occurrences of previously checked DAG
nodes. Occurrences are indexed by `Fin n`, so repeated source references are
not collapsed. This is a semantic extension, not yet an archive DAG parser. -/
open Finset UpperBridge
namespace BankRowPack

structure Row where
  source : ℕ
  mul : ℕ
  div : ℕ
  weight : ℕ

def image (nodes : ℕ → ArchiveDag.Node) (r : Row) : Finset ℕ :=
  ArchiveScaling.image (nodes r.source).support r.mul r.div

def Check (nodes : ℕ → ArchiveDag.Node) (cutoff n : ℕ) (rows : Fin n → Row)
    (D k : ℕ) (support : Finset ℕ) : Prop :=
  (∀ i, (rows i).source < cutoff ∧ 0 < (rows i).mul ∧ 0 < (rows i).div ∧
    (∀ x ∈ (nodes (rows i).source).support, (rows i).div ∣ x * (rows i).mul)) ∧
  ArchivePack.Valid Finset.univ (fun i => image nodes (rows i))
    (fun i => (rows i).weight) (fun i => (nodes (rows i).source).demand) D k support

instance (nodes : ℕ → ArchiveDag.Node) (cutoff n : ℕ) (rows : Fin n → Row)
    (D k : ℕ) (support : Finset ℕ) : Decidable (Check nodes cutoff n rows D k support) := by
  unfold Check ArchivePack.Valid
  infer_instance

/-- Every row gets its bound from the existing DAG soundness theorem, rather
than from an assumed row-soundness oracle. -/
theorem sound (nodes : ℕ → ArchiveDag.Node) (cutoff n : ℕ) (rows : Fin n → Row)
    (D k : ℕ) (support : Finset ℕ)
    (prior : ∀ i < cutoff, ArchiveDag.Check nodes i)
    (checked : Check nodes cutoff n rows D k support) : Extended.Bound support k := by
  rcases checked with ⟨hrows, hpack⟩
  apply ArchivePack.sound Finset.univ (fun i => image nodes (rows i))
    (fun i => (rows i).weight) (fun i => (nodes (rows i).source).demand) D k support hpack
  intro i hi
  obtain ⟨href, hm, hd, hex⟩ := hrows i
  exact ArchivePack.scaled_bound hm hd hex (ArchiveDag.sound nodes cutoff prior _ href)

#print axioms BankRowPack.sound
end BankRowPack
