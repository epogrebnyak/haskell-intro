-- lets keep it to integers
power :: Int -> Int -> Int
power x 0 = 1
power x 1 = x
power x n | n > 1  = x * power x (n-1)
          | n < 0  = error "We do not support  it" --1 / power x (n * (-1))
                                                   -- require Fractional type  

-- Q: from GHCI can I find the lower bound on type Int?
-- TODO: look actaul code for **, ^ 
