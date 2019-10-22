{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import Control.Monad.IO.Class
import Data.Aeson
import Network.HTTP.Req

payload = ReqBodyJson $ object
        [ "foo" .= (10 :: Int)
        , "bar" .= (20 :: Int) ]

main :: IO ()
-- You can either make your monad an instance of 'MonadHttp', or use
-- 'runReq' in any IO-enabled monad without defining new instances.
main = runReq defaultHttpConfig $ do
  r <- req POST -- method
    (https "httpbin.org" /: "post") -- safe by construction URL
    payload      -- use built-in options or add your own
    jsonResponse -- specify how to interpret response
    mempty       -- query params, headers, explicit port number, etc.
  liftIO $ print (responseBody r :: Value)