import System.Random

-- Count list items that accumulate to 1.
count :: (Num a, Ord a) => [a] -> Int
count xs = 1 + length xs' 
         where xs'= takeWhile (< 1) $ scanl1 (+) xs

-- Works of infinite list 
a = (return (repeat 0.015)) :: IO [Double]
fa = fmap count a 
--67 

-- Works on trimmed list of randoms
rio = randomRIO (0::Double, 1)         
b = sequence $ take 10 (repeat rio)
fb = fmap count b 
-- fb is usually 2 to 5

-- Hangs on infinite list of randoms
c = sequence (repeat rio)
fc = fmap count c
-- fc hangs... ;(