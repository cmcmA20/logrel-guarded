module STLC.DBFull.Readback where

open import Prelude
open import Data.Empty
open import Data.Nat hiding (_·_)
open import Data.List

open import STLC.DBFull.Term
open import STLC.DBFull.Ty
open import STLC.DBFull.OpSem

-- Converting a de Brujin level to a de Brujin index
lvl→idx : ℕ → ℕ → ℕ
lvl→idx k n = n ∸ suc k

mutual

-- Reading back a normal term
  data _∣_⇑_ : ℕ → Domain → Term → 𝒰 where
    ⇑⟨ƛ⟩  : ∀ {γ n t a v}
         → γ ＋＋ ⟨ lvl n ⟩ⁿᵉ ∣ t ⇓ a
         → n ∣ a ⇑ v
         → n ∣ ⟨ƛ t ⟩ γ ⇑ (ƛ v)
    ⇑ne  : ∀ {n e u}
         → n ∣ e ⇑ⁿᵉ u → n ∣ ⟨ e ⟩ⁿᵉ ⇑ u

-- Reading back a neutral term
  data _∣_⇑ⁿᵉ_ : ℕ → DomainNE → Term → 𝒰 where
    ⇑lvl : ∀ {n k}
         → n ∣ lvl k ⇑ⁿᵉ (` lvl→idx k n)
    ⇑app : ∀ {n e u d v}
         → n ∣ e ⇑ⁿᵉ u
         → n ∣ d ⇑ v
         → n ∣ (e ·ⁿᵉ d) ⇑ⁿᵉ (u · v)
