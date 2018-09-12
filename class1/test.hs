
data Point = MkPoint Int Int
  deriving (Show)

data Shape
  = Circle Point Int
  | Rectangle Point Point
  deriving (Show)


moveByX :: Int -> Point -> Point
moveByX dx (MkPoint x y) = MkPoint (x + dx) y

moveShapeByX :: Int -> Shape -> Shape
moveShapeByX dx (Circle center r)
    = Circle (moveByX dx center) r
moveShapeByX dx (Rectangle c1 c2)
    = let c1' = moveByX dx c1
      in Rectangle c1' (moveByX dx c2)
{-
    where
    c1' = moveByX dx c1
    -}

moveShapeByX dx shape
  = case shape of
      Circle center r -> Circle (moveByX dx center) r
      Rectangle c1 (MkPoint x y) -> ...
