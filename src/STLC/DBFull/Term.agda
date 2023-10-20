module STLC.DBFull.Term where

open import Prelude
open import Data.Empty
open import Data.Unit
open import Data.Dec
open import Data.String
open import Structures.IdentitySystem

open import Interlude

infix  5 ƛ_
infixl 7 _·_
infix  9 `_

-- terms

data Term : 𝒰 where
  `_  : ℕ → Term
  ƛ_  : Term → Term
  _·_ : Term → Term → Term
