-- Retrieve bibliographic information based on DOI and other handles.
-- For use with pandoc and pandoc-citeproc.

{-# LANGUAGE OverloadedStrings #-}

import qualified Data.ByteString.Char8 as B
import Data.Text (pack, unpack, toLower)
-- requires libcurl installation `sudo apt-get install libcurl4-gnutls-dev`
import Network.Curl.Download (openURIWithOpts)
import Network.Curl.Opts (CurlOption(CurlFollowLocation, CurlHttpHeaders))

type URL = String
data Handle = DOI String | ISBN String deriving Show

prefixWith p s = p ++ ":" ++ s
prefix (DOI s) = prefixWith "doi" s 
prefix (ISBN s) = prefixWith "isbn" s

filename h = (lower . under . str) h ++ ".txt"
    where
      chars = "./:" 
      under = map (\s -> if s `elem` chars then '_' else s)
      lower = unpack . toLower . pack

curl :: URL -> CurlOption -> IO (Either String B.ByteString)
curl url header = openURIWithOpts opts url where 
    opts = [ CurlFollowLocation True,
             header
           ]    

retrieveDOI s = curl url header
    where url = "https://doi.org/" ++ s 
          header = CurlHttpHeaders ["Accept: application/vnd.citationstyles.csl+json"]   

retrieve (DOI s) = retrieveDOI s
retrieve _ = return (Left "Not supported")

save :: FilePath -> Either String B.ByteString -> IO ()           
save filename (Right content) = writeFile filename (B.unpack content)
save filename (Left _) = return () -- do nothing

loadLocal :: Handle -> IO()
loadLocal h = (retrieve h) >>= (save (filename h))

-- TODO: must read file the local file if it exists
--       and query web and save if it does not
--       Must return value in any case
get h = readFile $ filename h

main = loadLocal $ DOI "10.3982/ECTA11427"

d = DOI "10.3982/ECTA11427"
-- filename d is "doi_10_3982_ecta11427.txt"

-- NEXT:
-- link to pandoc-citeproc: csl item probably goes to metadata
-- trace citeproc call to Pandoc metadata or bibliography
-- correct csl item from DOI so that it fits pandoc-cslproc

-- OTHER:
-- make it a small package eg. doi-echo
-- read a local file as JSON or CSL item (will deal with aeson) - for `get h`

-- NOT TODO:
-- Similar package (outdated bibliographic APIs, but does local db caching nicely)
-- https://github.com/nushio3/citation-resolve/blob/master/src/Text/CSL/Input/Identifier/Internal.hs#L142-L152
