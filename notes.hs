-- Notes by E.Pogrebnyak
-- Started 09/09/2018

-- Q: does Haskell compile on Windows?
-- A: the following compiles notes.exe which is runnable on Windows!!!
--    it does make a Windows binary!!!
--    > ghc --make notes 

-- exit from interpreter:
-- :q

-- Q: there is a standard library available without imports
-- A: Prelude? 

-- can run this in interpreter without main 
-- but in a script, you need main() function, similar to C 
main = putStrLn "Hello, world"

-- $ operator
head $ take 10 [1..]


-- function composition 
-- f . g = h where h x = f (g x)   -- as defined in the Prelude


-- Not shown:
--    - lambdas
--    - pattern mathcing
--    - different ways to define a fucntions on several types
--    - let in / where / do 
--    - multiline statement


-- Additions:
-- ==========

-- quick basic intro 
-- also https://learnxinyminutes.com/docs/haskell/

-- good functions tutorial
-- http://www.toves.org/books/hsfun/
-- but lacks lambda functions

-- typeclasses
-- http://book.realworldhaskell.org/read/using-typeclasses.html
-- http://shuklan.com/haskell/lec03.html#/0/10
-- http://learnyouahaskell.com/types-and-typeclasses

-- fold
-- http://hackage.haskell.org/package/base-4.12.0.0/docs/src/Data.Foldable.html#foldl

-- Unsorted:
-- =========

-- Videos:
-- https://youtu.be/VFCXjYEBR4E accompains http://learnyouahaskell.com
-- just for the taste of it: https://www.youtube.com/watch?v=tJNU1H9XewM&t=857s


-- This also has a repo on github with code
-- http://learnyouahaskell.com/starting-out
-- Excercises for dealint with sequences are great 

-- This has type constriant and actual tupe withing type signature
-- https://stackoverflow.com/questions/9142731/what-does-the-symbol-mean-in-haskell
-- ghci> :t (==)  
-- (==) :: (Eq a) => a -> a -> Bool


-- Special cases:
-- ==============

-- supress warnings, use: 
-- main = return ()
-- https://stackoverflow.com/questions/46547208/why-is-my-haskell-code-saying-variable-not-in-scope-main

-- mock assertions with functions
-- https://downloads.haskell.org/~ghc/6.12.2/docs/html/users_guide/assertions.html

-- raising errors in Haskell
-- http://www.randomhacks.net/2007/03/10/haskell-8-ways-to-report-errors/


-- if-else / case of / guards
-- https://stackoverflow.com/questions/9345589/guards-vs-if-then-else-vs-cases-in-haskell