# haskell-intro

Curated introduction to Haskell by [Yuras Shumovich](https://twitter.com/shumovichy)
as studied by [Evgeniy](https://twitter.com/PogrebnyakE) and [Zarak](https://github.com/zarak).

We were lucky to have Yuras as a tutor in Haskell for this small course
at the end of 2018. Yuras knows 150% of Haskell, but he adjusted instruction according to our prior knowledge (or, rather, ignorance). Initially we wanted to learn ['just some functional concepts'](how_we_started.md), but Haskell proved very immersive
and engaging. 

### Set up GHCi 

Set up GHCi Haskell on your computer or use a limited web version as
suggested [here](setup.md).

### Topic list 

Yuras original [topic list](topics.md), a great plan to learn. If you are to take 
just one thing out with you from this repo, take this topic list - it will guide you 
throughout your learning whatever resources you choose to study with.  

### Classes 

This repository holds session transcripts (as played in interpreter and saved scripts) by `class 1-7` closely following the topics above. Hoping to do some work on organisisng the classes for future reference. 

### Follow-up

There are different ways forwards, here are some clues:

- `Prelude` module holds basic functions and worth studying on its own. You can can get type declarations of Prelude by typing `:browse Prelude` in intepreter or check this command output [here](browse_prelude.hs). Examples of `Prelude` usage are included in [A Tour of the Haskell Prelude][pre]. 

[pre]: http://www.cse.chalmers.se/edu/course/TDA555/tourofprelude.html

- Bartosz Milewski's '[Category Theory for Programmers][ctp]' is a great intro to 
  Haskell itself, written in  very good technical language and rolled at a very readable pace. It is a top trending repository on Github. 
  
[ctp]: https://github.com/hmemcpy/milewski-ctfp-pdf

- Google [Haskell 101 and 102](https://github.com/google/haskell-trainings/releases) has two presentations that 
  talk about Haskell from scratch. Their approach about teaching Functor, Applicative and Monad via 
  `fmap`, `ap`, `bind` is simple and effective.

- Extra links for [quick and longer readings](biblio.md).

### My personal notes
- [notes.hs](notes.hs) - never finsihed 
- [Similarities to other languages](sim.md)

Will be [glad to hear](https://twitter.com/PogrebnyakE/status/1082306102468005891) if this repo is useful for your learning!
