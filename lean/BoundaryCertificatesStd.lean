import Std

/-! Generated from certificate.json.
Finite obligations only. This source has NOT been compiled in this artifact.
No theorem about limsup or f302 is claimed here. -/

set_option maxRecDepth 100000
set_option maxHeartbeats 4000000

namespace Erdos302BoundaryV1

def bit (b : Bool) : Nat := if b then 1 else 0

theorem edges_t0 :
    (60 < 64 ∧ 64 < 960 ∧ 64 * 960 = 60 * (64 + 960)) ∧ (60 < 72 ∧ 72 < 360 ∧ 72 * 360 = 60 * (72 + 360)) ∧ (64 < 72 ∧ 72 < 576 ∧ 72 * 576 = 64 * (72 + 576)) ∧ (72 < 81 ∧ 81 < 648 ∧ 81 * 648 = 72 * (81 + 648)) ∧ (360 < 576 ∧ 576 < 960 ∧ 576 * 960 = 360 * (576 + 960)) ∧ (360 < 648 ∧ 648 < 810 ∧ 648 * 810 = 360 * (648 + 810)) := by
  decide +kernel

theorem cell_t0_0 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x8) ∧ (1 ≤ bit x0 + bit x2 + bit x4) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x2 + bit x3 + bit x6) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x4 + bit x6 + bit x7)) → (x0 = false ∧ x1 = false ∧ x8 = false) → False := by
  decide +kernel

theorem cell_t0_1 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x8) ∧ (1 ≤ bit x0 + bit x2 + bit x4) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x2 + bit x3 + bit x6) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x4 + bit x6 + bit x7)) → (x0 = true ∧ x1 = false ∧ x8 = false) → 2 ≤ bit x2 + bit x3 + bit x4 + bit x5 + bit x6 + bit x7 := by
  decide +kernel

theorem cell_t0_2 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x8) ∧ (1 ≤ bit x0 + bit x2 + bit x4) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x2 + bit x3 + bit x6) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x4 + bit x6 + bit x7)) → (x0 = false ∧ x1 = true ∧ x8 = false) → 2 ≤ bit x2 + bit x3 + bit x4 + bit x5 + bit x6 + bit x7 := by
  decide +kernel

theorem cell_t0_3 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x8) ∧ (1 ≤ bit x0 + bit x2 + bit x4) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x2 + bit x3 + bit x6) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x4 + bit x6 + bit x7)) → (x0 = true ∧ x1 = true ∧ x8 = false) → 2 ≤ bit x2 + bit x3 + bit x4 + bit x5 + bit x6 + bit x7 := by
  decide +kernel

theorem cell_t0_4 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x8) ∧ (1 ≤ bit x0 + bit x2 + bit x4) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x2 + bit x3 + bit x6) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x4 + bit x6 + bit x7)) → (x0 = false ∧ x1 = false ∧ x8 = true) → 2 ≤ bit x2 + bit x3 + bit x4 + bit x5 + bit x6 + bit x7 := by
  decide +kernel

theorem cell_t0_5 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x8) ∧ (1 ≤ bit x0 + bit x2 + bit x4) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x2 + bit x3 + bit x6) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x4 + bit x6 + bit x7)) → (x0 = true ∧ x1 = false ∧ x8 = true) → 2 ≤ bit x2 + bit x3 + bit x4 + bit x5 + bit x6 + bit x7 := by
  decide +kernel

theorem cell_t0_6 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x8) ∧ (1 ≤ bit x0 + bit x2 + bit x4) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x2 + bit x3 + bit x6) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x4 + bit x6 + bit x7)) → (x0 = false ∧ x1 = true ∧ x8 = true) → 2 ≤ bit x2 + bit x3 + bit x4 + bit x5 + bit x6 + bit x7 := by
  decide +kernel

theorem cell_t0_7 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x8) ∧ (1 ≤ bit x0 + bit x2 + bit x4) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x2 + bit x3 + bit x6) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x4 + bit x6 + bit x7)) → (x0 = true ∧ x1 = true ∧ x8 = true) → 1 ≤ bit x2 + bit x3 + bit x4 + bit x5 + bit x6 + bit x7 := by
  decide +kernel

theorem edges_t1 :
    (105 < 150 ∧ 150 < 350 ∧ 150 * 350 = 105 * (150 + 350)) ∧ (150 < 225 ∧ 225 < 450 ∧ 225 * 450 = 150 * (225 + 450)) ∧ (225 < 306 ∧ 306 < 850 ∧ 306 * 850 = 225 * (306 + 850)) ∧ (225 < 350 ∧ 350 < 630 ∧ 350 * 630 = 225 * (350 + 630)) ∧ (306 < 595 ∧ 595 < 630 ∧ 595 * 630 = 306 * (595 + 630)) ∧ (350 < 595 ∧ 595 < 850 ∧ 595 * 850 = 350 * (595 + 850)) := by
  decide +kernel

theorem cell_t1_0 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x4) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x2 + bit x3 + bit x8) ∧ (1 ≤ bit x2 + bit x4 + bit x7) ∧ (1 ≤ bit x3 + bit x6 + bit x7) ∧ (1 ≤ bit x4 + bit x6 + bit x8)) → (x3 = false ∧ x6 = false ∧ x7 = false) → False := by
  decide +kernel

theorem cell_t1_1 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x4) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x2 + bit x3 + bit x8) ∧ (1 ≤ bit x2 + bit x4 + bit x7) ∧ (1 ≤ bit x3 + bit x6 + bit x7) ∧ (1 ≤ bit x4 + bit x6 + bit x8)) → (x3 = true ∧ x6 = false ∧ x7 = false) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x4 + bit x5 + bit x8 := by
  decide +kernel

theorem cell_t1_2 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x4) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x2 + bit x3 + bit x8) ∧ (1 ≤ bit x2 + bit x4 + bit x7) ∧ (1 ≤ bit x3 + bit x6 + bit x7) ∧ (1 ≤ bit x4 + bit x6 + bit x8)) → (x3 = false ∧ x6 = true ∧ x7 = false) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x4 + bit x5 + bit x8 := by
  decide +kernel

theorem cell_t1_3 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x4) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x2 + bit x3 + bit x8) ∧ (1 ≤ bit x2 + bit x4 + bit x7) ∧ (1 ≤ bit x3 + bit x6 + bit x7) ∧ (1 ≤ bit x4 + bit x6 + bit x8)) → (x3 = true ∧ x6 = true ∧ x7 = false) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x4 + bit x5 + bit x8 := by
  decide +kernel

theorem cell_t1_4 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x4) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x2 + bit x3 + bit x8) ∧ (1 ≤ bit x2 + bit x4 + bit x7) ∧ (1 ≤ bit x3 + bit x6 + bit x7) ∧ (1 ≤ bit x4 + bit x6 + bit x8)) → (x3 = false ∧ x6 = false ∧ x7 = true) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x4 + bit x5 + bit x8 := by
  decide +kernel

theorem cell_t1_5 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x4) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x2 + bit x3 + bit x8) ∧ (1 ≤ bit x2 + bit x4 + bit x7) ∧ (1 ≤ bit x3 + bit x6 + bit x7) ∧ (1 ≤ bit x4 + bit x6 + bit x8)) → (x3 = true ∧ x6 = false ∧ x7 = true) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x4 + bit x5 + bit x8 := by
  decide +kernel

theorem cell_t1_6 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x4) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x2 + bit x3 + bit x8) ∧ (1 ≤ bit x2 + bit x4 + bit x7) ∧ (1 ≤ bit x3 + bit x6 + bit x7) ∧ (1 ≤ bit x4 + bit x6 + bit x8)) → (x3 = false ∧ x6 = true ∧ x7 = true) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x4 + bit x5 + bit x8 := by
  decide +kernel

theorem cell_t1_7 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x4) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x2 + bit x3 + bit x8) ∧ (1 ≤ bit x2 + bit x4 + bit x7) ∧ (1 ≤ bit x3 + bit x6 + bit x7) ∧ (1 ≤ bit x4 + bit x6 + bit x8)) → (x3 = true ∧ x6 = true ∧ x7 = true) → 1 ≤ bit x0 + bit x1 + bit x2 + bit x4 + bit x5 + bit x8 := by
  decide +kernel

