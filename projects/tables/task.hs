-- split a row to values

fmt = "ahh"
rows = [2017, 100, 10, 90], [2018, 120, 40, 80] 

module Row where

type RowFormat = [Char]

count :: Char -> String -> Int
count letter str = length $ filter (== letter) str

expand :: RowFormat -> [(Char, Int)]
expand pat = [(c, count c (take (i+1) pat)) | (c, i) <- zip pat [0..]]

{-
split' :: RowFormat -> [a] -> [(Char, Int, a)]
split' fmt values = zipWith merge (expand fmt) values
      where merge (freq, period) value = (freq, period, value) 
-}

splitter fmt = \values -> zipWith merge pos values
      where 
        merge (freq, period) value = (freq, period, value)
        pos = expand fmt 
splitRow5 = splitter "aqqqq" 
a = splitRow5 [100, 10, 40, 25, 25]


data Value = Value {
    freq:: Char,
    year:: Int,
    period:: Int,
    x:: Float
} deriving Show

row = [100, 10, 40, 25, 25]
fmt = "aqqqq"
expected = [('a',1,100),('q',1,10),('q',2,40),('q',3,25),('q',4,25)]


split :: String -> [a] -> [(Char, Int, a)]
split fmt row = [(freq, count freq (fmt' i), x)   
               | (freq, x, i) <- zip3 fmt row [0..]]
               where fmt' i = take (i+1) fmt

-- split "aqqqq" [100, 10, 40, 25, 25]
-- [('a',1,100),('q',1,10),('q',2,40),('q',3,25),('q',4,25)]