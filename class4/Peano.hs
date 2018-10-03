
module Peano where

data N
  = Z
  | S N
  deriving (Show, Read)

plus :: N -> N -> N
plus n Z = n
plus n (S m) = S (plus n m)

{-

plus Z n =

n = Z  done

n = S m

plus Z m = m
plus Z n = plus Z (S m) = S (plus Z m) = S m = n

COQ -- proof assistant

-}
