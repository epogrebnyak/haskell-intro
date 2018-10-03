-- define function and function type in signature
addTwo :: Int -> Int -> Int
addTwo a b = a + b 

-- the () in type declaration 
runFunc :: (Int -> Int) -> Int
runFunc f = f 2

-- example:
-- runFunc (addTwo 1)

square :: Double -> Double
square x = x * x 

addThree :: Int -> Int -> Int -> Int  
addThree x y z = x + y + z  


-- Data classes start with data keyword
-- Declaration is similar to python namedtuple: there is class name Point and constructor MkPoint
-- normally we would have had `data Point = Point Int Int`, but for learning we separete the two

-- Product and sum algebraic data classes

data Point = MkPoint Int Int
  deriving (Show)

data Shape
  = Circle Point Int
  | Rectangle Point Point
  deriving (Show)

-- Pattern matching (remotely simialr to keyword argument unpacking)
moveByX :: Int -> Point -> Point
moveByX dx (MkPoint x y) = MkPoint (x + dx) y

-- Defintion without case (deiniton applied to different argument types)
moveShapeByX :: Int -> Shape -> Shape
moveShapeByX dx (Circle center r)
    = Circle (moveByX dx center) r
moveShapeByX dx (Rectangle c1 c2)
    = let c1' = moveByX dx c1
      in Rectangle c1' (moveByX dx c2)

-- equivalent to       
{-
    where
    c1' = moveByX dx c1
    -}

-- Defintion without case
-- TODO: finish up
moveShapeByX dx shape
  = case shape of
      Circle center r -> Circle (moveByX dx center) r
      Rectangle c1 (MkPoint x y) -> ...