theorem edges_t2 :
    (3 < 4 ∧ 4 < 12 ∧ 4 * 12 = 3 * (4 + 12)) ∧ (4 < 5 ∧ 5 < 20 ∧ 5 * 20 = 4 * (5 + 20)) ∧ (4 < 6 ∧ 6 < 12 ∧ 6 * 12 = 4 * (6 + 12)) ∧ (5 < 6 ∧ 6 < 30 ∧ 6 * 30 = 5 * (6 + 30)) ∧ (6 < 8 ∧ 8 < 24 ∧ 8 * 24 = 6 * (8 + 24)) ∧ (8 < 12 ∧ 12 < 24 ∧ 12 * 24 = 8 * (12 + 24)) ∧ (12 < 20 ∧ 20 < 30 ∧ 20 * 30 = 12 * (20 + 30)) := by
  decide +kernel

theorem cell_t2_0 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x5) ∧ (1 ≤ bit x1 + bit x2 + bit x6) ∧ (1 ≤ bit x1 + bit x3 + bit x5) ∧ (1 ≤ bit x2 + bit x3 + bit x8) ∧ (1 ≤ bit x3 + bit x4 + bit x7) ∧ (1 ≤ bit x4 + bit x5 + bit x7) ∧ (1 ≤ bit x5 + bit x6 + bit x8)) → (x5 = false ∧ x8 = false) → 4 ≤ bit x0 + bit x1 + bit x2 + bit x3 + bit x4 + bit x6 + bit x7 := by
  decide +kernel

theorem cell_t2_1 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x5) ∧ (1 ≤ bit x1 + bit x2 + bit x6) ∧ (1 ≤ bit x1 + bit x3 + bit x5) ∧ (1 ≤ bit x2 + bit x3 + bit x8) ∧ (1 ≤ bit x3 + bit x4 + bit x7) ∧ (1 ≤ bit x4 + bit x5 + bit x7) ∧ (1 ≤ bit x5 + bit x6 + bit x8)) → (x5 = true ∧ x8 = false) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x3 + bit x4 + bit x6 + bit x7 := by
  decide +kernel

theorem cell_t2_2 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x5) ∧ (1 ≤ bit x1 + bit x2 + bit x6) ∧ (1 ≤ bit x1 + bit x3 + bit x5) ∧ (1 ≤ bit x2 + bit x3 + bit x8) ∧ (1 ≤ bit x3 + bit x4 + bit x7) ∧ (1 ≤ bit x4 + bit x5 + bit x7) ∧ (1 ≤ bit x5 + bit x6 + bit x8)) → (x5 = false ∧ x8 = true) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x3 + bit x4 + bit x6 + bit x7 := by
  decide +kernel

theorem cell_t2_3 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x5) ∧ (1 ≤ bit x1 + bit x2 + bit x6) ∧ (1 ≤ bit x1 + bit x3 + bit x5) ∧ (1 ≤ bit x2 + bit x3 + bit x8) ∧ (1 ≤ bit x3 + bit x4 + bit x7) ∧ (1 ≤ bit x4 + bit x5 + bit x7) ∧ (1 ≤ bit x5 + bit x6 + bit x8)) → (x5 = true ∧ x8 = true) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x3 + bit x4 + bit x6 + bit x7 := by
  decide +kernel

theorem edges_t3 :
    (81 < 90 ∧ 90 < 810 ∧ 90 * 810 = 81 * (90 + 810)) ∧ (90 < 110 ∧ 110 < 495 ∧ 110 * 495 = 90 * (110 + 495)) ∧ (90 < 135 ∧ 135 < 270 ∧ 135 * 270 = 90 * (135 + 270)) ∧ (110 < 135 ∧ 135 < 594 ∧ 135 * 594 = 110 * (135 + 594)) ∧ (270 < 405 ∧ 405 < 810 ∧ 405 * 810 = 270 * (405 + 810)) ∧ (270 < 495 ∧ 495 < 594 ∧ 495 * 594 = 270 * (495 + 594)) := by
  decide +kernel

theorem cell_t3_0 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x8) ∧ (1 ≤ bit x1 + bit x2 + bit x6) ∧ (1 ≤ bit x1 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x3 + bit x7) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x4 + bit x6 + bit x7)) → (x2 = false ∧ x3 = false ∧ x7 = false) → False := by
  decide +kernel

theorem cell_t3_1 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x8) ∧ (1 ≤ bit x1 + bit x2 + bit x6) ∧ (1 ≤ bit x1 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x3 + bit x7) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x4 + bit x6 + bit x7)) → (x2 = true ∧ x3 = false ∧ x7 = false) → 2 ≤ bit x0 + bit x1 + bit x4 + bit x5 + bit x6 + bit x8 := by
  decide +kernel

theorem cell_t3_2 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x8) ∧ (1 ≤ bit x1 + bit x2 + bit x6) ∧ (1 ≤ bit x1 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x3 + bit x7) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x4 + bit x6 + bit x7)) → (x2 = false ∧ x3 = true ∧ x7 = false) → 2 ≤ bit x0 + bit x1 + bit x4 + bit x5 + bit x6 + bit x8 := by
  decide +kernel

theorem cell_t3_3 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x8) ∧ (1 ≤ bit x1 + bit x2 + bit x6) ∧ (1 ≤ bit x1 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x3 + bit x7) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x4 + bit x6 + bit x7)) → (x2 = true ∧ x3 = true ∧ x7 = false) → 2 ≤ bit x0 + bit x1 + bit x4 + bit x5 + bit x6 + bit x8 := by
  decide +kernel

theorem cell_t3_4 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x8) ∧ (1 ≤ bit x1 + bit x2 + bit x6) ∧ (1 ≤ bit x1 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x3 + bit x7) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x4 + bit x6 + bit x7)) → (x2 = false ∧ x3 = false ∧ x7 = true) → 2 ≤ bit x0 + bit x1 + bit x4 + bit x5 + bit x6 + bit x8 := by
  decide +kernel

theorem cell_t3_5 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x8) ∧ (1 ≤ bit x1 + bit x2 + bit x6) ∧ (1 ≤ bit x1 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x3 + bit x7) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x4 + bit x6 + bit x7)) → (x2 = true ∧ x3 = false ∧ x7 = true) → 2 ≤ bit x0 + bit x1 + bit x4 + bit x5 + bit x6 + bit x8 := by
  decide +kernel

theorem cell_t3_6 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x8) ∧ (1 ≤ bit x1 + bit x2 + bit x6) ∧ (1 ≤ bit x1 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x3 + bit x7) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x4 + bit x6 + bit x7)) → (x2 = false ∧ x3 = true ∧ x7 = true) → 2 ≤ bit x0 + bit x1 + bit x4 + bit x5 + bit x6 + bit x8 := by
  decide +kernel

theorem cell_t3_7 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x8) ∧ (1 ≤ bit x1 + bit x2 + bit x6) ∧ (1 ≤ bit x1 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x3 + bit x7) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x4 + bit x6 + bit x7)) → (x2 = true ∧ x3 = true ∧ x7 = true) → 1 ≤ bit x0 + bit x1 + bit x4 + bit x5 + bit x6 + bit x8 := by
  decide +kernel

theorem edges_t4 :
    (12 < 15 ∧ 15 < 60 ∧ 15 * 60 = 12 * (15 + 60)) ∧ (12 < 20 ∧ 20 < 30 ∧ 20 * 30 = 12 * (20 + 30)) ∧ (15 < 20 ∧ 20 < 60 ∧ 20 * 60 = 15 * (20 + 60)) ∧ (12 < 21 ∧ 21 < 28 ∧ 21 * 28 = 12 * (21 + 28)) ∧ (20 < 28 ∧ 28 < 70 ∧ 28 * 70 = 20 * (28 + 70)) ∧ (20 < 30 ∧ 30 < 60 ∧ 30 * 60 = 20 * (30 + 60)) ∧ (21 < 30 ∧ 30 < 70 ∧ 30 * 70 = 21 * (30 + 70)) := by
  decide +kernel

