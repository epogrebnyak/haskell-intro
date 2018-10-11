
{-

* make a pretty printer to expression language from class2 home work

* define your own versions for Sum and Product monoids.
  Sum uses 0 as a zero element and + as an operation,
  and Product uses 1 and * for them.

-}

-- Mononid refence
-- https://en.wikibooks.org/wiki/Haskell/Monoids


-- EP: newtype is stronger? 
data Prod = Prod Int
    deriving Show

class Monoid' a where
    empty' :: a
    mappend' :: a -> a -> a

instance Monoid' Int where
    empty' = 0
    mappend' a b = a + b

-- EP: cannot really extract `empty` from definition 
--  Main.mappend Main.empty Main.empty :: Int

instance Monoid' Prod where
    empty' = Prod 1
    mappend' (Prod a) (Prod b) = Prod (a * b)


-- ambigious without Main
addTwo :: Int -> Int -> Int 
addTwo a b = mappend' a b

-- overload operator    
(<^>) a b = mappend' a b 

{-
http://www.scs.stanford.edu/14sp-cs240h/slides/phantoms.html

# Monoids for multiplication
newtype Product a = Product { getProduct :: a }
    deriving (Eq, Ord, Read, Show, Bounded)

instance Num a => Monoid (Product a) where
    mempty                        = Product 1
    Product x `mappend` Product y = Product (x * y)

# Monoids for addition
newtype Sum a = Sum { getSum :: a }
    deriving (Eq, Ord, Read, Show, Bounded)

instance Num a => Monoid (Sum a) where
    mempty                = Sum 0
    Sum x `mappend` Sum y = Sum (x + y)

-}

{-
-- Also semigroup package
-- http://hackage.haskell.org/package/base-4.12.0.0/docs/src/Data.Semigroup.Internal.html#Sum

-- | @since 2.01
instance Monoid Any where
        mempty = Any False

-- | Monoid under addition.
--
-- >>> getSum (Sum 1 <> Sum 2 <> mempty)
-- 3
newtype Sum a = Sum { getSum :: a }
        deriving ( Eq       -- ^ @since 2.01
                 , Ord      -- ^ @since 2.01
                 , Read     -- ^ @since 2.01
                 , Show     -- ^ @since 2.01
                 , Bounded  -- ^ @since 2.01
                 , Generic  -- ^ @since 4.7.0.0
                 , Generic1 -- ^ @since 4.7.0.0
                 , Num      -- ^ @since 4.7.0.0
                 )

-- | @since 4.9.0.0
instance Num a => Semigroup (Sum a) where
        (<>) = coerce ((+) :: a -> a -> a)
        stimes n (Sum a) = Sum (fromIntegral n * a)

-- | @since 2.01
instance Num a => Monoid (Sum a) where
        mempty = Sum 0

-}