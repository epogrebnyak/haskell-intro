{-
write your own versions of Maybe and Either, make then instances of
Functor, Applicative and Monad, check laws.

write a quiz game; use getLine and putStrLn from the Prelude
or anything else you find; use do notation and also make sure you
understand how do notation is desugered using (>>=) operator.
-}

-- some reading: https://page.mi.fu-berlin.de/scravy/realworldhaskell/materialien/the-essence-of-functional-programming.pdf

-- also TODO install cabal

-- version of Maybe a
data CouldBe a = Nope | Good a
    deriving Show
   
-- FIXED: tried instance Functor CouldBe a, it was an error    
instance Functor CouldBe where
    fmap f Nope = Nope
    fmap f (Good x) = Good (f x)

if fmap (*2) (Good 2) != Good 4 then error "Functor not working"    

-- TODO Applicative 
{-
class Functor f => Applicative f where
    -- | Lift a value.
    pure :: a -> f a

    -- | Sequential application.
    (<*>) :: f (a -> b) -> f a -> f b
-}

-- TODO Monad
-- http://hackage.haskell.org/package/base-4.12.0.0/docs/src/GHC.Base.html#Monad

{--
instance Monad Maybe where  
    return x = Just x  
    Nothing >>= f = Nothing  
    Just x >>= f  = f x  
    fail _ = Nothing  
-}

-- return  
-- (>>=)

instance Monad CouldBe where
    return x = Good x
    Good x >== f = Good (f x)
    --           =  f x
    Nope >== f = Nope


-- quiz game
main = do 
    let namesIKnow = ["Joe", "Kim"] 
    name <- getLine
    let msg = name ++ if name `elem` namesIKnow then " is a friend!" else " is a foe!"           
    putStrLn msg

-- now a binging operations version
namesIKnow' = ["Joe", "Kim"] 
identifyInNames names name = if name `elem` names then "friend" else "foe"
evalName = identifyInNames namesIKnow'  
--makeMessage :: [Char] -> String
makeMessage name = name ++ " is a " ++ (evalName name) ++ "!" 
-- Getting error messages on types
-- main' = putStrLn $ getLine >>= (\input -> makeMessage input)    