theorem cell_t4_0 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x6) ∧ (1 ≤ bit x0 + bit x2 + bit x5) ∧ (1 ≤ bit x1 + bit x2 + bit x6) ∧ (1 ≤ bit x0 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x4 + bit x7) ∧ (1 ≤ bit x2 + bit x5 + bit x6) ∧ (1 ≤ bit x3 + bit x5 + bit x7)) → (x3 = false ∧ x5 = false ∧ x7 = false) → False := by
  decide +kernel

theorem cell_t4_1 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x6) ∧ (1 ≤ bit x0 + bit x2 + bit x5) ∧ (1 ≤ bit x1 + bit x2 + bit x6) ∧ (1 ≤ bit x0 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x4 + bit x7) ∧ (1 ≤ bit x2 + bit x5 + bit x6) ∧ (1 ≤ bit x3 + bit x5 + bit x7)) → (x3 = true ∧ x5 = false ∧ x7 = false) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x4 + bit x6 := by
  decide +kernel

theorem cell_t4_2 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x6) ∧ (1 ≤ bit x0 + bit x2 + bit x5) ∧ (1 ≤ bit x1 + bit x2 + bit x6) ∧ (1 ≤ bit x0 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x4 + bit x7) ∧ (1 ≤ bit x2 + bit x5 + bit x6) ∧ (1 ≤ bit x3 + bit x5 + bit x7)) → (x3 = false ∧ x5 = true ∧ x7 = false) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x4 + bit x6 := by
  decide +kernel

theorem cell_t4_3 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x6) ∧ (1 ≤ bit x0 + bit x2 + bit x5) ∧ (1 ≤ bit x1 + bit x2 + bit x6) ∧ (1 ≤ bit x0 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x4 + bit x7) ∧ (1 ≤ bit x2 + bit x5 + bit x6) ∧ (1 ≤ bit x3 + bit x5 + bit x7)) → (x3 = true ∧ x5 = true ∧ x7 = false) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x4 + bit x6 := by
  decide +kernel

theorem cell_t4_4 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x6) ∧ (1 ≤ bit x0 + bit x2 + bit x5) ∧ (1 ≤ bit x1 + bit x2 + bit x6) ∧ (1 ≤ bit x0 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x4 + bit x7) ∧ (1 ≤ bit x2 + bit x5 + bit x6) ∧ (1 ≤ bit x3 + bit x5 + bit x7)) → (x3 = false ∧ x5 = false ∧ x7 = true) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x4 + bit x6 := by
  decide +kernel

theorem cell_t4_5 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x6) ∧ (1 ≤ bit x0 + bit x2 + bit x5) ∧ (1 ≤ bit x1 + bit x2 + bit x6) ∧ (1 ≤ bit x0 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x4 + bit x7) ∧ (1 ≤ bit x2 + bit x5 + bit x6) ∧ (1 ≤ bit x3 + bit x5 + bit x7)) → (x3 = true ∧ x5 = false ∧ x7 = true) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x4 + bit x6 := by
  decide +kernel

theorem cell_t4_6 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x6) ∧ (1 ≤ bit x0 + bit x2 + bit x5) ∧ (1 ≤ bit x1 + bit x2 + bit x6) ∧ (1 ≤ bit x0 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x4 + bit x7) ∧ (1 ≤ bit x2 + bit x5 + bit x6) ∧ (1 ≤ bit x3 + bit x5 + bit x7)) → (x3 = false ∧ x5 = true ∧ x7 = true) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x4 + bit x6 := by
  decide +kernel

theorem cell_t4_7 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x6) ∧ (1 ≤ bit x0 + bit x2 + bit x5) ∧ (1 ≤ bit x1 + bit x2 + bit x6) ∧ (1 ≤ bit x0 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x4 + bit x7) ∧ (1 ≤ bit x2 + bit x5 + bit x6) ∧ (1 ≤ bit x3 + bit x5 + bit x7)) → (x3 = true ∧ x5 = true ∧ x7 = true) → 1 ≤ bit x0 + bit x1 + bit x2 + bit x4 + bit x6 := by
  decide +kernel

theorem edges_t5 :
    (7 < 8 ∧ 8 < 56 ∧ 8 * 56 = 7 * (8 + 56)) ∧ (8 < 9 ∧ 9 < 72 ∧ 9 * 72 = 8 * (9 + 72)) ∧ (56 < 64 ∧ 64 < 448 ∧ 64 * 448 = 56 * (64 + 448)) ∧ (56 < 72 ∧ 72 < 252 ∧ 72 * 252 = 56 * (72 + 252)) ∧ (64 < 72 ∧ 72 < 576 ∧ 72 * 576 = 64 * (72 + 576)) ∧ (252 < 448 ∧ 448 < 576 ∧ 448 * 576 = 252 * (448 + 576)) := by
  decide +kernel

theorem cell_t5_0 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x3) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x3 + bit x4 + bit x7) ∧ (1 ≤ bit x3 + bit x5 + bit x6) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x6 + bit x7 + bit x8)) → (x6 = false ∧ x7 = false ∧ x8 = false) → False := by
  decide +kernel

theorem cell_t5_1 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x3) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x3 + bit x4 + bit x7) ∧ (1 ≤ bit x3 + bit x5 + bit x6) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x6 + bit x7 + bit x8)) → (x6 = true ∧ x7 = false ∧ x8 = false) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x3 + bit x4 + bit x5 := by
  decide +kernel

theorem cell_t5_2 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x3) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x3 + bit x4 + bit x7) ∧ (1 ≤ bit x3 + bit x5 + bit x6) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x6 + bit x7 + bit x8)) → (x6 = false ∧ x7 = true ∧ x8 = false) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x3 + bit x4 + bit x5 := by
  decide +kernel

theorem cell_t5_3 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x3) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x3 + bit x4 + bit x7) ∧ (1 ≤ bit x3 + bit x5 + bit x6) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x6 + bit x7 + bit x8)) → (x6 = true ∧ x7 = true ∧ x8 = false) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x3 + bit x4 + bit x5 := by
  decide +kernel

theorem cell_t5_4 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x3) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x3 + bit x4 + bit x7) ∧ (1 ≤ bit x3 + bit x5 + bit x6) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x6 + bit x7 + bit x8)) → (x6 = false ∧ x7 = false ∧ x8 = true) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x3 + bit x4 + bit x5 := by
  decide +kernel

theorem cell_t5_5 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x3) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x3 + bit x4 + bit x7) ∧ (1 ≤ bit x3 + bit x5 + bit x6) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x6 + bit x7 + bit x8)) → (x6 = true ∧ x7 = false ∧ x8 = true) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x3 + bit x4 + bit x5 := by
  decide +kernel

theorem cell_t5_6 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x3) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x3 + bit x4 + bit x7) ∧ (1 ≤ bit x3 + bit x5 + bit x6) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x6 + bit x7 + bit x8)) → (x6 = false ∧ x7 = true ∧ x8 = true) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x3 + bit x4 + bit x5 := by
  decide +kernel

theorem cell_t5_7 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x3) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x3 + bit x4 + bit x7) ∧ (1 ≤ bit x3 + bit x5 + bit x6) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x6 + bit x7 + bit x8)) → (x6 = true ∧ x7 = true ∧ x8 = true) → 1 ≤ bit x0 + bit x1 + bit x2 + bit x3 + bit x4 + bit x5 := by
  decide +kernel

theorem edges_t6 :
    (9 < 12 ∧ 12 < 36 ∧ 12 * 36 = 9 * (12 + 36)) ∧ (12 < 20 ∧ 20 < 30 ∧ 20 * 30 = 12 * (20 + 30)) ∧ (12 < 21 ∧ 21 < 28 ∧ 21 * 28 = 12 * (21 + 28)) ∧ (20 < 28 ∧ 28 < 70 ∧ 28 * 70 = 20 * (28 + 70)) ∧ (21 < 30 ∧ 30 < 70 ∧ 30 * 70 = 21 * (30 + 70)) ∧ (20 < 36 ∧ 36 < 45 ∧ 36 * 45 = 20 * (36 + 45)) := by
  decide +kernel

