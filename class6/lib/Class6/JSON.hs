{-# LANGUAGE OverloadedStrings #-}

module Class6.JSON
( Value(..)
, jsonP
)
where

import qualified Data.ByteString as ByteString
import Data.Text (Text)
import qualified Data.Text as Text
import qualified Data.Text.Encoding as Text
import Data.HashMap.Strict (HashMap)
import qualified Data.HashMap.Strict as HashMap
import qualified Data.Attoparsec.ByteString as Atto
import Control.Monad

data Value
  = String Text
  | Number Int
  | Bool Bool
  | Null
  | Array [Value]
  | Object (HashMap Text Value)
  deriving (Show)

jsonP :: Atto.Parser Value
jsonP = Atto.choice
  [ nullP
  , boolP
  , stringP
  , numberP
  , arrayP
  , objectP
  ]

-- {"a":123,"b":"hello",}
-- HashMap.empty
objectP :: Atto.Value
objectP = fail "not implemented"

-- [1,"hello",54,]
arrayP :: Atto.Parser Value
arrayP = do
  Atto.string "["
  go []
  where
  go res = do
    Atto.choice
      [ Atto.string "]" >> pure (Array (reverse res))
      , do
        v <- jsonP
        Atto.string ","
        go (v:res)
      ]

nullP :: Atto.Parser Value
nullP = do
  Atto.string "null"
  pure Null

boolP :: Atto.Parser Value
boolP = Atto.choice
  [ Atto.string "true" >> pure (Bool True)
  , Atto.string "false" >> pure (Bool False)
  ]

-- "some text"
stringP :: Atto.Parser Value
stringP = do
  Atto.string "\""
  bs <- Atto.takeWhile (/= 34)
  Atto.string "\""
  pure (String (Text.decodeUtf8 bs))

numberP :: Atto.Parser Value
numberP = do
  bs <- Atto.takeWhile (\b -> b >= 48 && b <= 57)
  when (ByteString.null bs) $
    fail "empty number"
  pure (Number (read $ Text.unpack $ Text.decodeUtf8 bs))
