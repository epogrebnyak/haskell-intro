-- https://ocharles.org.uk/guest-posts/2013-12-12-24-days-of-hackage-pandoc.htm
-- https://github.com/jgm/pandoc/issues/683

module Lib
    ( someFunc
    ) where

import Text.Pandoc

textToConvert = unlines [ "Hello World."
                        , ""
                        , "    this is a Markdown code block"
                        , ""
                        , "[This is a link](http://www.latermuse.com/)" ]

pandocParsed = readMarkdown def textToConvert

someFunc :: IO ()
someFunc = putStrLn "someFunc"

pandocConverted = writeLaTeX def pandocParsed

convertedToHtml = writeHtml def pandocParsed

convertedToOpenDocument = writeOpenDocument opts pandocParsed
  where
    opts = def { writerWrapText = True -- Enable text wrapping
               , writerColumns = 80 }  -- Set column width to 80