theorem cell_t6_0 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x6) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x1 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x4 + bit x8) ∧ (1 ≤ bit x3 + bit x5 + bit x8) ∧ (1 ≤ bit x2 + bit x6 + bit x7)) → (x3 = false ∧ x5 = false ∧ x8 = false) → False := by
  decide +kernel

theorem cell_t6_1 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x6) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x1 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x4 + bit x8) ∧ (1 ≤ bit x3 + bit x5 + bit x8) ∧ (1 ≤ bit x2 + bit x6 + bit x7)) → (x3 = true ∧ x5 = false ∧ x8 = false) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x4 + bit x6 + bit x7 := by
  decide +kernel

theorem cell_t6_2 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x6) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x1 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x4 + bit x8) ∧ (1 ≤ bit x3 + bit x5 + bit x8) ∧ (1 ≤ bit x2 + bit x6 + bit x7)) → (x3 = false ∧ x5 = true ∧ x8 = false) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x4 + bit x6 + bit x7 := by
  decide +kernel

theorem cell_t6_3 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x6) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x1 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x4 + bit x8) ∧ (1 ≤ bit x3 + bit x5 + bit x8) ∧ (1 ≤ bit x2 + bit x6 + bit x7)) → (x3 = true ∧ x5 = true ∧ x8 = false) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x4 + bit x6 + bit x7 := by
  decide +kernel

theorem cell_t6_4 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x6) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x1 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x4 + bit x8) ∧ (1 ≤ bit x3 + bit x5 + bit x8) ∧ (1 ≤ bit x2 + bit x6 + bit x7)) → (x3 = false ∧ x5 = false ∧ x8 = true) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x4 + bit x6 + bit x7 := by
  decide +kernel

theorem cell_t6_5 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x6) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x1 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x4 + bit x8) ∧ (1 ≤ bit x3 + bit x5 + bit x8) ∧ (1 ≤ bit x2 + bit x6 + bit x7)) → (x3 = true ∧ x5 = false ∧ x8 = true) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x4 + bit x6 + bit x7 := by
  decide +kernel

theorem cell_t6_6 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x6) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x1 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x4 + bit x8) ∧ (1 ≤ bit x3 + bit x5 + bit x8) ∧ (1 ≤ bit x2 + bit x6 + bit x7)) → (x3 = false ∧ x5 = true ∧ x8 = true) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x4 + bit x6 + bit x7 := by
  decide +kernel

theorem cell_t6_7 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x6) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x1 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x4 + bit x8) ∧ (1 ≤ bit x3 + bit x5 + bit x8) ∧ (1 ≤ bit x2 + bit x6 + bit x7)) → (x3 = true ∧ x5 = true ∧ x8 = true) → 1 ≤ bit x0 + bit x1 + bit x2 + bit x4 + bit x6 + bit x7 := by
  decide +kernel

theorem edges_t7 :
    (115 < 140 ∧ 140 < 644 ∧ 140 * 644 = 115 * (140 + 644)) ∧ (140 < 189 ∧ 189 < 540 ∧ 189 * 540 = 140 * (189 + 540)) ∧ (140 < 252 ∧ 252 < 315 ∧ 252 * 315 = 140 * (252 + 315)) ∧ (189 < 252 ∧ 252 < 756 ∧ 252 * 756 = 189 * (252 + 756)) ∧ (252 < 414 ∧ 414 < 644 ∧ 414 * 644 = 252 * (414 + 644)) ∧ (315 < 540 ∧ 540 < 756 ∧ 540 * 756 = 315 * (540 + 756)) := by
  decide +kernel

theorem cell_t7_0 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x7) ∧ (1 ≤ bit x1 + bit x2 + bit x6) ∧ (1 ≤ bit x1 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x3 + bit x8) ∧ (1 ≤ bit x3 + bit x5 + bit x7) ∧ (1 ≤ bit x4 + bit x6 + bit x8)) → (x4 = false ∧ x6 = false ∧ x8 = false) → False := by
  decide +kernel

theorem cell_t7_1 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x7) ∧ (1 ≤ bit x1 + bit x2 + bit x6) ∧ (1 ≤ bit x1 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x3 + bit x8) ∧ (1 ≤ bit x3 + bit x5 + bit x7) ∧ (1 ≤ bit x4 + bit x6 + bit x8)) → (x4 = true ∧ x6 = false ∧ x8 = false) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x3 + bit x5 + bit x7 := by
  decide +kernel

theorem cell_t7_2 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x7) ∧ (1 ≤ bit x1 + bit x2 + bit x6) ∧ (1 ≤ bit x1 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x3 + bit x8) ∧ (1 ≤ bit x3 + bit x5 + bit x7) ∧ (1 ≤ bit x4 + bit x6 + bit x8)) → (x4 = false ∧ x6 = true ∧ x8 = false) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x3 + bit x5 + bit x7 := by
  decide +kernel

theorem cell_t7_3 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x7) ∧ (1 ≤ bit x1 + bit x2 + bit x6) ∧ (1 ≤ bit x1 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x3 + bit x8) ∧ (1 ≤ bit x3 + bit x5 + bit x7) ∧ (1 ≤ bit x4 + bit x6 + bit x8)) → (x4 = true ∧ x6 = true ∧ x8 = false) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x3 + bit x5 + bit x7 := by
  decide +kernel

theorem cell_t7_4 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x7) ∧ (1 ≤ bit x1 + bit x2 + bit x6) ∧ (1 ≤ bit x1 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x3 + bit x8) ∧ (1 ≤ bit x3 + bit x5 + bit x7) ∧ (1 ≤ bit x4 + bit x6 + bit x8)) → (x4 = false ∧ x6 = false ∧ x8 = true) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x3 + bit x5 + bit x7 := by
  decide +kernel

theorem cell_t7_5 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x7) ∧ (1 ≤ bit x1 + bit x2 + bit x6) ∧ (1 ≤ bit x1 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x3 + bit x8) ∧ (1 ≤ bit x3 + bit x5 + bit x7) ∧ (1 ≤ bit x4 + bit x6 + bit x8)) → (x4 = true ∧ x6 = false ∧ x8 = true) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x3 + bit x5 + bit x7 := by
  decide +kernel

theorem cell_t7_6 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x7) ∧ (1 ≤ bit x1 + bit x2 + bit x6) ∧ (1 ≤ bit x1 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x3 + bit x8) ∧ (1 ≤ bit x3 + bit x5 + bit x7) ∧ (1 ≤ bit x4 + bit x6 + bit x8)) → (x4 = false ∧ x6 = true ∧ x8 = true) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x3 + bit x5 + bit x7 := by
  decide +kernel

theorem cell_t7_7 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x7) ∧ (1 ≤ bit x1 + bit x2 + bit x6) ∧ (1 ≤ bit x1 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x3 + bit x8) ∧ (1 ≤ bit x3 + bit x5 + bit x7) ∧ (1 ≤ bit x4 + bit x6 + bit x8)) → (x4 = true ∧ x6 = true ∧ x8 = true) → 1 ≤ bit x0 + bit x1 + bit x2 + bit x3 + bit x5 + bit x7 := by
  decide +kernel

theorem edges_t8 :
    (72 < 99 ∧ 99 < 264 ∧ 99 * 264 = 72 * (99 + 264)) ∧ (72 < 120 ∧ 120 < 180 ∧ 120 * 180 = 72 * (120 + 180)) ∧ (99 < 180 ∧ 180 < 220 ∧ 180 * 220 = 99 * (180 + 220)) ∧ (120 < 195 ∧ 195 < 312 ∧ 195 * 312 = 120 * (195 + 312)) ∧ (120 < 220 ∧ 220 < 264 ∧ 220 * 264 = 120 * (220 + 264)) ∧ (143 < 264 ∧ 264 < 312 ∧ 264 * 312 = 143 * (264 + 312)) := by
  decide +kernel

theorem cell_t8_0 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x7) ∧ (1 ≤ bit x0 + bit x2 + bit x4) ∧ (1 ≤ bit x1 + bit x4 + bit x6) ∧ (1 ≤ bit x2 + bit x5 + bit x8) ∧ (1 ≤ bit x2 + bit x6 + bit x7) ∧ (1 ≤ bit x3 + bit x7 + bit x8)) → (x1 = false ∧ x4 = false ∧ x6 = false) → False := by
  decide +kernel

