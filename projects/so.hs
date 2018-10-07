-- https://stackoverflow.com/questions/52692206/proper-suffixes-in-haskell


-- > suffixes "123"
-- ["23","3",""]
-- > suffixes "1"
-- [""]


postfix :: String -> [String]
postfix "" = []
postfix (_:xs) = xs:(postfix xs)

suffixes :: [a] -> [[a]]
suffixes [] = []
suffixes (_:t) = t : suffixes t

-- from answer:
-- what does @ do?
suffixes' :: [a] -> [[a]]
suffixes' [] = []
suffixes' (_:xs) = go xs
    where go [] = [] : []
          go f@(_:t) = f: go t