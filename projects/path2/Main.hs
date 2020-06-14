-- Show directories from Windows PATH system variable line-by-line, 
-- sorted alphabetically.

-- Similar result in cmd.exe (without sorting):
--    for %a in ("%path:;=";"%") do @echo %~a

module Main where

import Data.List
import Data.List.Split
import System.Environment

sort' :: String -> String
sort' = (unlines . sort . splitOn ";")

main = sort' <$> getEnv "PATH" >>= putStrLn 

-- Also possible:
-- main = do
--   paths <- getEnv "PATH"
--   putStrLn $ (unlines . sort . splitOn ";") paths 



-- Learning goals
-- ==============
-- 	
-- - [x] add split package to .cabal file
-- - [x] combine IO actions
-- - [x] <$> is fmap
-- - [x] desugar do notaton 
-- - [ ] make it work on my computer as executable (https://gitlab.haskell.org/ghc/ghc/issues/18332) 
-- - [x] must use cabal v2-repl even in verion >3.0.0