theorem cell_t8_1 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x7) ∧ (1 ≤ bit x0 + bit x2 + bit x4) ∧ (1 ≤ bit x1 + bit x4 + bit x6) ∧ (1 ≤ bit x2 + bit x5 + bit x8) ∧ (1 ≤ bit x2 + bit x6 + bit x7) ∧ (1 ≤ bit x3 + bit x7 + bit x8)) → (x1 = true ∧ x4 = false ∧ x6 = false) → 2 ≤ bit x0 + bit x2 + bit x3 + bit x5 + bit x7 + bit x8 := by
  decide +kernel

theorem cell_t8_2 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x7) ∧ (1 ≤ bit x0 + bit x2 + bit x4) ∧ (1 ≤ bit x1 + bit x4 + bit x6) ∧ (1 ≤ bit x2 + bit x5 + bit x8) ∧ (1 ≤ bit x2 + bit x6 + bit x7) ∧ (1 ≤ bit x3 + bit x7 + bit x8)) → (x1 = false ∧ x4 = true ∧ x6 = false) → 2 ≤ bit x0 + bit x2 + bit x3 + bit x5 + bit x7 + bit x8 := by
  decide +kernel

theorem cell_t8_3 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x7) ∧ (1 ≤ bit x0 + bit x2 + bit x4) ∧ (1 ≤ bit x1 + bit x4 + bit x6) ∧ (1 ≤ bit x2 + bit x5 + bit x8) ∧ (1 ≤ bit x2 + bit x6 + bit x7) ∧ (1 ≤ bit x3 + bit x7 + bit x8)) → (x1 = true ∧ x4 = true ∧ x6 = false) → 2 ≤ bit x0 + bit x2 + bit x3 + bit x5 + bit x7 + bit x8 := by
  decide +kernel

theorem cell_t8_4 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x7) ∧ (1 ≤ bit x0 + bit x2 + bit x4) ∧ (1 ≤ bit x1 + bit x4 + bit x6) ∧ (1 ≤ bit x2 + bit x5 + bit x8) ∧ (1 ≤ bit x2 + bit x6 + bit x7) ∧ (1 ≤ bit x3 + bit x7 + bit x8)) → (x1 = false ∧ x4 = false ∧ x6 = true) → 2 ≤ bit x0 + bit x2 + bit x3 + bit x5 + bit x7 + bit x8 := by
  decide +kernel

theorem cell_t8_5 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x7) ∧ (1 ≤ bit x0 + bit x2 + bit x4) ∧ (1 ≤ bit x1 + bit x4 + bit x6) ∧ (1 ≤ bit x2 + bit x5 + bit x8) ∧ (1 ≤ bit x2 + bit x6 + bit x7) ∧ (1 ≤ bit x3 + bit x7 + bit x8)) → (x1 = true ∧ x4 = false ∧ x6 = true) → 2 ≤ bit x0 + bit x2 + bit x3 + bit x5 + bit x7 + bit x8 := by
  decide +kernel

theorem cell_t8_6 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x7) ∧ (1 ≤ bit x0 + bit x2 + bit x4) ∧ (1 ≤ bit x1 + bit x4 + bit x6) ∧ (1 ≤ bit x2 + bit x5 + bit x8) ∧ (1 ≤ bit x2 + bit x6 + bit x7) ∧ (1 ≤ bit x3 + bit x7 + bit x8)) → (x1 = false ∧ x4 = true ∧ x6 = true) → 2 ≤ bit x0 + bit x2 + bit x3 + bit x5 + bit x7 + bit x8 := by
  decide +kernel

theorem cell_t8_7 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x7) ∧ (1 ≤ bit x0 + bit x2 + bit x4) ∧ (1 ≤ bit x1 + bit x4 + bit x6) ∧ (1 ≤ bit x2 + bit x5 + bit x8) ∧ (1 ≤ bit x2 + bit x6 + bit x7) ∧ (1 ≤ bit x3 + bit x7 + bit x8)) → (x1 = true ∧ x4 = true ∧ x6 = true) → 1 ≤ bit x0 + bit x2 + bit x3 + bit x5 + bit x7 + bit x8 := by
  decide +kernel

theorem edges_potential_A :
    (2 < 3 ∧ 3 < 6 ∧ 3 * 6 = 2 * (3 + 6)) ∧ (3 < 4 ∧ 4 < 12 ∧ 4 * 12 = 3 * (4 + 12)) ∧ (4 < 6 ∧ 6 < 12 ∧ 6 * 12 = 4 * (6 + 12)) := by
  decide +kernel

theorem cell_potential_A_0 :
    ∀ x0 x1 x2 x3 x4 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x3) ∧ (1 ≤ bit x1 + bit x2 + bit x4) ∧ (1 ≤ bit x2 + bit x3 + bit x4)) → (x2 = false ∧ x4 = false) → 2 ≤ bit x0 + bit x1 + bit x3 := by
  decide +kernel

theorem cell_potential_A_1 :
    ∀ x0 x1 x2 x3 x4 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x3) ∧ (1 ≤ bit x1 + bit x2 + bit x4) ∧ (1 ≤ bit x2 + bit x3 + bit x4)) → (x2 = true ∧ x4 = false) → 1 ≤ bit x0 + bit x1 + bit x3 := by
  decide +kernel

theorem cell_potential_A_2 :
    ∀ x0 x1 x2 x3 x4 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x3) ∧ (1 ≤ bit x1 + bit x2 + bit x4) ∧ (1 ≤ bit x2 + bit x3 + bit x4)) → (x2 = false ∧ x4 = true) → 1 ≤ bit x0 + bit x1 + bit x3 := by
  decide +kernel

theorem cell_potential_A_3 :
    ∀ x0 x1 x2 x3 x4 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x3) ∧ (1 ≤ bit x1 + bit x2 + bit x4) ∧ (1 ≤ bit x2 + bit x3 + bit x4)) → (x2 = true ∧ x4 = true) → 1 ≤ bit x0 + bit x1 + bit x3 := by
  decide +kernel

theorem edges_potential_B :
    (4 < 5 ∧ 5 < 20 ∧ 5 * 20 = 4 * (5 + 20)) ∧ (12 < 20 ∧ 20 < 30 ∧ 20 * 30 = 12 * (20 + 30)) := by
  decide +kernel

theorem cell_potential_B_0 :
    ∀ x0 x1 x2 x3 x4 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x3) ∧ (1 ≤ bit x2 + bit x3 + bit x4)) → (x0 = false ∧ x2 = false) → 1 ≤ bit x1 + bit x3 + bit x4 := by
  decide +kernel

theorem cell_potential_B_1 :
    ∀ x0 x1 x2 x3 x4 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x3) ∧ (1 ≤ bit x2 + bit x3 + bit x4)) → (x0 = true ∧ x2 = false) → 1 ≤ bit x1 + bit x3 + bit x4 := by
  decide +kernel

theorem cell_potential_B_2 :
    ∀ x0 x1 x2 x3 x4 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x3) ∧ (1 ≤ bit x2 + bit x3 + bit x4)) → (x0 = false ∧ x2 = true) → 1 ≤ bit x1 + bit x3 + bit x4 := by
  decide +kernel

theorem cell_potential_B_3 :
    ∀ x0 x1 x2 x3 x4 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x3) ∧ (1 ≤ bit x2 + bit x3 + bit x4)) → (x0 = true ∧ x2 = true) → 0 ≤ bit x1 + bit x3 + bit x4 := by
  decide +kernel

theorem edges_family_p4 :
    (3 < 4 ∧ 4 < 12 ∧ 4 * 12 = 3 * (4 + 12)) ∧ (4 < 5 ∧ 5 < 20 ∧ 5 * 20 = 4 * (5 + 20)) ∧ (12 < 16 ∧ 16 < 48 ∧ 16 * 48 = 12 * (16 + 48)) ∧ (12 < 20 ∧ 20 < 30 ∧ 20 * 30 = 12 * (20 + 30)) ∧ (16 < 20 ∧ 20 < 80 ∧ 20 * 80 = 16 * (20 + 80)) ∧ (30 < 48 ∧ 48 < 80 ∧ 48 * 80 = 30 * (48 + 80)) := by
  decide +kernel

