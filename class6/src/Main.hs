{-# LANGUAGE OverloadedStrings #-}

module Main where

import qualified Data.Attoparsec.ByteString as Atto

import Class6.JSON

main :: IO ()
main = do
  print $ Atto.parseOnly jsonP "123"
