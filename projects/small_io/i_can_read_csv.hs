-- Read CSV file from disk and test contents 

import qualified Data.ByteString.Lazy as BL
import qualified Data.ByteString as B
import Data.Vector (Vector, fromList, (!))
import Data.ByteString.Lazy.Char8 (pack, unpack)


-- was: BL.ByteString
type ByteStr  = BL.ByteString
-- proprietary data format to reporesent a matrix of bytestrings
type ByteMatrix = Vector (Vector ByteStr)

stringsToVector :: [String] -> Vector ByteStr
stringsToVector stringList = fromList $ map pack stringList

toByteMatrix :: [[String]] -> ByteMatrix
toByteMatrix stringMatrix = fromList $ map stringsToVector stringMatr

bmSample :: ByteMatrix               
bmSample = toByteMatrix [["abc", "def"], ["1.0", "2.0"]]              

isEqual a b = if (a == b) then print(True) 
              else error "not equal"

            
decode' :: BL.ByteString -> Either String Matrix
decode' = decode NoHeader 
getBytes filename = BL.readFile filename --"1.txt"




--main = do            
--    isEqual m_ p_ --True