theorem cell_family_p4_0 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x3) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x3 + bit x4 + bit x7) ∧ (1 ≤ bit x3 + bit x5 + bit x6) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x6 + bit x7 + bit x8)) → (x6 = false ∧ x7 = false ∧ x8 = false) → False := by
  decide +kernel

theorem cell_family_p4_1 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x3) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x3 + bit x4 + bit x7) ∧ (1 ≤ bit x3 + bit x5 + bit x6) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x6 + bit x7 + bit x8)) → (x6 = true ∧ x7 = false ∧ x8 = false) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x3 + bit x4 + bit x5 := by
  decide +kernel

theorem cell_family_p4_2 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x3) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x3 + bit x4 + bit x7) ∧ (1 ≤ bit x3 + bit x5 + bit x6) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x6 + bit x7 + bit x8)) → (x6 = false ∧ x7 = true ∧ x8 = false) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x3 + bit x4 + bit x5 := by
  decide +kernel

theorem cell_family_p4_3 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x3) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x3 + bit x4 + bit x7) ∧ (1 ≤ bit x3 + bit x5 + bit x6) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x6 + bit x7 + bit x8)) → (x6 = true ∧ x7 = true ∧ x8 = false) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x3 + bit x4 + bit x5 := by
  decide +kernel

theorem cell_family_p4_4 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x3) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x3 + bit x4 + bit x7) ∧ (1 ≤ bit x3 + bit x5 + bit x6) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x6 + bit x7 + bit x8)) → (x6 = false ∧ x7 = false ∧ x8 = true) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x3 + bit x4 + bit x5 := by
  decide +kernel

theorem cell_family_p4_5 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x3) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x3 + bit x4 + bit x7) ∧ (1 ≤ bit x3 + bit x5 + bit x6) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x6 + bit x7 + bit x8)) → (x6 = true ∧ x7 = false ∧ x8 = true) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x3 + bit x4 + bit x5 := by
  decide +kernel

theorem cell_family_p4_6 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x3) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x3 + bit x4 + bit x7) ∧ (1 ≤ bit x3 + bit x5 + bit x6) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x6 + bit x7 + bit x8)) → (x6 = false ∧ x7 = true ∧ x8 = true) → 2 ≤ bit x0 + bit x1 + bit x2 + bit x3 + bit x4 + bit x5 := by
  decide +kernel

theorem cell_family_p4_7 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x3) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x3 + bit x4 + bit x7) ∧ (1 ≤ bit x3 + bit x5 + bit x6) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x6 + bit x7 + bit x8)) → (x6 = true ∧ x7 = true ∧ x8 = true) → 1 ≤ bit x0 + bit x1 + bit x2 + bit x3 + bit x4 + bit x5 := by
  decide +kernel

theorem inequality_weighted_0 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x8) ∧ (1 ≤ bit x0 + bit x2 + bit x4) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x2 + bit x3 + bit x6) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x4 + bit x6 + bit x7)) → (5 : Int) ≤ (1 : Int) * (bit x0 : Int) + (1 : Int) * (bit x1 : Int) + (2 : Int) * (bit x2 : Int) + (2 : Int) * (bit x3 : Int) + (2 : Int) * (bit x4 : Int) + (2 : Int) * (bit x5 : Int) + (2 : Int) * (bit x6 : Int) + (2 : Int) * (bit x7 : Int) + (1 : Int) * (bit x8 : Int) := by
  decide +kernel

theorem inequality_weighted_1 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x4) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x2 + bit x3 + bit x8) ∧ (1 ≤ bit x2 + bit x4 + bit x7) ∧ (1 ≤ bit x3 + bit x6 + bit x7) ∧ (1 ≤ bit x4 + bit x6 + bit x8)) → (5 : Int) ≤ (2 : Int) * (bit x0 : Int) + (2 : Int) * (bit x1 : Int) + (2 : Int) * (bit x2 : Int) + (1 : Int) * (bit x3 : Int) + (2 : Int) * (bit x4 : Int) + (2 : Int) * (bit x5 : Int) + (1 : Int) * (bit x6 : Int) + (1 : Int) * (bit x7 : Int) + (2 : Int) * (bit x8 : Int) := by
  decide +kernel

theorem inequality_weighted_2 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x5) ∧ (1 ≤ bit x1 + bit x2 + bit x6) ∧ (1 ≤ bit x1 + bit x3 + bit x5) ∧ (1 ≤ bit x2 + bit x3 + bit x8) ∧ (1 ≤ bit x3 + bit x4 + bit x7) ∧ (1 ≤ bit x4 + bit x5 + bit x7) ∧ (1 ≤ bit x5 + bit x6 + bit x8)) → (4 : Int) ≤ (1 : Int) * (bit x0 : Int) + (1 : Int) * (bit x1 : Int) + (1 : Int) * (bit x2 : Int) + (1 : Int) * (bit x3 : Int) + (1 : Int) * (bit x4 : Int) + (2 : Int) * (bit x5 : Int) + (1 : Int) * (bit x6 : Int) + (1 : Int) * (bit x7 : Int) + (2 : Int) * (bit x8 : Int) := by
  decide +kernel

theorem inequality_weighted_3 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x8) ∧ (1 ≤ bit x1 + bit x2 + bit x6) ∧ (1 ≤ bit x1 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x3 + bit x7) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x4 + bit x6 + bit x7)) → (5 : Int) ≤ (2 : Int) * (bit x0 : Int) + (2 : Int) * (bit x1 : Int) + (1 : Int) * (bit x2 : Int) + (1 : Int) * (bit x3 : Int) + (2 : Int) * (bit x4 : Int) + (2 : Int) * (bit x5 : Int) + (2 : Int) * (bit x6 : Int) + (1 : Int) * (bit x7 : Int) + (2 : Int) * (bit x8 : Int) := by
  decide +kernel

theorem inequality_weighted_4 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x6) ∧ (1 ≤ bit x0 + bit x2 + bit x5) ∧ (1 ≤ bit x1 + bit x2 + bit x6) ∧ (1 ≤ bit x0 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x4 + bit x7) ∧ (1 ≤ bit x2 + bit x5 + bit x6) ∧ (1 ≤ bit x3 + bit x5 + bit x7)) → (5 : Int) ≤ (2 : Int) * (bit x0 : Int) + (2 : Int) * (bit x1 : Int) + (2 : Int) * (bit x2 : Int) + (1 : Int) * (bit x3 : Int) + (2 : Int) * (bit x4 : Int) + (1 : Int) * (bit x5 : Int) + (2 : Int) * (bit x6 : Int) + (1 : Int) * (bit x7 : Int) := by
  decide +kernel

theorem inequality_weighted_5 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x3) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x3 + bit x4 + bit x7) ∧ (1 ≤ bit x3 + bit x5 + bit x6) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x6 + bit x7 + bit x8)) → (5 : Int) ≤ (2 : Int) * (bit x0 : Int) + (2 : Int) * (bit x1 : Int) + (2 : Int) * (bit x2 : Int) + (2 : Int) * (bit x3 : Int) + (2 : Int) * (bit x4 : Int) + (2 : Int) * (bit x5 : Int) + (1 : Int) * (bit x6 : Int) + (1 : Int) * (bit x7 : Int) + (1 : Int) * (bit x8 : Int) := by
  decide +kernel

theorem inequality_weighted_6 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x6) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x1 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x4 + bit x8) ∧ (1 ≤ bit x3 + bit x5 + bit x8) ∧ (1 ≤ bit x2 + bit x6 + bit x7)) → (5 : Int) ≤ (2 : Int) * (bit x0 : Int) + (2 : Int) * (bit x1 : Int) + (2 : Int) * (bit x2 : Int) + (1 : Int) * (bit x3 : Int) + (2 : Int) * (bit x4 : Int) + (1 : Int) * (bit x5 : Int) + (2 : Int) * (bit x6 : Int) + (2 : Int) * (bit x7 : Int) + (1 : Int) * (bit x8 : Int) := by
  decide +kernel

