-- https://ocharles.org.uk/guest-posts/2013-12-12-24-days-of-hackage-pandoc.htm

module Pandocer where 

import Text.Pandoc

textToConvert = unlines [ "Hello World."
                        , ""
                        , "    this is a Markdown code block"
                        , ""
                        , "[This is a link](http://www.latermuse.com/)" ]

