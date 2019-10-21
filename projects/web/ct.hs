{-# LANGUAGE OverloadedStrings #-}
import qualified Data.ByteString.Lazy.Char8 as L8
import           Network.HTTP.Simple -- http-conduit

main :: IO ()
main = do
    response <- httpLBS "http://httpbin.org/get"

    putStrLn $ "The status code was: " ++
               show (getResponseStatusCode response)
    print $ getResponseHeader "Content-Type" response
    L8.putStrLn $ getResponseBody response

-- import           Data.Aeson            (Value)
-- import qualified Data.ByteString.Char8 as S8

-- import qualified Data.Yaml             as Yaml
-- import           Network.HTTP.Simple

-- main :: IO ()
-- main = do
--     response <- httpJSON "http://httpbin.org/get"

--     putStrLn $ "The status code was: " ++
--                show (getResponseStatusCode response)
--     print $ getResponseHeader "Content-Type" response
--     S8.putStrLn $ Yaml.encode (getResponseBody response :: Value)