theorem inequality_weighted_7 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x7) ∧ (1 ≤ bit x1 + bit x2 + bit x6) ∧ (1 ≤ bit x1 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x3 + bit x8) ∧ (1 ≤ bit x3 + bit x5 + bit x7) ∧ (1 ≤ bit x4 + bit x6 + bit x8)) → (5 : Int) ≤ (2 : Int) * (bit x0 : Int) + (2 : Int) * (bit x1 : Int) + (2 : Int) * (bit x2 : Int) + (2 : Int) * (bit x3 : Int) + (1 : Int) * (bit x4 : Int) + (2 : Int) * (bit x5 : Int) + (1 : Int) * (bit x6 : Int) + (2 : Int) * (bit x7 : Int) + (1 : Int) * (bit x8 : Int) := by
  decide +kernel

theorem inequality_weighted_8 :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x7) ∧ (1 ≤ bit x0 + bit x2 + bit x4) ∧ (1 ≤ bit x1 + bit x4 + bit x6) ∧ (1 ≤ bit x2 + bit x5 + bit x8) ∧ (1 ≤ bit x2 + bit x6 + bit x7) ∧ (1 ≤ bit x3 + bit x7 + bit x8)) → (5 : Int) ≤ (2 : Int) * (bit x0 : Int) + (1 : Int) * (bit x1 : Int) + (2 : Int) * (bit x2 : Int) + (2 : Int) * (bit x3 : Int) + (1 : Int) * (bit x4 : Int) + (2 : Int) * (bit x5 : Int) + (1 : Int) * (bit x6 : Int) + (2 : Int) * (bit x7 : Int) + (2 : Int) * (bit x8 : Int) := by
  decide +kernel

theorem inequality_potential_left :
    ∀ x0 x1 x2 x3 x4 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x3) ∧ (1 ≤ bit x1 + bit x2 + bit x4) ∧ (1 ≤ bit x2 + bit x3 + bit x4)) → (2 : Int) ≤ (1 : Int) * (bit x0 : Int) + (1 : Int) * (bit x1 : Int) + (1 : Int) * (bit x2 : Int) + (1 : Int) * (bit x3 : Int) + (1 : Int) * (bit x4 : Int) + (-1 : Int) * ((bit x2 : Int) * (bit x4 : Int)) := by
  decide +kernel

theorem inequality_potential_right :
    ∀ x0 x1 x2 x3 x4 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x3) ∧ (1 ≤ bit x2 + bit x3 + bit x4)) → (1 : Int) ≤ (1 : Int) * (bit x1 : Int) + (1 : Int) * (bit x3 : Int) + (1 : Int) * (bit x4 : Int) + (1 : Int) * ((bit x0 : Int) * (bit x2 : Int)) := by
  decide +kernel

theorem inequality_family_p4_weighted :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x3) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x3 + bit x4 + bit x7) ∧ (1 ≤ bit x3 + bit x5 + bit x6) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x6 + bit x7 + bit x8)) → (5 : Int) ≤ (2 : Int) * (bit x0 : Int) + (2 : Int) * (bit x1 : Int) + (2 : Int) * (bit x2 : Int) + (2 : Int) * (bit x3 : Int) + (2 : Int) * (bit x4 : Int) + (2 : Int) * (bit x5 : Int) + (1 : Int) * (bit x6 : Int) + (1 : Int) * (bit x7 : Int) + (1 : Int) * (bit x8 : Int) := by
  decide +kernel

theorem inequality_potential_cancelled :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x4) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x2 + bit x3 + bit x6) ∧ (1 ≤ bit x2 + bit x4 + bit x5) ∧ (1 ≤ bit x3 + bit x4 + bit x7) ∧ (1 ≤ bit x5 + bit x6 + bit x7)) → (3 : Int) ≤ (1 : Int) * (bit x0 : Int) + (1 : Int) * (bit x1 : Int) + (1 : Int) * (bit x2 : Int) + (1 : Int) * (bit x3 : Int) + (1 : Int) * (bit x4 : Int) + (1 : Int) * (bit x5 : Int) + (1 : Int) * (bit x6 : Int) + (1 : Int) * (bit x7 : Int) := by
  decide +kernel

theorem inequality_weighted_0_cardinality :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x8) ∧ (1 ≤ bit x0 + bit x2 + bit x4) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x2 + bit x3 + bit x6) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x4 + bit x6 + bit x7)) → (3 : Int) ≤ (1 : Int) * (bit x0 : Int) + (1 : Int) * (bit x1 : Int) + (1 : Int) * (bit x2 : Int) + (1 : Int) * (bit x3 : Int) + (1 : Int) * (bit x4 : Int) + (1 : Int) * (bit x5 : Int) + (1 : Int) * (bit x6 : Int) + (1 : Int) * (bit x7 : Int) + (1 : Int) * (bit x8 : Int) := by
  decide +kernel

theorem inequality_weighted_1_cardinality :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x4) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x2 + bit x3 + bit x8) ∧ (1 ≤ bit x2 + bit x4 + bit x7) ∧ (1 ≤ bit x3 + bit x6 + bit x7) ∧ (1 ≤ bit x4 + bit x6 + bit x8)) → (3 : Int) ≤ (1 : Int) * (bit x0 : Int) + (1 : Int) * (bit x1 : Int) + (1 : Int) * (bit x2 : Int) + (1 : Int) * (bit x3 : Int) + (1 : Int) * (bit x4 : Int) + (1 : Int) * (bit x5 : Int) + (1 : Int) * (bit x6 : Int) + (1 : Int) * (bit x7 : Int) + (1 : Int) * (bit x8 : Int) := by
  decide +kernel

theorem inequality_weighted_2_cardinality :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x5) ∧ (1 ≤ bit x1 + bit x2 + bit x6) ∧ (1 ≤ bit x1 + bit x3 + bit x5) ∧ (1 ≤ bit x2 + bit x3 + bit x8) ∧ (1 ≤ bit x3 + bit x4 + bit x7) ∧ (1 ≤ bit x4 + bit x5 + bit x7) ∧ (1 ≤ bit x5 + bit x6 + bit x8)) → (2 : Int) ≤ (1 : Int) * (bit x0 : Int) + (1 : Int) * (bit x1 : Int) + (1 : Int) * (bit x2 : Int) + (1 : Int) * (bit x3 : Int) + (1 : Int) * (bit x4 : Int) + (1 : Int) * (bit x5 : Int) + (1 : Int) * (bit x6 : Int) + (1 : Int) * (bit x7 : Int) + (1 : Int) * (bit x8 : Int) := by
  decide +kernel

theorem inequality_weighted_3_cardinality :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x8) ∧ (1 ≤ bit x1 + bit x2 + bit x6) ∧ (1 ≤ bit x1 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x3 + bit x7) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x4 + bit x6 + bit x7)) → (3 : Int) ≤ (1 : Int) * (bit x0 : Int) + (1 : Int) * (bit x1 : Int) + (1 : Int) * (bit x2 : Int) + (1 : Int) * (bit x3 : Int) + (1 : Int) * (bit x4 : Int) + (1 : Int) * (bit x5 : Int) + (1 : Int) * (bit x6 : Int) + (1 : Int) * (bit x7 : Int) + (1 : Int) * (bit x8 : Int) := by
  decide +kernel

theorem inequality_weighted_4_cardinality :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x6) ∧ (1 ≤ bit x0 + bit x2 + bit x5) ∧ (1 ≤ bit x1 + bit x2 + bit x6) ∧ (1 ≤ bit x0 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x4 + bit x7) ∧ (1 ≤ bit x2 + bit x5 + bit x6) ∧ (1 ≤ bit x3 + bit x5 + bit x7)) → (3 : Int) ≤ (1 : Int) * (bit x0 : Int) + (1 : Int) * (bit x1 : Int) + (1 : Int) * (bit x2 : Int) + (1 : Int) * (bit x3 : Int) + (1 : Int) * (bit x4 : Int) + (1 : Int) * (bit x5 : Int) + (1 : Int) * (bit x6 : Int) + (1 : Int) * (bit x7 : Int) := by
  decide +kernel

