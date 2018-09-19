
data List a
  = Nil
  | Cons a (List a)
  deriving (Show)

len :: List a -> Int
len Nil = 0
len (Cons _ tail) = 1 + len tail

id :: a -> a
id a = a

intId :: Int -> Int
intId a = a + a
