-- Description

-- Prerequisite:
-- understanding and knowing to use Maybe, Either types

-- Goal:
-- familiraising with kinds

-- Method:
-- playing with :k interpreter command

-- Usefulness:
-- confidence in understanding Haskell typeclass notions and terminology
-- ability to reason about complex types 

-- Descriptoin





-- From here we can pick a terminology
-- https://www.reddit.com/r/haskell/comments/2u0m50/need_to_understand_type_constructor/

data Maybe a = Just a | Nothing deriving Show

-- Maybe is a type constructor.
-- Maybe Int is a type. Maybe String is a type 
-- Just is a data constructor.
-- Just 42 is a value. Just "abc" is a value
-- Nothing is the constructor, and the value. 


-- :kind command in the interpreter allows to explore and reason types and types classes
-- :kind is similar to :type, but applies to the left side of type definition. 

-- The simplest kind is * ("a star"), which is just a type.
-- Int, Char, Bool types have kind *. 

{-

Prelude> :k Int
Int :: *
Prelude> :k Char
Char :: *
Prelude> :k Bool
Bool :: *

-}

---------------------------------------------
--
--   Checkpoint 1: Simple types have kind '*'
--
---------------------------------------------

-- Haskell has the power to combine types. For example, `Maybe`
-- can work with different types. This is marked by parameter
-- `a` in the Maybe defintion:

data Maybe a = Just a | Nothing deriving Show

-- On the right of equality sign we have constructors for values.  
-- Example of use of these constructors are:

Just 1
Just "abc"
Just (5 ** 0.5)
Nothing

-- Just work as a function that takes a value of type a
-- and returns a value of type `Maybe a`.

Prelude> :t Just
Just :: a -> Maybe a

-- Nothing is also a constructor, but it does not require 
-- any inputs

Prelude> :t Nothing
Nothing :: Maybe a

-- Here the usage of 'constructor' term is not far away from OOP.
-- It is the function or a method that takes some values or no 
-- value and creates an object (eg instance, expression) of certain type.

data Position a = Pos a a
data Cell = MkCell Int Char
data Color = Red | Green | Blue

-------------------------------------------------------------------------
--
--   Checkpoint 2: Data constructor 
--     - creates values of certain type
--     - is similar to a function
--     - has a type signature, discoverable with :type command
--
-------------------------------------------------------------------------

-- But what about things on the left of Maybe definition?
-- What is `Maybe a` or `Position a`? Let's explore these types
-- with :kind command.

{-

Prelude> :k Position
Position :: * -> *
Prelude> :k Maybe
Maybe :: * -> *

-}

-- Ok, Maybe is something working on types (it has an arrow), that produce another type 
-- (arrow results in a star). The terminology to describe Maybe is a bit sloppy. 
-- Several wordings are possible:
--    - Maybe is a *type constructor* that takes a type *a* and produces a specific type
--      like 'Maybe Int' or 'Maybe String'. Try ':k Maybe Int'. It has kind *.
--    - Maybe is a *type* of kind `* -> *`.
--    - Maybe is a *higher-order type.*


Pos (1::Int) :: Int -> Position Int

-- asyntax
data T f = T (f Int)
-- :k T
-- T :: (* -> *) -> *