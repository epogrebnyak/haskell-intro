import Network.HTTP
import Network.Stream

resp :: IO (Result (Response String))
resp = simpleHTTP $ getRequest "http://www.google.com"

main = do
  response <- simpleHTTP $ getRequest "http://google.com" --"https://doi.org/10.1038/d41586-019-03018-0"
  let body = fmap rspBody response
  print response
  -- print body


--   import Network.HTTP.Client
--   import Network.HTTP.Client.TLS
  
--   main :: IO ()
--   main = do
--       manager <- newManager tlsManagerSettings
--       ...  