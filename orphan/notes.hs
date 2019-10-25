-- Great single topics reads
-- =========================

-- https://github.com/rudymatela/concise-cheat-sheets

-- My notes
-- =========
-- Started by E.Pogrebnyak on 09/09/2018

-- Start interpreter:
-- :q

-- Exit from interpreter (just like vim):
-- :q

-- Q: Does Haskell compile on Windows?
-- A: The following compiles notes.exe which is runnable on Windows!!!
--    It does make a Windows binary!!!
--    > ghc --make notes 

-- Q: There is a standard library available without imports?
-- A: Yes, it is Prelude module. 

-- can run this in interpreter without main 
-- but in a script, you need main() function, similar to C 
main = putStrLn "Hello, world"

-- useful $ operator
head $ take 10 [1..]

-- function composition 
-- f . g = h where h x = f (g x)   -- as defined in the Prelude
a = (\x -> x + 1) 1

-- function 'case of' varieties
-- if-else / case of / guards / pattern matching / MultiIf
-- https://stackoverflow.com/questions/9345589/guards-vs-if-then-else-vs-cases-in-haskell

-- Types
-- =====

-- typeclasses:
-- http://book.realworldhaskell.org/read/using-typeclasses.html
-- http://shuklan.com/haskell/lec03.html#/0/10
-- http://learnyouahaskell.com/types-and-typeclasses

-- type constriant 
-- https://stackoverflow.com/questions/9142731/what-does-the-symbol-mean-in-haskell
-- ghci> :t (==)  
-- (==) :: (Eq a) => a -> a -> Bool

-- Testing
-- =======

-- mock assertions with functions
-- https://downloads.haskell.org/~ghc/6.12.2/docs/html/users_guide/assertions.html

-- raising errors in Haskell
-- http://www.randomhacks.net/2007/03/10/haskell-8-ways-to-report-errors/

-- Warnings
-- ========

-- to supress warnings, use: 
-- main = return ()
-- https://stackoverflow.com/questions/46547208/why-is-my-haskell-code-saying-variable-not-in-scope-main

