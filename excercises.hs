-- Implement a Monad instance for the list constructor, [].


-- https://en.wikibooks.org/wiki/Haskell/Understanding_monads/List
-- https://www.haskell.org/onlinereport/haskell2010/haskellch9.html
-- instance Monad [] where
--    return x = [x]
--    (>>=) a f = concat $ fmap f a
--               [y | x<-xs, y<-f x]
--               do   
--                    x <- xs
--                    y <- f x
--                    return y
--                    xs >>= \x -> (x >>= \) ...


-- Implement a Monad instance for ((->) e).
-- https://stackoverflow.com/questions/27415375/implementing-monad-e
type Arr a b = a -> b
z :: Arr
z x = (+) 1 x 





