-- Split rows to values

module Row (split) where

type RowFormat = [Char]

count :: Char -> String -> Int
count letter str = length $ filter (== letter) str

expand :: RowFormat -> [(Char, Int)]
expand pat = [(c, count c (take (i+1) pat)) | (c, i) <- zip pat [0..]]

splitOne :: [(Char, Int)] -> [a] -> [(Char, a, Int, a)]
splitOne pattern row = zipWith merge pattern values
    where 
        merge (freq, period) x = (freq, year, period, x)
        year = head row
        values = tail row

splitMany :: RowFormat -> [[a]] -> [(Char, a, Int, a)]
splitMany fmt rows = (concat $ map f' rows)
    where 
        f' = splitOne (expand fmt)

split = splitMany

main = (putStrLn $ show [bool_1, bool_2])
    where 
        bool_1 = split "ahh" [[2017, 100, 50, 50], [2018, 120, 40, 80]] == [('a',2017,1,100),('h',2017,1,50),('h',2017,2,50),('a',2018,1,120),('h',2018,1,40),('h',2018,2,80)]
        bool_2 = split "aqqqq" [[2020, 100, 10, 40, 25, 25]] == [('a',2020,1,100),('q',2020,1,10),('q',2020,2,40),('q',2020,3,25),('q',2020,4,25)]
