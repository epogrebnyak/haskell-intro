-- Read CSV file, split it to tables, extract values from tables
-- "gdp.csv" -> [Table] -> [Value]


-- http://howistart.org/posts/haskell/1/
-- module Main where

    import Data.Char
    import qualified Data.ByteString.Lazy as BL
    import qualified Data.Vector as V
    -- from cassava
    import Data.Csv
    
    -- >>> import Data.ByteString (ByteString)
    -- >>> decode NoHeader "John,27\r\nJane,28\r\n" :: Either String (Vector (Vector ByteString))
    -- Right [["John","27"],["Jane","28"]]
    
    type ByteMatrix = V.Vector (V.Vector BL.ByteString)

    myOptions = defaultDecodeOptions {
        decDelimiter = fromIntegral (ord '\t')
      }

    -- parse long bytestring into matrix of strings
    toMatrix :: BL.ByteString -> Either String ByteMatrix
    toMatrix bytestring = 
        decodeWith myOptions NoHeader bytestring -- :: Either String ByteMatrix 

    -- work inside Either monad
    useRight (Right x) = show x  
    useRight (Left x) = error x  

    main :: IO ()
    main = do 
        csvData <- BL.readFile "gdp.csv"
        let m = toMatrix csvData
        putStrLn $ useRight m