theorem inequality_weighted_5_cardinality :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x3) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x3 + bit x4 + bit x7) ∧ (1 ≤ bit x3 + bit x5 + bit x6) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x6 + bit x7 + bit x8)) → (3 : Int) ≤ (1 : Int) * (bit x0 : Int) + (1 : Int) * (bit x1 : Int) + (1 : Int) * (bit x2 : Int) + (1 : Int) * (bit x3 : Int) + (1 : Int) * (bit x4 : Int) + (1 : Int) * (bit x5 : Int) + (1 : Int) * (bit x6 : Int) + (1 : Int) * (bit x7 : Int) + (1 : Int) * (bit x8 : Int) := by
  decide +kernel

theorem inequality_weighted_6_cardinality :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x6) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x1 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x4 + bit x8) ∧ (1 ≤ bit x3 + bit x5 + bit x8) ∧ (1 ≤ bit x2 + bit x6 + bit x7)) → (3 : Int) ≤ (1 : Int) * (bit x0 : Int) + (1 : Int) * (bit x1 : Int) + (1 : Int) * (bit x2 : Int) + (1 : Int) * (bit x3 : Int) + (1 : Int) * (bit x4 : Int) + (1 : Int) * (bit x5 : Int) + (1 : Int) * (bit x6 : Int) + (1 : Int) * (bit x7 : Int) + (1 : Int) * (bit x8 : Int) := by
  decide +kernel

theorem inequality_weighted_7_cardinality :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x7) ∧ (1 ≤ bit x1 + bit x2 + bit x6) ∧ (1 ≤ bit x1 + bit x3 + bit x4) ∧ (1 ≤ bit x2 + bit x3 + bit x8) ∧ (1 ≤ bit x3 + bit x5 + bit x7) ∧ (1 ≤ bit x4 + bit x6 + bit x8)) → (3 : Int) ≤ (1 : Int) * (bit x0 : Int) + (1 : Int) * (bit x1 : Int) + (1 : Int) * (bit x2 : Int) + (1 : Int) * (bit x3 : Int) + (1 : Int) * (bit x4 : Int) + (1 : Int) * (bit x5 : Int) + (1 : Int) * (bit x6 : Int) + (1 : Int) * (bit x7 : Int) + (1 : Int) * (bit x8 : Int) := by
  decide +kernel

theorem inequality_weighted_8_cardinality :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x7) ∧ (1 ≤ bit x0 + bit x2 + bit x4) ∧ (1 ≤ bit x1 + bit x4 + bit x6) ∧ (1 ≤ bit x2 + bit x5 + bit x8) ∧ (1 ≤ bit x2 + bit x6 + bit x7) ∧ (1 ≤ bit x3 + bit x7 + bit x8)) → (3 : Int) ≤ (1 : Int) * (bit x0 : Int) + (1 : Int) * (bit x1 : Int) + (1 : Int) * (bit x2 : Int) + (1 : Int) * (bit x3 : Int) + (1 : Int) * (bit x4 : Int) + (1 : Int) * (bit x5 : Int) + (1 : Int) * (bit x6 : Int) + (1 : Int) * (bit x7 : Int) + (1 : Int) * (bit x8 : Int) := by
  decide +kernel

theorem inequality_family_p4_weighted_cardinality :
    ∀ x0 x1 x2 x3 x4 x5 x6 x7 x8 : Bool,
    ((1 ≤ bit x0 + bit x1 + bit x3) ∧ (1 ≤ bit x1 + bit x2 + bit x5) ∧ (1 ≤ bit x3 + bit x4 + bit x7) ∧ (1 ≤ bit x3 + bit x5 + bit x6) ∧ (1 ≤ bit x4 + bit x5 + bit x8) ∧ (1 ≤ bit x6 + bit x7 + bit x8)) → (3 : Int) ≤ (1 : Int) * (bit x0 : Int) + (1 : Int) * (bit x1 : Int) + (1 : Int) * (bit x2 : Int) + (1 : Int) * (bit x3 : Int) + (1 : Int) * (bit x4 : Int) + (1 : Int) * (bit x5 : Int) + (1 : Int) * (bit x6 : Int) + (1 : Int) * (bit x7 : Int) + (1 : Int) * (bit x8 : Int) := by
  decide +kernel

#print axioms edges_t0
#print axioms cell_t0_0
#print axioms cell_t0_1
#print axioms cell_t0_2
#print axioms cell_t0_3
#print axioms cell_t0_4
#print axioms cell_t0_5
#print axioms cell_t0_6
#print axioms cell_t0_7
#print axioms edges_t1
#print axioms cell_t1_0
#print axioms cell_t1_1
#print axioms cell_t1_2
#print axioms cell_t1_3
#print axioms cell_t1_4
#print axioms cell_t1_5
#print axioms cell_t1_6
#print axioms cell_t1_7
#print axioms edges_t2
#print axioms cell_t2_0
#print axioms cell_t2_1
#print axioms cell_t2_2
#print axioms cell_t2_3
#print axioms edges_t3
#print axioms cell_t3_0
#print axioms cell_t3_1
#print axioms cell_t3_2
#print axioms cell_t3_3
#print axioms cell_t3_4
#print axioms cell_t3_5
#print axioms cell_t3_6
#print axioms cell_t3_7
#print axioms edges_t4
#print axioms cell_t4_0
#print axioms cell_t4_1
#print axioms cell_t4_2
#print axioms cell_t4_3
#print axioms cell_t4_4
#print axioms cell_t4_5
#print axioms cell_t4_6
#print axioms cell_t4_7
#print axioms edges_t5
#print axioms cell_t5_0
#print axioms cell_t5_1
#print axioms cell_t5_2
#print axioms cell_t5_3
#print axioms cell_t5_4
#print axioms cell_t5_5
#print axioms cell_t5_6
#print axioms cell_t5_7
#print axioms edges_t6
#print axioms cell_t6_0
#print axioms cell_t6_1
#print axioms cell_t6_2
#print axioms cell_t6_3
#print axioms cell_t6_4
#print axioms cell_t6_5
#print axioms cell_t6_6
#print axioms cell_t6_7
#print axioms edges_t7
#print axioms cell_t7_0
#print axioms cell_t7_1
#print axioms cell_t7_2
#print axioms cell_t7_3
#print axioms cell_t7_4
#print axioms cell_t7_5
#print axioms cell_t7_6
#print axioms cell_t7_7
#print axioms edges_t8
#print axioms cell_t8_0
#print axioms cell_t8_1
#print axioms cell_t8_2
#print axioms cell_t8_3
#print axioms cell_t8_4
#print axioms cell_t8_5
#print axioms cell_t8_6
#print axioms cell_t8_7
#print axioms edges_potential_A
#print axioms cell_potential_A_0
#print axioms cell_potential_A_1
#print axioms cell_potential_A_2
#print axioms cell_potential_A_3
#print axioms edges_potential_B
#print axioms cell_potential_B_0
#print axioms cell_potential_B_1
#print axioms cell_potential_B_2
#print axioms cell_potential_B_3
#print axioms edges_family_p4
#print axioms cell_family_p4_0
#print axioms cell_family_p4_1
#print axioms cell_family_p4_2
#print axioms cell_family_p4_3
#print axioms cell_family_p4_4
#print axioms cell_family_p4_5
#print axioms cell_family_p4_6
#print axioms cell_family_p4_7
#print axioms inequality_weighted_0
#print axioms inequality_weighted_1
#print axioms inequality_weighted_2
#print axioms inequality_weighted_3
#print axioms inequality_weighted_4
#print axioms inequality_weighted_5
#print axioms inequality_weighted_6
#print axioms inequality_weighted_7
#print axioms inequality_weighted_8
#print axioms inequality_potential_left
#print axioms inequality_potential_right
#print axioms inequality_family_p4_weighted
#print axioms inequality_potential_cancelled
#print axioms inequality_weighted_0_cardinality
#print axioms inequality_weighted_1_cardinality
#print axioms inequality_weighted_2_cardinality
#print axioms inequality_weighted_3_cardinality
#print axioms inequality_weighted_4_cardinality
#print axioms inequality_weighted_5_cardinality
#print axioms inequality_weighted_6_cardinality
#print axioms inequality_weighted_7_cardinality
#print axioms inequality_weighted_8_cardinality
#print axioms inequality_family_p4_weighted_cardinality

end Erdos302BoundaryV1
