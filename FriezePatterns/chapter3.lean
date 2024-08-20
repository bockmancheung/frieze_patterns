import FriezePatterns.chapter1
import FriezePatterns.chapter2

class arith_fp (f : ℕ × ℕ → ℚ) (n : ℕ) : Prop where
  topBordZeros : ∀ m, f (0,m) = 0
  topBordOnes : ∀ m, f (1,m) = 1
  botBordOnes_n : ∀ m, f (n, m) = 1
  botBordZeros_n : ∀ i, ∀ m,  i ≥ n+1 → (f (i,m) = 0)
  diamond : ∀ i, ∀ m,  i ≤ n-1 → f (i+1,m) * f (i+1,m+1)-1 = f (i+2,m)*f (i,m+1)
  integral: ∀ i, ∀ m, (f (i,m)).den == 1
  positive: ∀ i, ∀ m, 1 ≤ i → i ≤ n → f (i,m) > 0

--def af (f : ℕ×ℕ → ℚ) (n: ℕ) [arith_fp f n] : ℕ :=

def flute_f (f : ℕ×ℕ → ℚ) (n m: ℕ) [arith_fp f n] x :=
  match x with
  | 0   => 1
  | i => f (i%(n-1), m)

theorem friezeToDiag1 (f : ℕ×ℕ → ℚ) (n: ℕ) [arith_fp f n] : 2^3 = 8 := by sorry

def arithFriezePatSet (n: ℕ) : Set (ℕ × ℕ → ℚ) :=
  { f | arith_fp f n}

lemma arithFriezePatSetNonEmpty (n : ℕ) : Nonempty (arithFriezePatSet n) := by sorry


theorem mainTheorem : 2^3 ≤ 8 := by linarith
