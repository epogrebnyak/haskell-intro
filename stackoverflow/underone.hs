import System.Random

-- Obtaining n through limits
-- See https://twitter.com/InertialObservr/status/1183489675274510336
--     https://twitter.com/InertialObservr/status/1183489675274510336

import System.Random
inf = repeat (randomRIO (0::Double,1))

main = do
    let xs = sequence $ take 3 inf
    repr <- fmap show xs
    putStrLn repr
    
-- Sum numbers in a list until acc is greater than m
sumif :: (Num a, Ord a) => Int -> a -> a -> [a] -> Maybe Int
sumif k acc m (x:xs) = if acc >= m then Just k else sumif (k+1) (acc+x) m xs 
sumif _ _ _ [] = Nothing
count = sumif 0 0.0 1.0



-- Count list items that accumulate to 1.
cnt :: (Num a, Ord a) => [a] -> Int
cnt xs = 1 + length xs' 
         where xs'= takeWhile (< 1) $ scanl1 (+) xs

-- Works of infinite list 
a = (return (repeat 0.015)) :: IO [Double]
fa = fmap cnt a --67 

-- Works on trimmed list of randoms
rio = randomRIO (0::Double, 1)         
b = sequence $ take 10 (repeat rio)
fb = fmap cnt b 

-- Hangs on infinite list of randoms
c = sequence (repeat rio)
fc = fmap cnt c 


rs = [0.564, 0.104, 0.452, 5.5e-2, 0.897]
s = return rs :: IO [Double]
s' = sequence inf


-- TODO: Need a function that computes the number of items from [xs] summed before 
--       the summ reaches a limit m.
--       Get this number 10_000 times. 
--       An average will be near e.


