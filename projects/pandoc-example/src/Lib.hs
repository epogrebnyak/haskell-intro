-- https://pandoc.org/using-the-pandoc-api.html

module Lib where

import Text.Pandoc
import qualified Data.Text as T
import qualified Data.Text.IO as TIO

textToConvert = T.pack ( unlines [ "Hello World."
                        , ""
                        , "    this is a Markdown code block"
                        , ""
                        , "[This is a link](http://www.latermuse.com/)" ] )

-- doc' = readMarkdown def (T.pack "[testing](url)")

pan :: IO ()
pan = do
  result <- runIO $ do
    doc <- readMarkdown def (T.pack "[testing](url)")
    writeRST def doc
  rst <- handleError result
  TIO.putStrLn rst