fmap, <$>, $>, <$
ap <*>, liftA2
bind >>=


https://wiki.haskell.org/Typeclassopedia

Exercises
Implement a Monad instance for the list constructor, []. Follow the types!
Implement a Monad instance for ((->) e).
Implement Functor and Monad instances for Free f, defined as
data Free f a = Var a
              | Node (f (Free f a))
You may assume that f has a Functor instance. This is known as the free monad built from the functor f.

-----


http://blog.sigfpe.com/2007/04/trivial-monad.html

So here are a couple of exercises:

(1) define a function g :: Int -> W Int -> W Int so that g x (W y) = W (x+y). Obviously that definition won't do - the left hand side has a W y pattern so it's actually unwrapping. Rewrite this function so that the only unwrapping that happens is carried out by bind.

(2) define a function h :: W Int -> W Int -> W Int so that h (W x) (W y) = W (x+y). Again, no unwrapping.

I'm hoping that after you've done these exercises you'll see how you can still work freely with data even though it's wrapped.

In Haskell, it is more usual to use the operator >>= instead of bind where bind f x = x >>= f.

So the last question is this: why would you ever wrap data like this? In practice people tend not to use the trivial monad very much. Nonetheless, you can see how it might be used to represent tainted data. Wrapped data is considered tainted. Our API never lets us forget when data is tainted and yet it still allows us to do what we like with it. Any time we try to do anything with tainted data the result is also tainted, exactly as we might expect. What I find interesting is that almost every monad, including IO, lists and even probability, can be thought of quite naturally as variations on taint. I hope to say more about this in the near future.

Anyway, code above fails to compile because of some namespace clashes. Here's a complete definition of W that really works. Note also that fmap, which we showed we don't really need, allows us to make W an instance of Functor too:


> data W x = W x deriving Show

> instance Functor W where
>    fmap f (W x) = W (f x)

> instance Monad W where
>    return x = W x
>    W x >>= f = f x


Exercise 3: Prove the three monad laws for W. This should be almost trivial.

Exercise 4: We can't completely unwrap things using the monad API. But we can unwrap one layer from things that are wrapped twice. So here's a nice puzzle: define a function join :: W (W a) -> W a using the Monad API and no explicit unwrapping.