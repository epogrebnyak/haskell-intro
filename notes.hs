-- testing on Travis-CI:
-- https://github.com/haskell-CI/haskell-ci


-- Great single topics reads
-- =========================

-- Functions tutorial (no lambda functions though)
-- http://www.toves.org/books/hsfun/

-- Desugarization (list comp desugs to do notation):
-- http://www.haskellforall.com/2014/10/how-to-desugar-haskell-code.html

-- Learn Physics by Programming in Haskell
-- http://arxiv.org/abs/1412.4880

-- Haskell Basics (informal discussion in write-you-a-haskell)
-- http://dev.stephendiehl.com/fun/001_basics.html

-- https://github.com/rudymatela/concise-cheat-sheets

-- My notes
-- =========
-- Started by E.Pogrebnyak on 09/09/2018

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

