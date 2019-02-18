-- ":browse Prelude" 

Prelude> :browse
(!!) :: [a] -> Int -> a
($) ::
  forall (r :: GHC.Types.RuntimeRep) a (b :: TYPE r).
  (a -> b) -> a -> b
($!) :: (a -> b) -> a -> b
(&&) :: Bool -> Bool -> Bool
(++) :: [a] -> [a] -> [a]
(.) :: (b -> c) -> (a -> b) -> a -> c
(<$>) :: Functor f => (a -> b) -> f a -> f b
(=<<) :: Monad m => (a -> m b) -> m a -> m b
class Functor f => Applicative (f :: * -> *) where
  pure :: a -> f a
  (<*>) :: f (a -> b) -> f a -> f b
  GHC.Base.liftA2 :: (a -> b -> c) -> f a -> f b -> f c
  (*>) :: f a -> f b -> f b
  (<*) :: f a -> f b -> f a
  {-# MINIMAL pure, ((<*>) | liftA2) #-}
data Bool = False | True
class Bounded a where
  minBound :: a
  maxBound :: a
  {-# MINIMAL minBound, maxBound #-}
data Char = GHC.Types.C# GHC.Prim.Char#
data Double = GHC.Types.D# GHC.Prim.Double#
data Either a b = Left a | Right b
class Enum a where
  succ :: a -> a
  pred :: a -> a
  toEnum :: Int -> a
  fromEnum :: a -> Int
  enumFrom :: a -> [a]
  enumFromThen :: a -> a -> [a]
  enumFromTo :: a -> a -> [a]
  enumFromThenTo :: a -> a -> a -> [a]
  {-# MINIMAL toEnum, fromEnum #-}
class Eq a where
  (==) :: a -> a -> Bool
  (/=) :: a -> a -> Bool
  {-# MINIMAL (==) | (/=) #-}
type FilePath = String
data Float = GHC.Types.F# GHC.Prim.Float#
class Fractional a => Floating a where
  pi :: a
  exp :: a -> a
  log :: a -> a
  sqrt :: a -> a
  (**) :: a -> a -> a
  logBase :: a -> a -> a
  sin :: a -> a
  cos :: a -> a
  tan :: a -> a
  asin :: a -> a
  acos :: a -> a
  atan :: a -> a
  sinh :: a -> a
  cosh :: a -> a
  tanh :: a -> a
  asinh :: a -> a
  acosh :: a -> a
  atanh :: a -> a
  GHC.Float.log1p :: a -> a
  GHC.Float.expm1 :: a -> a
  GHC.Float.log1pexp :: a -> a
  GHC.Float.log1mexp :: a -> a
  {-# MINIMAL pi, exp, log, sin, cos, asin, acos, atan, sinh, cosh,
              asinh, acosh, atanh #-}
class Foldable (t :: * -> *) where
  Data.Foldable.fold :: Monoid m => t m -> m
  foldMap :: Monoid m => (a -> m) -> t a -> m
  foldr :: (a -> b -> b) -> b -> t a -> b
  Data.Foldable.foldr' :: (a -> b -> b) -> b -> t a -> b
  foldl :: (b -> a -> b) -> b -> t a -> b
  Data.Foldable.foldl' :: (b -> a -> b) -> b -> t a -> b
  foldr1 :: (a -> a -> a) -> t a -> a
  foldl1 :: (a -> a -> a) -> t a -> a
  Data.Foldable.toList :: t a -> [a]
  null :: t a -> Bool
  length :: t a -> Int
  elem :: Eq a => a -> t a -> Bool
  maximum :: Ord a => t a -> a
  minimum :: Ord a => t a -> a
  sum :: Num a => t a -> a
  product :: Num a => t a -> a
  {-# MINIMAL foldMap | foldr #-}
class Num a => Fractional a where
  (/) :: a -> a -> a
  recip :: a -> a
  fromRational :: Rational -> a
  {-# MINIMAL fromRational, (recip | (/)) #-}
class Functor (f :: * -> *) where
  fmap :: (a -> b) -> f a -> f b
  (<$) :: a -> f b -> f a
  {-# MINIMAL fmap #-}
newtype IO a
  = GHC.Types.IO (GHC.Prim.State# GHC.Prim.RealWorld
                  -> (# GHC.Prim.State# GHC.Prim.RealWorld, a #))
type IOError = GHC.IO.Exception.IOException
data Int = GHC.Types.I# GHC.Prim.Int#
data Integer
  = integer-gmp-1.0.2.0:GHC.Integer.Type.S# GHC.Prim.Int#
  | integer-gmp-1.0.2.0:GHC.Integer.Type.Jp# {-# UNPACK #-}integer-gmp-1.0.2.0:GHC.Integer.Type.BigNat
  | integer-gmp-1.0.2.0:GHC.Integer.Type.Jn# {-# UNPACK #-}integer-gmp-1.0.2.0:GHC.Integer.Type.BigNat
class (Real a, Enum a) => Integral a where
  quot :: a -> a -> a
  rem :: a -> a -> a
  div :: a -> a -> a
  mod :: a -> a -> a
  quotRem :: a -> a -> (a, a)
  divMod :: a -> a -> (a, a)
  toInteger :: a -> Integer
  {-# MINIMAL quotRem, toInteger #-}
data Maybe a = Nothing | Just a
class Applicative m => Monad (m :: * -> *) where
  (>>=) :: m a -> (a -> m b) -> m b
  (>>) :: m a -> m b -> m b
  return :: a -> m a
  fail :: String -> m a
  {-# MINIMAL (>>=) #-}
class Semigroup a => Monoid a where
  mempty :: a
  mappend :: a -> a -> a
  mconcat :: [a] -> a
  {-# MINIMAL mempty #-}
class Num a where
  (+) :: a -> a -> a
  (-) :: a -> a -> a
  (*) :: a -> a -> a
  negate :: a -> a
  abs :: a -> a
  signum :: a -> a
  fromInteger :: Integer -> a
  {-# MINIMAL (+), (*), abs, signum, fromInteger, (negate | (-)) #-}
class Eq a => Ord a where
  compare :: a -> a -> Ordering
  (<) :: a -> a -> Bool
  (<=) :: a -> a -> Bool
  (>) :: a -> a -> Bool
  (>=) :: a -> a -> Bool
  max :: a -> a -> a
  min :: a -> a -> a
  {-# MINIMAL compare | (<=) #-}
data Ordering = LT | EQ | GT
type Rational = GHC.Real.Ratio Integer
class Read a where
  readsPrec :: Int -> ReadS a
  readList :: ReadS [a]
  GHC.Read.readPrec :: Text.ParserCombinators.ReadPrec.ReadPrec a
  GHC.Read.readListPrec :: Text.ParserCombinators.ReadPrec.ReadPrec
                             [a]
  {-# MINIMAL readsPrec | readPrec #-}
type ReadS a = String -> [(a, String)]
class (Num a, Ord a) => Real a where
  toRational :: a -> Rational
  {-# MINIMAL toRational #-}
class (RealFrac a, Floating a) => RealFloat a where
  floatRadix :: a -> Integer
  floatDigits :: a -> Int
  floatRange :: a -> (Int, Int)
  decodeFloat :: a -> (Integer, Int)
  encodeFloat :: Integer -> Int -> a
  exponent :: a -> Int
  significand :: a -> a
  scaleFloat :: Int -> a -> a
  isNaN :: a -> Bool
  isInfinite :: a -> Bool
  isDenormalized :: a -> Bool
  isNegativeZero :: a -> Bool
  isIEEE :: a -> Bool
  atan2 :: a -> a -> a
  {-# MINIMAL floatRadix, floatDigits, floatRange, decodeFloat,
              encodeFloat, isNaN, isInfinite, isDenormalized, isNegativeZero,
              isIEEE #-}
class (Real a, Fractional a) => RealFrac a where
  properFraction :: Integral b => a -> (b, a)
  truncate :: Integral b => a -> b
  round :: Integral b => a -> b
  ceiling :: Integral b => a -> b
  floor :: Integral b => a -> b
  {-# MINIMAL properFraction #-}
class Semigroup a where
  (<>) :: a -> a -> a
  GHC.Base.sconcat :: GHC.Base.NonEmpty a -> a
  GHC.Base.stimes :: Integral b => b -> a -> a
  {-# MINIMAL (<>) #-}
class Show a where
  showsPrec :: Int -> a -> ShowS
  show :: a -> String
  showList :: [a] -> ShowS
  {-# MINIMAL showsPrec | show #-}
type ShowS = String -> String
type String = [Char]
class (Functor t, Foldable t) => Traversable (t :: * -> *) where
  traverse :: Applicative f => (a -> f b) -> t a -> f (t b)
  sequenceA :: Applicative f => t (f a) -> f (t a)
  mapM :: Monad m => (a -> m b) -> t a -> m (t b)
  sequence :: Monad m => t (m a) -> m (t a)
  {-# MINIMAL traverse | sequenceA #-}
data Word = GHC.Types.W# GHC.Prim.Word#
(^) :: (Num a, Integral b) => a -> b -> a
(^^) :: (Fractional a, Integral b) => a -> b -> a
all :: Foldable t => (a -> Bool) -> t a -> Bool
and :: Foldable t => t Bool -> Bool
any :: Foldable t => (a -> Bool) -> t a -> Bool
appendFile :: FilePath -> String -> IO ()
asTypeOf :: a -> a -> a
break :: (a -> Bool) -> [a] -> ([a], [a])
concat :: Foldable t => t [a] -> [a]
concatMap :: Foldable t => (a -> [b]) -> t a -> [b]
const :: a -> b -> a
curry :: ((a, b) -> c) -> a -> b -> c
cycle :: [a] -> [a]
drop :: Int -> [a] -> [a]
dropWhile :: (a -> Bool) -> [a] -> [a]
either :: (a -> c) -> (b -> c) -> Either a b -> c
error ::
  forall (r :: GHC.Types.RuntimeRep) (a :: TYPE r).
  GHC.Stack.Types.HasCallStack =>
  [Char] -> a
errorWithoutStackTrace ::
  forall (r :: GHC.Types.RuntimeRep) (a :: TYPE r). [Char] -> a
even :: Integral a => a -> Bool
filter :: (a -> Bool) -> [a] -> [a]
flip :: (a -> b -> c) -> b -> a -> c
fromIntegral :: (Integral a, Num b) => a -> b
fst :: (a, b) -> a
gcd :: Integral a => a -> a -> a
getChar :: IO Char
getContents :: IO String
getLine :: IO String
head :: [a] -> a
id :: a -> a
init :: [a] -> [a]
interact :: (String -> String) -> IO ()
ioError :: IOError -> IO a
iterate :: (a -> a) -> a -> [a]
last :: [a] -> a
lcm :: Integral a => a -> a -> a
lex :: ReadS String
lines :: String -> [String]
lookup :: Eq a => a -> [(a, b)] -> Maybe b
map :: (a -> b) -> [a] -> [b]
mapM_ :: (Foldable t, Monad m) => (a -> m b) -> t a -> m ()
maybe :: b -> (a -> b) -> Maybe a -> b
not :: Bool -> Bool
notElem :: (Foldable t, Eq a) => a -> t a -> Bool
odd :: Integral a => a -> Bool
or :: Foldable t => t Bool -> Bool
otherwise :: Bool
print :: Show a => a -> IO ()
putChar :: Char -> IO ()
putStr :: String -> IO ()
putStrLn :: String -> IO ()
read :: Read a => String -> a
readFile :: FilePath -> IO String
readIO :: Read a => String -> IO a
readLn :: Read a => IO a
readParen :: Bool -> ReadS a -> ReadS a
reads :: Read a => ReadS a
realToFrac :: (Real a, Fractional b) => a -> b
repeat :: a -> [a]
replicate :: Int -> a -> [a]
reverse :: [a] -> [a]
scanl :: (b -> a -> b) -> b -> [a] -> [b]
scanl1 :: (a -> a -> a) -> [a] -> [a]
scanr :: (a -> b -> b) -> b -> [a] -> [b]
scanr1 :: (a -> a -> a) -> [a] -> [a]
seq :: a -> b -> b
sequence_ :: (Foldable t, Monad m) => t (m a) -> m ()
showChar :: Char -> ShowS
showParen :: Bool -> ShowS -> ShowS
showString :: String -> ShowS
shows :: Show a => a -> ShowS
snd :: (a, b) -> b
span :: (a -> Bool) -> [a] -> ([a], [a])
splitAt :: Int -> [a] -> ([a], [a])
subtract :: Num a => a -> a -> a
tail :: [a] -> [a]
take :: Int -> [a] -> [a]
takeWhile :: (a -> Bool) -> [a] -> [a]
uncurry :: (a -> b -> c) -> (a, b) -> c
undefined ::
  forall (r :: GHC.Types.RuntimeRep) (a :: TYPE r).
  GHC.Stack.Types.HasCallStack =>
  a
unlines :: [String] -> String
until :: (a -> Bool) -> (a -> a) -> a -> a
unwords :: [String] -> String
unzip :: [(a, b)] -> ([a], [b])
unzip3 :: [(a, b, c)] -> ([a], [b], [c])
userError :: String -> IOError
words :: String -> [String]
writeFile :: FilePath -> String -> IO ()
zip :: [a] -> [b] -> [(a, b)]
zip3 :: [a] -> [b] -> [c] -> [(a, b, c)]
zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith3 :: (a -> b -> c -> d) -> [a] -> [b] -> [c] -> [d]
(||) :: Bool -> Bool -> Bool
Prelude>
