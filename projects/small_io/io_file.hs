{-# LANGUAGE ScopedTypeVariables #-}

import Data.Csv
import Data.Vector (Vector)
import Data.ByteString.Lazy.Char8 (pack)

-- https://hackage.haskell.org/package/cassava-0.5.1.0/docs/Data-Csv.html


-- >>> decode NoHeader "John,27\r\nJane,28\r\n" :: Either String (Vector (Text, Int))


-- Right [("John",27),("Jane",28)]
-- x = decode NoHeader "John,27\r\nJane,28\r\n"

import qualified Data.ByteString.Lazy as BL
import Data.Csv
import qualified Data.Vector as V

--getBytes = BL.readFile "1.txt"
--x = BL.readFile "1.txt" =>> decode NoHeader 

main :: IO ()
main = do
    csvData <- BL.readFile "1.txt"
    case decode NoHeader csvData of
        Left err -> putStrLn err
        -- Does
        Right v -> do 
            -- let _ = v :: Matrix 
            putStrLn (show (v:: Matrix))
            -- V.forM_ v $ \ (name, salary :: Int) ->
            -- putStrLn $ name ++ " earns " ++ show salary ++ " dollars"



-- Read the file and print its contents
-- https://stackoverflow.com/questions/7867723/haskell-file-reading

main1 = do 
    s <- readFile "1.txt"
    print s

-- This will not work, what is "print" vs "putStrLn"