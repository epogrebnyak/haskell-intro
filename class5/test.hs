
{-
class Monoid a where
  mempty :: a
  mappend :: a -> a -> a
  -}

instance Monoid Int where
  mempty = 0
  mappend = (+)

{-
newtype Sum a = Sum { getSum :: a }
  deriving (Show)

instance Num a => Monoid (Sum a) where
-}

-- newtype Sum = Sum Int
newtype Sum = Sum { getSum :: Int }
  deriving (Show)

instance Monoid Sum where
  mempty = Sum 0
  mappend (Sum a) (Sum b) = Sum (a + b)

