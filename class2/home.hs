
data Expr   -- abstract syntax tree
  = Lit Int  -- 1
  | Add Expr Expr   -- 2 + (4 + 5)
                    -- let a = 4 + 5 in a + a = (4+5) + (4+5)

eval :: Expr -> Int


{-
 * implement eval function
 * extend Expr with more operators
 * extend Expr with more literals
 * extend it with variable bindings
-}
