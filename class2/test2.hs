
data IntList
  = Nil
  | Cons Int IntList
  deriving (Show)

len :: IntList -> Int
len Nil = 0
len (Cons _ tail) = 1 + len tail

{-

len (Cons 2 (Cons 1 Nil)) = 1 + len (Cons 1 Nil)
= 1 + 1 + len Nil = 1 + 1 + 0

-}

len' :: IntList -> Int
len' l = go 0 l
  where
  go res Nil = res -- 1 + 1 + 1 + ...
  -- go res (Cons _ tail) = go (res + 1) tail
  {-
  go res (Cons _ tail) =
    case res + 1 of
      res' -> go res' tail
      -}
  go res (Cons _ tail) =
    let res' = res + 1
    in go res' tail
  {-
  go res (Cons _ tail) =
    let res' = res + 1
    in seq res' (go res' tail)
    -}

len'' :: IntLit -> Int
len'' l = case l of
  Nil -> 0
  Cons _ tail -> 1 + len'' tail
