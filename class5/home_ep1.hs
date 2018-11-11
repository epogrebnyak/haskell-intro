-- write your own versions of Maybe and Either, make then 
-- instances of Functor, Applicative and Monad, check laws.

{-

-- fmap  
*Main> :t (<$>)
(<$>) :: Functor f => (a -> b) -> f a -> f b

-- sequential application 
*Main> :t (<*>)
(<*>) :: Applicative f => f (a -> b) -> f a -> f b

-- reverve of: 
-- Sequentially compose two actions, passing any value produced 
-- by the first as an argument to the second.
*Main> :t (=<<)
(=<<) :: Monad m => (a -> m b) -> m a -> m b

-}

-- my Either
data Either' a = Left' a | Right' a
    deriving Show
data Maybe' a = Nothing' | Just' a
    deriving Show

class Functor' f where
    fmap' :: (a -> b) -> f a -> f b    
--    (<*>) ::
--    =<<

instance (Maybe' a) => Functor' a where
    fmap' g Nothing' = Nothing'
    fmap' g (Just' x) = Just'(g x)

instance Functor' Either' a where
    fmap' g (Left' x) = Left'(g x)
    fmap' g (Right' x) = Right'(g x)
