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
-- I use pattern matching and 'agument unpacking' to catch x and y 
-- Same constructor helps me to undestand how to evaluate 
-- same expession with eval()
eval (Same x) = eval x 
eval (Lit x) = x
eval (Add x y) = (eval x) + (eval y)  
eval (Subs x y) = (eval x) - (eval y)  
eval (Div x y) = (eval x) `div` (eval y)  
eval (Mult x y) = (eval x) * eval(y)  

-- Question 1: a better way to make power function?
-- Maybe need sopmething like this for Power:
-- eval (Power x y) =  if y == 1  then  eval(x) else 
--                       (eval x) * (Power x eval(Subs eval(y) Lit 1))  

-- This option with 'guards' did not work
-- https://stackoverflow.com/questions/5768570/function-guard-syntax-in-haskell
-- eval (Power x y) =  
--     | eval(y) == 1     = eval(x) 
--     | eval(y) != 1     = eval x * (Power x (eval(y) - 1))  

-- Question 2:
-- Why doesn't this work without parenthesis? 
-- *Main> eval (Same (Lit 1))
-- 1

-- *Main> eval (Add (Lit 1) (Lit 5))
-- 6                                

main = return ()
