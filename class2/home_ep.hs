-- TODO: make a typeclass to show expressions 

data Expr   -- abstract syntax tree
  = Lit Int  -- 1
  | Same Expr
  | Add Expr Expr   -- 2 + (4 + 5)
  | Subs Expr Expr   -- 2 - (4 + 5)
  | Mult Expr Expr   -- 2 * (4 + 5)
  | Div Expr Expr   -- 2 / (4 + 5)
  | Power Expr Expr   -- 2 ** (4 + 5)

  -- let a = 4 + 5 in a + a = (4+5) + (4+5)

eval :: Expr -> Int
-- I use pattern matching and 'argument unpacking' to catch x and y 
-- `Same` constructor helps me to undestand how to evaluate 
-- same expession with eval()
eval (Same x) = eval x 
eval (Lit x) = x
eval (Add x y) = (eval x) + (eval y)  
eval (Subs x y) = (eval x) - (eval y)  
eval (Div x y) = (eval x) `div` (eval y)  
eval (Mult x y) = (eval x) * (eval y) 
eval (Power x y) = power (eval x) (eval y)  

-- comments for**, ^, ^^ are at 
-- https://wiki.haskell.org/Power_function 

-- lets constrain the function to integers
power :: Int -> Int -> Int
power x 0 = 1
power x 1 = x
power x n | n > 1  = x * power x (n-1)
          | n < 0  = error "We do not support negative powers"
                    -- 1 / power x (n * (-1))
                    -- requires Fractional type  

-- will not  work without parenthesis, see also $
-- *Main> eval (Same (Lit 1))
-- 1

-- *Main> eval (Add (Lit 1) (Lit 5))
-- 6     

-- eval (Power (Lit 2) (Lit 4))
-- 16

main = return ()
