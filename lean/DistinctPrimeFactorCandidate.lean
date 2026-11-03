import Mathlib.Data.Nat.Factorization.Basic
import Mathlib.Tactic

/-! Candidate: equality of products determines aligned exponent lists. This file
has not been compiled against the pinned Mathlib; see the accompanying audit. -/
namespace DistinctPrimeFactorCandidate

/-- Bases and exponents are read in the same order. Excess exponents are ignored,
so the injectivity theorem explicitly requires both lengths to match. -/
def product : List ℕ → List ℕ → ℕ
  | p :: ps, e :: es => p ^ e * product ps es
  | _, _ => 1

theorem product_ne_zero (ps es : List ℕ) (hp : ∀ p ∈ ps, p.Prime) :
    product ps es ≠ 0 := by
  induction ps generalizing es with
  | nil => simp [product]
  | cons p ps ih =>
    cases es with
    | nil => simp [product]
    | cons e es =>
      simp only [product]
      exact mul_ne_zero (pow_ne_zero _ (hp p (by simp)).ne_zero)
        (ih es (by intro q hq; exact hp q (by simp [hq])))

theorem factorization_absent (ps es : List ℕ) (q : ℕ)
    (hp : ∀ p ∈ ps, p.Prime) (hq : q ∉ ps) :
    (product ps es).factorization q = 0 := by
  induction ps generalizing es with
  | nil => simp [product]
  | cons p ps ih =>
    cases es with
    | nil => simp [product]
    | cons e es =>
      have pp : p.Prime := hp p (by simp)
      have ht : ∀ r ∈ ps, r.Prime := by
        intro r hr; exact hp r (by simp [hr])
      have hne : p ≠ q := by
        intro h; subst p; exact hq (by simp)
      have htail : q ∉ ps := by
        intro h; exact hq (by simp [h])
      rw [product, Nat.factorization_mul (pow_ne_zero _ pp.ne_zero)
        (product_ne_zero ps es ht), Finsupp.add_apply, pp.factorization_pow]
      simp [Finsupp.single_apply, hne, ih es ht htail]

theorem product_injective (ps es fs : List ℕ)
    (hp : ∀ p ∈ ps, p.Prime) (hd : ps.Nodup)
    (he : es.length = ps.length) (hf : fs.length = ps.length)
    (h : product ps es = product ps fs) : es = fs := by
  induction ps generalizing es fs with
  | nil =>
    cases es <;> cases fs <;> simp_all
  | cons p ps ih =>
    cases es with
    | nil => simp at he
    | cons e es =>
      cases fs with
      | nil => simp at hf
      | cons f fs =>
        have pp : p.Prime := hp p (by simp)
        have ht : ∀ r ∈ ps, r.Prime := by
          intro r hr; exact hp r (by simp [hr])
        have hn : p ∉ ps := (List.nodup_cons.mp hd).1
        have hdt : ps.Nodup := (List.nodup_cons.mp hd).2
        have hel : es.length = ps.length := by simpa using he
        have hfl : fs.length = ps.length := by simpa using hf
        have hz₁ := factorization_absent ps es p ht hn
        have hz₂ := factorization_absent ps fs p ht hn
        have hh := congrArg (fun n : ℕ => n.factorization p) h
        have hef : e = f := by
          simp only [product, Nat.factorization_mul (pow_ne_zero _ pp.ne_zero)
            (product_ne_zero ps es ht), Nat.factorization_mul (pow_ne_zero _ pp.ne_zero)
            (product_ne_zero ps fs ht), Finsupp.add_apply,
            pp.factorization_pow, Finsupp.single_eq_same, hz₁, hz₂, Nat.add_zero] at hh
          exact hh
        subst f
        have htail : product ps es = product ps fs := by
          apply Nat.eq_of_mul_eq_mul_left (pow_pos pp.pos _)
          exact h
        congr 1
        exact ih es fs ht hdt hel hfl htail

-- Repeated prime bases and distinct but composite bases both destroy uniqueness.
example : product [2, 2] [1, 0] = product [2, 2] [0, 1] := by decide
example : ([1, 0] : List ℕ) ≠ [0, 1] := by decide
example : product [2, 4] [2, 0] = product [2, 4] [0, 1] := by decide
example : ([2, 0] : List ℕ) ≠ [0, 1] := by decide

#print axioms product_ne_zero
#print axioms factorization_absent
#print axioms product_injective
end DistinctPrimeFactorCandidate
