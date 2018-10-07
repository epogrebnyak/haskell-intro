
{-

* make a pretty printer to expression language from class2 home work

* define your own versions for Sum and Product monoids.
  Sum uses 0 as a zero element and + as an operation,
  and Product uses 1 and * for them.

-}

-- Mononid refence
-- https://en.wikibooks.org/wiki/Haskell/Monoids
class MySum a where
    empty :: a
    plus :: a -> a -> a

instance MySum Int where
    empty = 0
    plus a b = a + b
    
-- how do I use it? 
-- how is `<>` overloaded?    