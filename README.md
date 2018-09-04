# haskell-intro
Short overview of Haskell concepts


#### Tutor:

*Y*: @yuras

#### Student background:

Write something abnout what you do and your interests, perhaps add few links - it helps our tutor to prepare: 

- **EP**: economist by education, interested in unit testing and reproducible 
  economic research, eg  [data science projects as a data pipeline](https://github.com/drivendata/cookiecutter-data-science).
  Maintainer of [mini-kep macroeconomic time series dataset](https://github.com/mini-kep/intro), 
  course author on [machine readable financial statements analysis](https://github.com/ru-corporate/teaching-2018). 
  No formal computer science background, but fair math and econometrics. 
  [1k+ reputation on Stack Overflow for python](https://stackoverflow.com/users/1758363/epo)  
  
- **Zarak**: studied neuroscience at college, along with coursework in applied math and physics. hoping to study a bit of category theory via [Chapter 0](https://www.amazon.com/Algebra-Chapter-Graduate-Studies-Mathematics/dp/0821847813) by Aluffi next summer.

#### Some prior reading:

- [Intro to functional programming in python docs](https://docs.python.org/3/howto/functional.html) - we do understand most written here, but not using `itertools` as much

- [Haskell Concepts in One Sentence](https://ndrgrnd.net/posts/haskellOneSentence.html) - maybe group these concepts by level of difficulty, and work through some examples? We do not have to cover all, but it seems in interesting list of jargon and topics. 

- <http://learnyouahaskell.com/> - seems a nice intro as long at deals with familiar topics (eg map/filer, list comprehensions)

- <https://github.com/billpmurphy/hask> and [similar](https://github.com/sfermigier/awesome-functional-python#libraries) - some Haskell in python, Y: is this a good direction to learn?
  Yuras: I think it is better to start with Haskell directly, and then try to apply things to python using these libraries.

- Y: anything you can recommend for us to review?
  Yuras: No, it is more then enough. I'll introduce everything gradually.

- connections to category theory (Z: can you add a video link? will not be not in scope for this course, but lets keep the link anyways). For category theory I have [this playlist saved](https://www.youtube.com/playlist?list=PLbgaMIhjbmEnaH_LTkxLI7FMa2HsnawM_), have only watched the first lecture though - Zarak.


#### Learning objective:

> Introduction to new approaches in programming using Haskell and 

Comment: we are likely to continue use python/julia/R for development, but introduction to  
Haskell can be thought provoking for us - the result is a little change we think of developing code.

#### Questions:

- we know some functional tools in python, eg lambdas, list comprehension, iterators, `filter`, `map` (can apply), 
  `itertools` (mostly heard of). how far haskell extends these? (probably a silly question)

- Haskell type system motivation (what is being achived) and implementation

- what are the excercises to understand monad?

- `pandoc` seems the most famous popular application written in Haskell. Any story behind it?
   Was Haskell particularly well suited for file format transformations or chosen accidentally for it?

- very short overview of Haskell in production - what is Haskell community doing? 

- haslkell seems strognly typed, does this make it a fast?

- please extend / modify

- How is Haskell related to some other functional programming languages? Why use Haskell over, e.g. SML?


#### Next steps:

- [ ] merge updates to this document + videochat to discuss it
- [ ] make a simple outline for several lectures
- [ ] students should install haskell(?)
- [ ] choose format to communicate (Hangouts for video + some texting app + dump some code/notes here?)


#### Setting up Haskell

Please try to get the Glasgow Haskell Compiler installed. If you have any issue, we'll try to solve them
during the first meeting.

The easiest way to install GHC is to use the [minimal installer](https://www.haskell.org/downloads#minimal)
for your platform. Other options are OK too, e.g. you can install it using your package manager.
Also you can use online tools like [this](https://www.tutorialspoint.com/compile_haskell_online.php),
though they don't provide access to interactive environment.
