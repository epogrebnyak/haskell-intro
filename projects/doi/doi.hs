-- Replicate calls to bibliography server
-- https://github.com/nushio3/citation-resolve/blob/master/src/Text/CSL/Input/Identifier/Internal.hs#L142-L152
-- Requires sudo apt-get install libcurl4-gnutls-dev

-- Source code:
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

{-# LANGUAGE OverloadedStrings #-}
import qualified Data.ByteString.Char8 as B
import Data.Text (pack, unpack, replace, append, toLower)
import Network.Curl.Download (openURIWithOpts)
import Network.Curl.Opts (CurlOption(CurlFollowLocation, CurlHttpHeaders))

type URL = String
data Handle = DOI String | ISBN String deriving Show

fromWeb :: URL -> IO (Either String B.ByteString)
fromWeb url = openURIWithOpts opts url where 
    opts = [ CurlFollowLocation True,
             CurlHttpHeaders ["Accept: application/vnd.citationstyles.csl+json"]
           ]    

save :: FilePath -> Either String B.ByteString -> IO ()           
save filename (Right content) = writeFile filename (B.unpack content)
save filename (Left _) = return () -- do nothing

url :: Handle -> URL
url (DOI s) = "https://doi.org/" ++ s
url (ISBN s) = "https://isbn.org/" ++ s -- not real url

str :: Handle -> String
str (DOI s) = "doi:" ++ s
str (ISBN s) = "isbn:" ++ s

filename :: Handle -> FilePath
filename h = (unpack . changes . pack . str) h
      where changes = ( toLower . (\x -> append x ".txt") . 
                                  (replace "." "_") . 
                                  (replace "/" "_") . 
                                  (replace ":" "_") )
       
load :: Handle -> IO()
load h = (fromWeb (url h)) >>= (save (filename h))

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
