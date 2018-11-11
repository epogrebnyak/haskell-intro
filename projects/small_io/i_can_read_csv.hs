-- Read CSV file from disk and test contents 

import qualified Data.ByteString.Lazy as BL
import qualified Data.ByteString as B
import Data.Vector (Vector, fromList)
import Data.ByteString.Char8 (pack, unpack)


-- was: BL!
type bString  = B.ByteString
-- lets have a proprietary data format
-- to reporesent a matrix  of bytestrings
type Matrix = Vector (Vector bString)

-- fromList $ map pack ["1.0", "2.0"]
stringsToVector :: [String] -> Vector bString
stringsToVector argList = fromList $ map pack argList

m_ :: Matrix
m_ = fromList [stringsToVector ["1.0", "2.0"], 
              stringsToVector ["abc", "def"]] 
-- TODO: accept ["1.0", "2.0"], ["abc", "def"] as argument 

-- RESULT: Now we have a Matrix m_ to work with as for testing 
-- of CSV input

-- NEXT: read CSV input and compere to m'.

