# haskell-intro

- [Classes](#Classes)
- [Reading](#Reading)
<!-- 
People cited:
@shumovichy, @BartoszMilewski, @fsoikin - TODO: add more
-->

## Classes

This is a curated introduction to Haskell by [Yuras Shumovich](https://twitter.com/shumovichy)
as studied by [Evgeniy](https://twitter.com/PogrebnyakE) and [Zarak](https://github.com/zarak).

### Set up GHCi 

Set up GHCi Haskell on your computer or use a limited web version as
suggested [here](setup.md).

### Topic list 

Yuras original [topic list](topics.md), a great plan to learn. If you are to take 
just one thing out with you from this repo, take this topic list - it will guide you 
throughout your learning whatever resources you choose to study with.  

### Classes 

This repository holds session transcripts (as played in interpreter and saved scripts) by `class 1-7` closely following the [topics list](topics.md) above. Hoping to organise the classes for future reference. Also [notes.hs](notes.hs) has unsorted links and code bits.

### Acknowledgement

We were lucky to have Yuras as a tutor in Haskell for this small course
at the end of 2018. Yuras knows 150% of Haskell, but he adjusted instruction according to our prior knowledge (or, rather, ignorance). Initially we wanted to learn ['just some functional concepts'](how_we_started.md), but Haskell proved very immersive
and engaging. 

## Reading 

Readings about haskell are quite numerous. Good lists are [here](https://wiki.haskell.org/Learning_Haskell) and [here](https://stackoverflow.com/questions/1012573/getting-started-with-haskell).

### Top picks

There are different ways forwards, here are some clues:

- `Prelude` module holds basic functions and worth studying on its own. You can can get type declarations of Prelude by typing `:browse Prelude` in intepreter or check this command output [here](browse_prelude.hs). Examples of `Prelude` usage are included in [A Tour of the Haskell Prelude][pre]. 

[pre]: http://www.cse.chalmers.se/edu/course/TDA555/tourofprelude.html

- Bartosz Milewski's '[Category Theory for Programmers][ctp]' is a great intro to 
  Haskell itself, written in  very good technical language and rolled at a very readable pace. It is a top trending repository on Github. Not also this [playlist](https://www.youtube.com/playlist?list=PLbgaMIhjbmEnaH_LTkxLI7FMa2HsnawM_) (not related to the book).  
  
[ctp]: https://github.com/hmemcpy/milewski-ctfp-pdf

- Google [Haskell 101 and 102](https://github.com/google/haskell-trainings/releases) has two presentations that talk about Haskell from scratch. Their approach about teaching Functor, Applicative and Monad via  `fmap`, `ap`, `bind` is simple and effective.

### Quick introductions

- [Haskell Concepts in One Sentence](https://ndrgrnd.net/posts/haskellOneSentence.html) 
  luckily corresponds to our topics list!

- Skim a [cheatsheet](http://cheatsheet.codeslower.com/CheatSheet.pdf) for terminology.

- [Is Rust functional](https://www.fpcomplete.com/blog/2018/10/is-rust-functional) - yes,
  the article has simple Haskell counterexamples for Rust.

- Short and very clean [introductory blog by Will Yager](http://yager.io/CrashCourse/Haskell.html)

- [Haskell Basics (part of Write You A Haskell)](http://dev.stephendiehl.com/fun/001_basics.html)

### Longer reads

#### Core: 

- <http://learnyouahaskell.com/> - a nice intro as far as it deals with familiar topics (eg map/filer, list comprehensions).

- <http://book.realworldhaskell.org>

#### Specialty:

- [What I Wish I Knew When Learning Haskell](http://dev.stephendiehl.com/hask/) is truely a long read, but you can definitely spot parts you'll like.  

- [Learn Physics by Programming in Haskell](http://arxiv.org/abs/1412.4880)

- [haskellbook.com](http://haskellbook.com) is paid content, but one can examine [the excercises on github](https://github.com/search?o=desc&q=haskellbook&s=stars&type=Repositories)

#### More tutorials: 

- Interactive slides with several lectures on Haskell from Nishant Shuklan.
  Favourite slide: [quotes about programming languages](http://shuklan.com/haskell/lec01.html#/0/30)

- <https://www.tutorialspoint.com/haskell> - available as Android app (and looks better on android without no ads) 

<!--
#### Other:

- <http://www.cs.nott.ac.uk/~pszgmh/pih.html>
- <http://www.happylearnhaskelltutorial.com/1/first_step.html>
-->

### Special topics

- Really nice [functions by tutorial by Carl Burch](http://www.toves.org/books/hsfun/),
  the only addition could have been lambda functions
  
- [Haskell at work](https://haskell-at-work.com/episodes/2018-05-13-introduction-to-cabal.html) has a gentle introduction to cabal 

### Tiny fragments

- [Desugarization](http://www.haskellforall.com/2014/10/how-to-desugar-haskell-code.html) (list comp desugarss to do notation)  

- [Fibonacci numbers](https://wiki.haskell.org/The_Fibonacci_sequence#Naive_definition)


### Type system

- [In cartoons](http://adit.io/posts/2013-04-17-functors,_applicatives,_and_monads_in_pictures.html)
- [Don't read the monad tutorials](http://dev.stephendiehl.com/hask/#eightfold-path-to-monad-satori)
- [Typeclassopedia](https://wiki.haskell.org/Typeclassopedia) 

### Advaned topics 

- Graham Hutton, Erik Meijer. [Monadic Parsing in Haskell.](http%3A%2F%2Fwww.cs.nott.ac.uk%2F~pszgmh%2Fpearl.pdf&usg=AOvVaw1BSPFzc6UYlS64ndClR60K), 
with comments [here](https://github.com/mini-kep/kep-parser.hs/tree/master/learn-parse)

### Discussions

- Simon Peyton-Jones, one of language creators. _Escape from the ivory tower: the Haskell journey [video](https://www.youtube.com/watch?v=re96UgMk6GQ&feature=youtu.be&t=725)_. 
Shows wise and funny graphs about adoption curves of programming languages.

- Alexey Pirogov [slides][asyntax] about functional programming in general and [small English summary](https://twitter.com/PogrebnyakE/status/1107962689958174720?ref_src=twsrc%5Etfw).

[asyntax]: 
https://box.kaspersky.com/d/40f9231d6dfe4f789d31/files/?p=/%D0%90%D0%BB%D0%B5%D0%BA%D1%81%D0%B5%D0%B9%20%D0%9F%D0%B8%D1%80%D0%BE%D0%B3%D0%BE%D0%B2%20-%20%D0%A4%D1%83%D0%BD%D0%BA%D1%86%D0%B8%D0%BE%D0%BD%D0%B0%D0%BB%D1%8C%D0%BD%D0%BE%D0%B5_%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5.pdf
  

### Some Stack Overflow questions

- https://stackoverflow.com/questions/1012573/getting-started-with-haskell
- https://stackoverflow.com/questions/6400568/exponentiation-in-haskell
- [what is `x:xs`?](https://stackoverflow.com/questions/7368926/division-in-haskell)

In Russian:

- [Programming with no variables](https://ru.stackoverflow.com/a/908911/264569), a Haskell basics discussion by @fsoikin

### Courses

English:

- [Zero BS Haskell](https://github.com/alpacaaa/zero-bullshit-haskell)
- [Tsoding](https://www.youtube.com/channel/UCEbYhDd6c6vngsF5PQpFVWg)

Russian: 

- [Stepik](https://stepik.org/course/75/promo)
- [FP at ITMO](https://github.com/jagajaga/FP-Course-ITMO)
- [YouTube and code of seminars at CMC MSU](https://cmc-haskell-2018.github.io)

## Feedback

Will be [glad to hear](https://twitter.com/PogrebnyakE/status/1082306102468005891) if this repo is useful for your learning!