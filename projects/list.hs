-- This script is intended to parse a string like "Gross domestic product, bln rub"
-- into a data structure that contains labels "GDP" and "bln_rub"

-- QUESTION: can I import just one or several functions from a module? with ()?
import Data.List

-- COMMENT: Here I wanted to use Nothing, but it is in conflict with 
-- Nothing already defined in Main. Is None ok here?
data Label = Label String 
            | None 
            deriving (Show, Eq) 

data Variable = Variable
    { name :: Label,
      unit :: Label
    } deriving (Show, Eq)

data Map = Map 
    { label :: String,
      texts :: [String]
    } deriving (Show)

nameMaps = [
      Map "GDP" ["Gross domestic product"]
    , Map "INDPRO" ["Industrial production"]
    ]

unitMaps = [
      Map "bln_rub" ["bln rub", "billion ruble"]
    , Map "rog" ["% change to previous period"] -- rate of growth
    ] 

-- COMMENT: code below converts nameMaps and unitMaps
--          to list of tuples whic I use for searching entries 
asTuples :: Map -> [(String, String)]   
asTuples (Map label texts) = [(text, label) | text <- texts]  

allKeys :: [(String, String)] -> String -> [String]
allKeys mapper header = [key | tup@(text, key) <- mapper,  text `isInfixOf` header]

getLabel :: [Map] -> String -> Label
getLabel maps' header = let mapper = concatMap asTuples maps' in   
    case allKeys mapper header of 
        [] -> None
        (x:_) -> Label x

getName = getLabel nameMaps
getUnit = getLabel unitMaps
parseHeader text = Variable (getName text) (getUnit text)
x = parseHeader "Gross domestic product, bln rub"
-- QUESTION: can I have a unit test similar to assert x == Variable (Label "GDP") (Label "bln_rub")  
isAccepted = x == Variable (Label "GDP") (Label "bln_rub")
-- 
main = do
    -- QUESTION: When I run the program I do not see the output on screen 
    putStrLn $ show x
    -- return ()

-- NEXT: what is a path to learn CSV file handling with cassava?
--       I would like to import a CSV file as list of lists.
-- 
-- Sample CSV:
-- 
-- Gross domestic product, bln rub
-- 1999 100 110 120 125
-- 2000 130 125 140 150
---




