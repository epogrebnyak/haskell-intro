
import Peano

class ToString a where
  toString :: a -> String
  toString _ = "not defined"

instance ToString N where
  toString Z = "Z"
  toString (S m) = "S " ++ toString m

data List a = Nil | Cons a (List a)

instance ToString a => ToString (List a) where
  toString Nil = "Nil"
  toString (Cons h t) =
    "Cons " ++ toString h ++ " " ++ toString t

convert :: Int -> N
convert 0 = Z
convert n = S (convert (n - 1))

listToString :: ToString a => [a] -> [String]
listToString = map toString

listToString' :: Show a => [a] -> [String]
listToString' = map show

{-
instance Show N where
  show _ = undefined

instance Show a => ToString a where
  toString a = show a
  -}

{-
Show, Read, Num, Monoid
-}

