-- Lists all possible combinations of a set of 5 dices when fixing some the dices at current value 
-- and letting other dices roll again.
-- Solved by function rollAll

-- Orginal post: http://h2.jaguarpaw.co.uk/posts/good-design-and-type-safety-in-yahtzee/
-- Discussed at: https://twitter.com/ScottWlaschin/status/1180570149507731462
-- Repl: https://repl.it/@epogrebnyak/FairBriefObservation

import Data.Maybe

data DiceValue = One | Two | Three | Four | Five | Six deriving (Show, Eq)
data DiceChoice = Keep DiceValue | Reroll
type DiceSet = [DiceValue] -- TODO: must limit to five dice eg DiceSet d1 d2 d3 d4 d5 and make DiceSet a Traversable

rollOne :: DiceChoice -> [DiceValue]
rollOne Reroll = [One, Two, Three, Four, Five, Six]
rollOne (Keep v) = [v]

rollAll :: [DiceChoice] -> [DiceSet]
rollAll = mapM rollOne

toInt :: DiceValue -> Int
toInt v = fromJust $ lookup v [(One, 1), (Two, 2), (Three, 3), (Four, 4), (Five, 5), (Six, 6)]

-- example, just one dice rolls
diceSet1 = [Reroll, Keep Six, Keep One, Keep Three, Keep Two]
result = rollAll diceSet1
main = mapM_ (print . (map toInt)) $ result

-- QUESTION 1: how to make DiceSet below a Traversable?
-- data DiceSet = DiceSet Value Value Value Value Value -- always holds 5 dices

-- QUESTION 2: where is mapM actually defined? in Prelide the definitons are recursive between traversible and mapM.
-- *Main> :t mapM
-- mapM :: (Traversable t, Monad m) => (a -> m b) -> t a -> m (t b)
-- (a -> m b) takes type `a` (DiceChoice) and produces a monad `m b` - list of integers (list is a monad)
-- t a        is another list, list of DiceValues
-- m (t b)    is a list of lists of int 
