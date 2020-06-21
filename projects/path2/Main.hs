-- Show directories from Windows PATH system variable line-by-line, 
-- sorted alphabetically.

-- Similar result in cmd.exe (without sorting):
--    for %a in ("%path:;=";"%") do @echo %~a

-- Or in python that is: 
-- python3 -c "import os; x=sorted(os.environ['PATH'].split(':')); print('\n'.join(x))"


module Main where

import Data.List
import Data.List.Split
import System.Environment
import Data.Char

-- use for testing
example = "C:\\tools\\ruby27\\bin;C:\\tools\\Cmder;C:\\tools\\Cmder\\vendor\\git-for-windows\\usr\\bin;C:\\Windows\\system32;C:\\Windows"

lower = fmap toLower

sort' :: String -> String
sort'  = unlines . sort . splitOn ";" 

sort'' :: String -> String
sort'' s = (unlines . sort) $ lower <$> (splitOn ";" s)

-- Also possible:
-- main = sort'' <$> getEnv "PATH" >>= putStrLn 

main = do
   paths <- getEnv "PATH"
   putStrLn $ sort'' paths 


-- Learning goals
-- ==============
-- 	Haskell:
-- - [x] <$> is fmap
-- - [x] desugar do notaton 

-- 	Cabal:
-- - [x] add split package to .cabal file
-- - [x] make the script compile on my computer with non-latin usename (https://gitlab.haskell.org/ghc/ghc/issues/18332) 

-- To repeat
-- =========
--  Cabal workflow https://cabal.readthedocs.io/en/latest/getting-started.html
--  Also via https://kowainik.github.io/projects/awesome-cabal

-- Not achieved
-- ============
-- 1. Could not use FilePath -> IO FilePath
--   see https://hackage.haskell.org/package/directory-1.2.0.1/docs/System-Directory.html#v:canonicalizePath
-- so that C:\WINDOWS\system32 and C:\Windows\system32 should be considered the same 
-- import System.Directory

-- 2. make work on linux and on Windows
--  :m + System.Info
-- os
-- "mingw32"
