-- Parse a string like "Gross domestic product, bln rub"
-- into a data structure that contains labels "GDP" and "bln_rub"

-- Posted for review at:
-- https://codereview.stackexchange.com/questions/204872/find-labels-in-string-in-haskell 

import Data.List (isInfixOf)

type Label = Maybe String

data Variable = Variable
    { name :: Label,
      unit :: Label
    } deriving (Show, Eq)

makeVariable :: String -> String -> Variable 
makeVariable name unit = Variable (Just name) (Just unit) 

isDefined:: Variable -> Bool
isDefined var = (name var /= Nothing) && (unit var /= Nothing) 

isIdentical:: Variable -> String -> String -> Bool
isIdentical var name unit = (makeVariable name unit) == var  

-- Map allows a readable view of tuple-like 
-- associative stucture.     
data Map = Map 
    { label :: String,
      texts :: [String] -- note: can use non-empty List 
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
--          to list of tuples which are used for searching a header
asTuples :: Map -> [(String, String)]   
asTuples (Map label texts) = [(text, label) | text <- texts]  

findAllKeys :: [(String, String)] -> String -> [String]
findAllKeys mapper header = [key | tup@(text, key) <- mapper,  
                                text `isInfixOf` header]

getLabel :: [Map] -> String -> Label
getLabel maps' header = case findAllKeys (flatten' maps') header of 
        [] -> Nothing
        (x:_) -> Just x
    where flatten' = concatMap asTuples
 
getName = getLabel nameMaps
getUnit = getLabel unitMaps
parseHeader text = Variable (getName text) (getUnit text)

x = parseHeader "Gross domestic product, bln rub"
flag = (isDefined x) && (isIdentical x "GDP" "bln_rub")
raise x = error ("Something wrong with: " ++ show x) 

main = do
    if flag then putStrLn $ show x else
      raise x   
    return ()

-- NEXT: what is a path to learn CSV file handling with cassava?
--       I would like to import a CSV file as list of lists.
-- 
-- Sample CSV:
-- 
-- Gross domestic product, bln rub
-- 1999 100 110 120 125
-- 2000 130 125 140 150
---

-- Note: ReadP at 
-- http://hackage.haskell.org/package/base-4.11.1.0/docs/Text-ParserCombinators-ReadP.html