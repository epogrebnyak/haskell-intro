
import Text.Read

-- Functor

{-
mapList :: (a -> b) -> [] a -> [] b
mapList f [] = []
mapList f (a:as) = f a : mapList as

mapMaybe :: (a -> b) -> Maybe a -> Maybe b
mapMaybe f Nothing = Nothing
mapMaybe f (Just a) = Just (f a)
-}

-- mapPoly :: (a -> b) -> t a -> t b

-- mapFunc :: (a -> b) -> ((->) r) a -> ((->) r) b
-- mapFunc :: (a -> b) -> (r -> a) -> (r -> b)
--

-- Applicative
-- Monad

askAndAppend :: IO ()
askAndAppend =
  getLine >>= \line1 ->
  getLine >>= \line2 ->
  print (line1 ++ line2)

askAndAppend1 :: IO ()
askAndAppend1 = do
  line1 <- getLine
  line2 <- getLine
  print (line1 ++ line2)

f :: String -> String -> Either String Int
f str1 str2 = do
  v1 <- readEither str1
  v2 <- readEither str2
  pure (v1 + v2)
