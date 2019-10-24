-- Replicate calls to bibliography server

-- Similar package (outdated bibliographic APIs, but does nocal caching nicely)
-- https://github.com/nushio3/citation-resolve/blob/master/src/Text/CSL/Input/Identifier/Internal.hs#L142-L152


{-# LANGUAGE OverloadedStrings #-}
import qualified Data.ByteString.Char8 as B
import Data.Text (pack, unpack, replace, toLower)
import Network.Curl.Download (openURIWithOpts)
import Network.Curl.Opts (CurlOption(CurlFollowLocation, CurlHttpHeaders))

type URL = String
data Handle = DOI String | ISBN String deriving Show

curl :: URL -> CurlHttpHeaders -> IO (Either String B.ByteString)
curl url header = openURIWithOpts opts url where 
    opts = [ CurlFollowLocation True,
             CurlHttpHeaders header
           ]    

save :: FilePath -> Either String B.ByteString -> IO ()           
save filename (Right content) = writeFile filename (B.unpack content)
save filename (Left _) = return () -- do nothing

retrieveDOI s = curl url header
    where url = "https://doi.org/" ++ s 
          header = CurlHttpHeaders ["Accept: application/vnd.citationstyles.csl+json"]   

retrieve (DOI s) = retrieveDOI s
retrieve _ = return (Left "Not supported")

str :: Handle -> String
str (DOI s) = "doi:" ++ s
str (ISBN s) = "isbn:" ++ s

filename :: Handle -> FilePath
filename h = ((unpack . changes . pack . str) h) + ".txt" 
      where changes = (toLower . 
                       (replace "." "_") . 
                       (replace "/" "_") . 
                       (replace ":" "_")
                       )
       
loadLocal :: Handle -> IO()
loadLocal h = (retrieve h) >>= (save (filename h))

-- TODO: must read file the local file if it exists
--       and query web and save if it does not
--       return value in any case
get h = readFile $ filename h

h = DOI "10.3982/ECTA11427"

main = load $ DOI "10.3982/ECTA11427"

-- NEXT: make sample output using python program
-- NEXT: say what python program does not do
-- NEXT: read a local file as JSON or CSL item
-- NEXT: correct csl item so that it fits pandoc-cslproc
-- NEXT: make bibliography
-- NEXT: make it a small package
