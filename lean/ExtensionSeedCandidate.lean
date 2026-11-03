import BankProfile
import PackRule

/-! Candidate only: no Lean build or axiom gate has been run.  A source bound
and the boundary test are explicit obligations, not axioms or hidden inputs. -/
namespace ExtensionSeedCandidate
open Finset UpperBridge

/-- A finite, decidable boundary test.  All three quantifiers are bounded by S;
there is no reliance on an externally supplied edge enumeration. -/
def Boundary (S T U : Finset ℕ) : Prop :=
  T ⊆ S ∧ U ⊆ S \ T ∧
  ∀ a ∈ S, ∀ b ∈ S, ∀ c ∈ S,
    OrderedEdge S a b c →
      (a ∈ T ∧ b ∈ T ∧ c ∈ T) ∨ (a ∈ U ∨ b ∈ U ∨ c ∈ U)

instance (S T U : Finset ℕ) : Decidable (Boundary S T U) := by
  unfold Boundary OrderedEdge
  infer_instance

/-- Exact projection capacity: deleting U, then the part of T beyond P. -/
theorem seed {S T U P : Finset ℕ} {k : ℕ}
    (hb : Extended.Bound S k) (hc : Boundary S T U) (hp : P ⊆ T) :
    Extended.Bound P (k - U.card - (T \ P).card) := by
  have ht : Extended.Bound T (k - U.card) := by
    intro C hC
    have h := UpperRenewal.extension_projection hc.1 hb
      (by
        intro a b c e
        exact hc.2.2 a e.1 b e.2.1 c e.2.2.1 e) C hC
    omega
  exact BankProfile.restrict_bound hp ht

/-- Scaling uses exact rational scaling, not truncated division: positivity and
integrality of each product are exposed as obligations. -/
theorem scaled_seed {S T U P : Finset ℕ} {k m d : ℕ}
    (hb : Extended.Bound S k) (hm : 0 < m) (hd : 0 < d)
    (hex : ∀ x ∈ S, d ∣ x * m)
    (hc : Boundary (ArchiveScaling.image S m d) T U) (hp : P ⊆ T) :
    Extended.Bound P (k - U.card - (T \ P).card) := by
  exact seed (ArchivePack.scaled_bound hm hd hex hb) hc hp

/-- Pair enumeration is complete: a reciprocal edge determines its first
vertex as b*c/(b+c). The equality guard rejects non-integral candidates. -/
def PairBoundary (S T U : Finset ℕ) : Prop :=
  T ⊆ S ∧ U ⊆ S \ T ∧
  ∀ b ∈ S, ∀ c ∈ S, b < c →
    let a := b * c / (b + c)
    a ∈ S → 0 < a → a < b → b * c = a * (b + c) →
    (a ∈ T ∧ b ∈ T ∧ c ∈ T) ∨ (a ∈ U ∨ b ∈ U ∨ c ∈ U)

instance (S T U : Finset ℕ) : Decidable (PairBoundary S T U) := by
  unfold PairBoundary
  infer_instance

theorem pair_boundary_sound {S T U : Finset ℕ} (h : PairBoundary S T U) :
    Boundary S T U := by
  refine ⟨h.1, h.2.1, ?_⟩
  intro a ha b hb c hc e
  rcases e with ⟨_, _, _, ha0, hab, hbc, he⟩
  have hpos : 0 < b + c := by omega
  have heq : b * c / (b + c) = a := by
    rw [he]
    exact Nat.mul_div_cancel a hpos
  have hpair := h.2.2 b hb c hc hbc
  rw [heq] at hpair
  exact hpair ha ha0 hab he

/-- A satisfiable positive example, with its source demand proved from an
actual edge rather than assumed. -/
theorem positive_example : Extended.Bound ({6, 10, 15} : Finset ℕ) 1 := by
  have hc : PairBoundary ({6, 10, 15} : Finset ℕ) {6, 10, 15} ∅ := by decide
  have hb : Extended.Bound ({6, 10, 15} : Finset ℕ) 1 :=
    UpperBridge.example_cover_lower
  have h := seed hb (pair_boundary_sound hc)
    (Finset.Subset.rfl : ({6, 10, 15} : Finset ℕ) ⊆ {6, 10, 15})
  simpa using h

example : ¬ PairBoundary ({6, 10, 15} : Finset ℕ) {6, 10} ∅ := by decide

#print axioms positive_example
#print axioms pair_boundary_sound
#print axioms seed
#print axioms scaled_seed
end ExtensionSeedCandidate
