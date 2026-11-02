import SmoothPartition
import Mathlib.Data.Nat.Factorization.Induction

/-! Candidate prime-power decomposition for finite reindexing.
    Not compiled: run in hosted CI before using. -/
namespace PrimePowerReindex

/-- Existence, proved by induction over prime factors. -/
theorem exists_decomposition {p t : ℕ} (hp : p.Prime) (ht : 0 < t) :
    ∃ q k : ℕ, 0 < q ∧ ¬ p ∣ q ∧ t = q * p ^ k := by
  revert ht
  induction t using induction_on_primes with
  | zero => intro ht; omega
  | one =>
      intro _
      exact ⟨1, 0, by decide, (fun h => hp.ne_one (Nat.dvd_one.mp h)), by simp⟩
  | prime_mul r m hr ih =>
      intro ht
      have hm : 0 < m := by
        by_contra h
        have : m = 0 := by omega
        simp [this] at ht
      obtain ⟨q, k, hq, hn, he⟩ := ih hm
      by_cases hrp : r = p
      · subst r
        refine ⟨q, k + 1, hq, hn, ?_⟩
        rw [he, pow_succ]
        ring
      · refine ⟨r * q, k, Nat.mul_pos hr.pos hq, ?_, ?_⟩
        · intro hd
          rcases hp.dvd_mul.mp hd with h | h
          · exact hrp ((Nat.dvd_prime hr).mp h |>.resolve_left hp.ne_one).symm
          · exact hn h
        · rw [he]
          ring

/-- Uniqueness of both factors, not merely of their product. -/
theorem decomposition_unique {p a b k l : ℕ} (hp : p.Prime)
    (ha : 0 < a) (hb : 0 < b) (hna : ¬ p ∣ a) (hnb : ¬ p ∣ b)
    (h : a * p ^ k = b * p ^ l) : a = b ∧ k = l := by
  have hra : SmoothPartition.Rough {p} a := by
    refine ⟨ha, ?_⟩
    intro r hr hrp
    have : r = p := by simpa using hrp
    subst r
    exact hna
  have hrb : SmoothPartition.Rough {p} b := by
    refine ⟨hb, ?_⟩
    intro r hr hrp
    have : r = p := by simpa using hrp
    subst r
    exact hnb
  have hs : ∀ n, SmoothRenewal.Smooth {p} (p ^ n) := by
    intro n r hr hd
    have : r = p := (Nat.dvd_prime hp).mp (hr.dvd_of_dvd_pow hd) |>.resolve_left hr.ne_one
    simpa [this]
  have h' := SmoothPartition.decomposition_unique hra hrb
    (pow_pos hp.pos k) (pow_pos hp.pos l) (hs k) (hs l) h
  exact ⟨h'.1, Nat.pow_right_injective hp.two_le h'.2⟩

/-- A bounded positive integer has one pair; the q factor inherits
    coprimality to any earlier product P. -/
theorem bounded_decomposition {p P N t : ℕ} (hp : p.Prime)
    (ht : 0 < t) (htN : t ≤ N) (hc : Nat.Coprime t P) :
    ∃! x : ℕ × ℕ, 0 < x.1 ∧ ¬ p ∣ x.1 ∧ Nat.Coprime x.1 P ∧
      x.1 * p ^ x.2 ≤ N ∧ t = x.1 * p ^ x.2 := by
  obtain ⟨q, k, hq, hn, he⟩ := exists_decomposition hp ht
  have hqc : Nat.Coprime q P := by
    apply Nat.coprime_of_dvd
    intro r hr hrq hrP
    have hrt : r ∣ t := by
      rw [he]
      exact dvd_mul_of_dvd_left hrq _
    have hg : r ∣ Nat.gcd t P := Nat.dvd_gcd hrt hrP
    rw [hc] at hg
    exact hr.ne_one (Nat.dvd_one.mp hg)
  refine ⟨(q, k), ⟨hq, hn, hqc, ?_, he⟩, ?_⟩
  · simpa [← he] using htN
  · rintro ⟨a, l⟩ ⟨ha, hna, _, _, hl⟩
    obtain ⟨hqa, hkl⟩ := decomposition_unique hp hq ha hn hna (he.symm.trans hl)
    exact Prod.ext hqa.symm hkl.symm

#print axioms exists_decomposition
#print axioms decomposition_unique
#print axioms bounded_decomposition
end PrimePowerReindex
