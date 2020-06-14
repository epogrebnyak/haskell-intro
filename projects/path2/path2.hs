import Data.List.Split
import System.Environment

s = splitOn ";"

main = do
  path <- getEnv "PATH"  
  putStrLn (s path)

-- TODO: desugar do