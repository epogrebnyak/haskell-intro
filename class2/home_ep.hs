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
-- eval (Same x) = eval x 

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

class AsString a where
 -- repr() name inspired by python __repr__ magic method 
 repr :: a -> String
 repr _ = "not defined"

-- refactoring repeated code  
-- should I put showWith() into instance code?
-- showWith` is a simple funciton
showWith' x y sim = "(" ++ (repr x) ++ sim ++ (repr y) ++ ")"

-- showWith redulces some code
-- the intent is to try skip outer (), but cannot think of a way
showWith x y sim = infix id "(" ")" (infix repr x y sim) 
  where 
    infix f x y sim = (f x) ++ sim ++ (f y)

instance AsString Expr where
  -- maybe some lower-level function can be used instead 
  -- of show?
  repr (Lit x) = show x
  repr (Add x y) = showWith x y "+"
  repr (Subs x y) = showWith x y "-"
  repr (Div x y) = showWith x y "%"  
  repr (Mult x y) = showWith x y "*"   
  repr (Power x y) = showWith x y "^" 

-- a = Power (Mult (Lit 5) $ Add (Lit 1) (Lit 2)) (Lit 2)
-- repr a
-- "((5*(1+2))^2)"
-- eval a
-- 225

-- NOT TRIED:
-- can we use `deriving` in order make class printable in the console?
-- is there any easy way to skip outer parenthesis ()? 
-- looking at Prelude can we tll what # means?

{-
- Code specific for Ints.

-- | Convert an 'Int' in the range @0@..@15@ to the corresponding single
-- digit 'Char'.  This function fails on other inputs, and generates
-- lower-case hexadecimal digits.
intToDigit :: Int -> Char
intToDigit (I# i)
    | isTrue# (i >=# 0#)  && isTrue# (i <=#  9#) = unsafeChr (ord '0' + I# i)
    | isTrue# (i >=# 10#) && isTrue# (i <=# 15#) = unsafeChr (ord 'a' + I# i - 10)
    | otherwise =  errorWithoutStackTrace ("Char.intToDigit: not a digit " ++ show (I# i))

showSignedInt :: Int -> Int -> ShowS
showSignedInt (I# p) (I# n) r
    | isTrue# (n <# 0#) && isTrue# (p ># 6#) = '(' : itos n (')' : r)
    | otherwise                              = itos n r
-}