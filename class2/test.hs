
data User = User {
  userName :: String,
  userEmail :: String
  }
  deriving (Show)


main :: IO ()
main = do { putStrLn "Hello" ; putStrLn "World" ; }
