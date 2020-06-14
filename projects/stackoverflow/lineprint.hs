-- How to print function args and results on individual lines?
-- Answer at https://ru.stackoverflow.com/a/982010/264569

{-# LANGUAGE ParallelListComp #-}
import Data.List

-- example function
f a b = a + b 

as = [1, 2, 3, 1]
bs = [4, 5, 6]
res = zipWith f as bs

showAll f as bs =  [showLine a b (f a b) | a <- as | b <-bs] 
    where showLine a b res = intercalate " " $ map show [a, b, res]

main = mapM_ print $ showAll f as bs

-- *Main> main
-- "1 4 5"
-- "2 5 7"
-- "3 6 9"
