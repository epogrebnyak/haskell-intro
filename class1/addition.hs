-- Trying to show:
--    - define function and function type in signature
--    - currying

addTwo :: Int -> Int -> Int
addTwo a b = a + b 


-- the () in type declaration 
runFunc :: (Int -> Int) -> Int
runFunc f = f 2


-- can use:
-- runFunc (addTwo 1)

square :: Double -> Double
square x = x * x 


-- Not shown:
--
--    - lambdas
--    - pattern mathcing
--    - different ways to define a fucntions on several types
--    - let in / where / do 
--    - multiline statement?


-- Additions:
--
-- https://stackoverflow.com/questions/46547208/why-is-my-haskell-code-saying-variable-not-in-scope-main
-- supress warnings

main = return ()

-- assertions
-- https://downloads.haskell.org/~ghc/6.12.2/docs/html/users_guide/assertions.html

-- Good functions tutorial
-- http://www.toves.org/books/hsfun/
-- but lacks lambda functions
-- also https://learnxinyminutes.com/docs/haskell/
