
data Value
  = IntVal Int
  | StrVal String
  deriving (Show)

data Expr   -- abstract syntax tree
  = Lit Value  -- 1
  | Var String   -- a
  | Add Expr Expr   -- 2 + (4 + 5)
  | Mul Expr Expr   -- 2 * (4 * 5)
  | Bind String Expr Expr
  deriving (Show)
                    -- let a = 4 + 5 in a + a = (4+5) + (4+5)

data Result  -- Either String Value
  = Success Value
  | Failure String
  deriving (Show)

andThen :: Result -> (Value -> Result) -> Result
andThen (Failure err) _ = Failure err
andThen (Success v) f = f v

data BindResult -- Maybe Value
  = Undefined
  | Defined Value
  deriving (Show)

emptyScope :: String -> BindResult
emptyScope _ = Undefined

eval :: (String -> BindResult) -> Expr -> Result
eval _ (Lit v) = Success v
eval f (Var var) = case f var of
  Undefined -> Failure "variable is not in scope"
  Defined v -> Success v
eval f (Add e1 e2) =
  eval f e1 `andThen` (\v1 ->
  eval f e2 `andThen` (\v2 ->
  add v1 v2))

{-
eval (Add e1 e2) = do
  v1 <- eval e1  -- (>>=)
  v2 <- eval e2
  add v1 v2
-}

{-
eval (Add e1 e2) = case eval e1 of
  Failure err -> Failure err
  Success v1 -> case eval e2 of
    Failure err -> Failure err
    Success v2 -> add v1 v2
    -}
eval f (Mul e1 e2) = case eval f e1 of
  Failure err -> Failure err
  Success v1 -> case eval f e2 of
    Failure err -> Failure err
    Success v2 -> mul v1 v2

eval f (Bind var e1 e2) =
  eval f e1 `andThen` \v1 ->
  let g n = case n == var of
        True -> Defined v1
        False -> f n
  in eval g e2

add :: Value -> Value -> Result
add (IntVal i1) (IntVal i2) = Success (IntVal (i1 + i2))
add (StrVal str1) (StrVal str2) =
  Success (StrVal (str1 ++ str2))
add v1 v2 = Failure "types doesn't match in add"

mul :: Value -> Value -> Result
mul (IntVal i1) (IntVal i2) = Success (IntVal (i1 * i2))
mul _ _ = Failure "types doesn't match in add"

pow :: Int -> Int -> Int
pow = undefined -- pow 2 4 = 16 = 2^4

one :: Value
one = IntVal 1

two :: Value
two = IntVal 2

three :: Value
three = IntVal 3

{-
 * implement eval function
 * extend Expr with more operators
 * extend Expr with more literals
 * extend it with variable bindings
-}
