-- http://howistart.org/posts/haskell/1/
-- module Main where

    import Data.Char
    import qualified Data.ByteString.Lazy as BL
    import qualified Data.Vector as V
    -- from cassava
    import Data.Csv
    
    -- a simple type alias for data
    -- type BaseballStats = (BL.ByteString, Int, BL.ByteString, Int)
    
    -- >>> import Data.ByteString (ByteString)
    -- >>> decode NoHeader "John,27\r\nJane,28\r\n" :: Either String (Vector (Vector ByteString))
    -- Right [["John","27"],["Jane","28"]]
    
    type ByteMatrix = V.Vector (V.Vector BL.ByteString)
    type ByteMatrix = V.Vector (V.Vector BL.ByteString)

    myOptions = defaultDecodeOptions {
        decDelimiter = fromIntegral (ord '\t')
      }

    -- work inside monad
    useRight (Right x) = show x  
    useRight (Left x) = error x  

    -- map by row http://hackage.haskell.org/package/cassava-0.5.1.0/docs/Data-Csv.html
    -- row head and row tail
    -- if rowhead is integer it is a data row
    -- if rowhead is not integer it is a title row
    -- table has one or several title rows
    --           and datarows    
    -- todo: row data structure, table data structure
    -- reading of "gdp.csv" must be a list of two tables 


    main :: IO ()
    main = do
      csvData <- BL.readFile "gdp.csv" -- full file "batting.csv"
      -- let v = decode NoHeader csvData :: Either String (V.Vector BaseballStats)
      -- let summed = fmap (V.foldr summer 0) v
      -- putStrLn $ "Total atBats was: " ++ (show summed)
      -- where summer (name, year, team, atBats) n = n + atBats
      
      let z = decodeWith myOptions NoHeader csvData :: Either String ByteMatrix
      putStrLn $ useRight z