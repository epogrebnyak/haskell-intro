-- Retrieve bibliographic information based on DOI and other handles.
-- Use bibliographic information in pandoc / pandoc-citeproc.

{-# LANGUAGE OverloadedStrings #-}
import qualified Data.ByteString.Char8 as B
import Data.Text (pack, unpack, replace, toLower)
import Network.Curl.Download (openURIWithOpts)
import Network.Curl.Opts (CurlOption(CurlFollowLocation, CurlHttpHeaders))

type URL = String
data Handle = DOI String | ISBN String deriving Show

curl :: URL -> CurlOption -> IO (Either String B.ByteString)
curl url header = openURIWithOpts opts url where 
    opts = [ CurlFollowLocation True,
             header
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

toUnderscore chars s = if s `elem` chars then "_" else s

filename :: Handle -> FilePath
filename h = ((unpack . changes . pack . str) h) ++ ".txt" 
      where changes = (toLower . 
                       (replace "." "_") . 
                       (replace "/" "_") . 
                       (replace ":" "_")
                       )                       

loadLocal :: Handle -> IO()
loadLocal h = (retrieve h) >>= (save (filename h))

-- TODO: must read file the local file if it exists
--       and query web and save if it does not
--       Must return value in any case
get h = readFile $ filename h

h = DOI "10.3982/ECTA11427"

main = loadLocal $ DOI "10.3982/ECTA11427"

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


