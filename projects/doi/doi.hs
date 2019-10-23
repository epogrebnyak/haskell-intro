-- Replicate calls to bibliography server
-- https://github.com/nushio3/citation-resolve/blob/master/src/Text/CSL/Input/Identifier/Internal.hs#L142-L152
-- Requires sudo apt-get install libcurl4-gnutls-dev


-- | resolvers for specific document IDs.
-- resolveDOI :: MonadIO m => RM m String String
-- resolveDOI docIDStr = do
--   let
--       opts = [ CurlFollowLocation True
--              , CurlHttpHeaders ["Accept: text/bibliography; style=bibtex"]
--              ]
--       url = "http://dx.doi.org/" ++ docIDStr
--   bs <- liftIOE $ openURIWithOpts opts url
--   return $ BS.unpack bs

import qualified Data.ByteString.Char8 as B
import Network.Curl.Download (openURIWithOpts)
import Network.Curl.Opts (CurlOption(CurlFollowLocation, CurlHttpHeaders))

type URL = String


get :: URL -> IO (Either String B.ByteString)
get url = openURIWithOpts opts url where 
    opts = [ CurlFollowLocation True,
             CurlHttpHeaders ["Accept: application/vnd.citationstyles.csl+json"]
           ]    

--save :: FilePath -> IO (Either String B.ByteString) -> IO ()           
save filename (Right content) = writeFile filename (B.unpack content)
-- save filename (Left _) = return 

-- TODO:
-- saveURL :: URL -> FilePath -> IO()
-- saveURL url filename = (get url) >>= (save filename)

url = "https://doi.org/10.3982/ECTA11427"
a = get "https://doi.org/10.3982/ECTA11427"

main = do 
    a >>= print
    a >>= (save "10.3982_ECTA11427.txt")

