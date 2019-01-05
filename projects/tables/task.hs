type RowFormat = [Char]
expand :: RowFormat -> [(Char, Int)]
expand pat = [(c, count c (take (i+1) pat)) | (c, i) <- zip pat [0..]]

--accept positions year values = [(year, freq, period, x)
--    | (freq, period), x <- zip positions values]
   

msg a word b = (show a) ++ " " ++ word ++ " " ++ (show b)
assertEquals' a b = if a /= b then error $ msg a "not equal to" b 
                              else putStrLn "Passed"


data Value = Value {
    freq:: Char,
    year:: Int,
    period:: Int,
    x:: Float
} deriving Show

row = [100, 10, 40, 25, 25]
fmt = "aqqqq"
expected = [('a',1,100),('q',1,10),('q',2,40),('q',3,25),('q',4,25)]

count :: Char -> String -> Int
count letter str = length $ filter (== letter) str

split :: String -> [a] -> [(Char, Int, a)]
split fmt row = [(freq, count freq (fmt' i), x)   
               | (freq, x, i) <- zip3 fmt row [0..]]
               where fmt' i = take (i+1) fmt

-- split "aqqqq" [100, 10, 40, 25, 25]
-- [('a',1,100),('q',1,10),('q',2,40),('q',3,25),('q',4,25)]