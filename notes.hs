-- Starting notes by E.Pogrebnyak
-- 09/09/2018

-- did installation onf Windows  also install a C compiler?
-- how Haskell uses C compiler?


-- exit from interpreter:
-- :q


-- # is not a comment but what is it?


-- there is a sort of standard library available without imports
-- can run this in interpreter without main 
-- but in a script, you need main() function, similar to C 
main = putStrLn "Hello, world"


-- The following compiles notes.exe which is runnable on Windows!!!
-- it does make a Windows binary!!!
-- > ghc --make notes 


-- http://learnyouahaskell.com/starting-out
-- Excercises for dealint with sequences are great 

-- ERROR: why doesnot follwoing work:
-- head take 100 [1..]
-- <interactive>:15:6: error:
--     * Couldn't match expected type `[Integer -> [Integer] -> t]'
--                   with actual type `Int -> [a0] -> [a0]'
--     * Probable cause: `take' is applied to too few arguments
--       In the first argument of `head', namely `take'
--       In the expression: head take 100 [1 .. ]
--       In an equation for `it': it = head take 100 [1 .. ]
--     * Relevant bindings include it :: t (bound at <interactive>:15:1)


-- Type classes:
-- http://shuklan.com/haskell/lec03.html#/0/10
-- http://learnyouahaskell.com/types-and-typeclasses

addThree :: Int -> Int -> Int -> Int  
addThree x y z = x + y + z  

-- ERROR: cannot declare a function type in interpreter
-- *Main> f :: Int -> Int
-- <interactive>:14:1: error: Variable not in scope: f :: Int -> Int


-- QUESTION: how to leave scope Main?

-- This has type constriant and actual tupe withing type signature
-- https://stackoverflow.com/questions/9142731/what-does-the-symbol-mean-in-haskell
-- ghci> :t (==)  
-- (==) :: (Eq a) => a -> a -> Bool


-- Videos:
-- https://youtu.be/VFCXjYEBR4E accompains http://learnyouahaskell.com
-- just for the taste of it: https://www.youtube.com/watch?v=tJNU1H9XewM&t=857s
