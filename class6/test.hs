{-# LANGUAGE OverloadedStrings #-}

module Main
where

import qualified Data.ByteString as ByteString
import qualified Data.Attoparsec.ByteString as Atto

data Day
 = Monday
 | Thusday
 | Wednesday
 | Sunday
 | Sataday
 deriving (Show)

{-
"moday", "thusday", "wednesday"
-}

parseDay :: Atto.Parser Day
parseDay = Atto.choice
  [ Atto.string "monday" >> pure Monday
  , Atto.string "thusday" >> pure Thusday
  , Atto.string "wednesday" >> pure Wednesday
  , Atto.string "s" >> Atto.choice
    [ Atto.string "unday" >> pure Sunday
    , Atto.string "ataday" >> pure Sataday
    ]
  {-
  , Atto.string "sunday" >> pure Sunday
  , Atto.string "sataday" >> pure Sataday
  -}
  ]

main :: IO ()
main = do
  print $ Atto.parseOnly parseDay "monday"
  print $ Atto.parseOnly parseDay "thusday"
  print $ Atto.parseOnly parseDay "wednesday"
  print $ Atto.parseOnly parseDay "sunday"
  print $ Atto.parseOnly parseDay "sataday"
  print $ Atto.parseOnly parseDay "asdfasdf"
