-- from https://github.com/snoyberg/http-client/blob/master/TUTORIAL.md#connection-manager

{-# LANGUAGE OverloadedStrings #-}
import qualified Data.ByteString.Lazy.Char8 as L8
import           Network.HTTP.Client        (defaultManagerSettings, newManager)
import           Network.HTTP.Simple

main :: IO ()
main = do
    manager <- newManager defaultManagerSettings

    let request = setRequestManager manager "http://httpbin.org/get"
    response <- httpLBS request

    putStrLn $ "The status code was: " ++
               show (getResponseStatusCode response)
    print $ getResponseHeader "Content-Type" response
    L8.putStrLn $ getResponseBody response