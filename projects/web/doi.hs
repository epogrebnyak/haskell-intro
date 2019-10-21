-- http://dev.stephendiehl.com/hask/#http

-- https://stackoverflow.com/questions/21371316/reading-file-from-website-in-haskell

-- wreq and http-client-tls support HTTPS out of the box. YMMV. There's a reason I don't really recommend older Haskell libraries even if they're maintained. The foundation of many libraries is http-client and it's a pretty popular library to use. It's used in http-conduit and pipes-http as well. The latter of which is a single 130 line module that has required almost zero maintenance in the past two years to add pipes streaming support to http-client. Things that use http-client are generally nice but you'll often want to use something higher level than http-client itself, such as wreq.
-- https://bitemyapp.com/blog/haskell-is-not-trivial-not-unfair/  

-- a struggle to install http-conduit
-- https://stackoverflow.com/questions/13200580/haskell-could-not-find-module-network-http-conduit


-- import Network.HTTP
-- main = do
--   response <- simpleHTTP $ getRequest "https://doi.org/10.1038/d41586-019-03018-0"
--   let body = fmap rspBody response
--   print response
--   print body


-- http://www.serpentine.com/wreq/tutorial.html

import Network.Wreq

main = do 
  r <- get "http://httpbin.org/get"
  