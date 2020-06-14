-- # GNU tools example: 
-- https://wiki.haskell.org/Simple_Unix_tools

-- # Make it work on WSL:
-- https://stackoverflow.com/questions/40893480/filename-argument-in-haskell
-- https://devblogs.microsoft.com/commandline/haskell-on-bashwsl/

import System.Environment
 
-- First, three helpers
io f = interact (unlines . f . lines)
 
showln  = (++ "\n") . show

-- Count number of lines in a file, like wc -l
nlines  = showln . length . lines
 
-- And our main wrapper
main :: IO ()
main = do
    args <- getArgs                      -- now `args :: [String]`
    -- contents <- B.readFile (head args)
    print (head args)