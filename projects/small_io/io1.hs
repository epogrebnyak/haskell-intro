--main :: IO ()
--main = do
--  contents <- B.getContents
--  B.putStr contents


import qualified Data.ByteString.Lazy as BL
import qualified Data.ByteString as B
import Data.Vector (Vector)
import Data.Csv 


decode' :: BL.ByteString -> Either String (Vector (Vector BL.ByteString))
decode' = decode NoHeader 
getBytes filename = BL.readFile filename --"1.txt"

main :: IO ()
main = do
  contents <- getBytes "1.txt"
  BL.putStr contents  

-- This works:
-- (getBytes "1.txt") >>= BL.putStr


-- MINOR: Can this be helpful?  
type Matrix = Vector (Vector BL.ByteString)

-- TODO: I want a function that takes a filename or getBytes
--       and returns a Vector (Vector BL.ByteString)    

--getVectorOfVectors :: String -> IO (Either String (Vector (Vector BL.ByteString)))
getVectorOfVectors :: String -> IO(Either String Matrix)


{--

Treating CSV data as opaque byte strings

Sometimes you might want to work with a CSV file which contents is unknown to you. For example, you might want remove the second column of a file without knowing anything about its content. To parse a CSV file to a generic representation, just convert each record to a Vector ByteString value, like so:

>>> import Data.ByteString (ByteString)
>>> decode NoHeader "John,27\r\nJane,28\r\n" :: Either String (Vector (Vector ByteString))
Right [["John","27"],["Jane","28"]]

As the example output above shows, all the fields are returned as uninterpreted ByteString values.

--}


-- Reference
-- > :t getBytes
-- getBytes :: IO BL.ByteString

-- :t BL.putStr
-- BL.putStr :: BL.ByteString -> IO ()

-- :t (>>=)
-- (>>=) :: Monad m => m a -> (a -> m b) -> m b