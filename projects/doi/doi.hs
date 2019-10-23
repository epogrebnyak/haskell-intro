-- https://github.com/nushio3/citation-resolve/blob/master/src/Text/CSL/Input/Identifier/Internal.hs#L142-L152

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

import           Network.Curl.Download (openURIWithOpts)
import           Network.Curl.Opts (CurlOption(CurlFollowLocation, CurlHttpHeaders))
main = do 
    let
        opts = [ CurlFollowLocation True
               , CurlHttpHeaders ["Accept: text/bibliography; style=bibtex"]
               ]
        url = "http://dx.doi.org/" ++ docIDStr
    openURIWithOpts opts url    
