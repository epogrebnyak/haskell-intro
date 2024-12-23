-- Radio appliance as finite state machine using State Monad

-- 1.  Inspired by FSM chapter example at 
--     https://anton-k.github.io/ru-haskell-book/book/7.html#%D0%BA%D0%BE%D0%BD%D0%B5%D1%87%D0%BD%D1%8B%D0%B5-%D0%B0%D0%B2%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D1%8B

-- 2. Very helpful to better understanding of State are chapter 8 and 9 in Hutton: 
--    https://people.cs.nott.ac.uk/pszgmh/afp.html
--    (state flow 'under water' and effects 'above water' metaphores)


-- 3. See examples from papers at https://hackage.haskell.org/package/transformers-0.6.1.2/docs/src/Control.Monad.Trans.State.Lazy.html#StateT
--    Examples:
--    - counter 
--    - tick
--    - tree labelling 

-- 4. Free programming advice used from Github Copilot, ChatGPT, Mistal and Perplexity.
--    I used LLM to debug errors and explain code, the remaining errors are my own. 

-- Things that clicked for me:

-- (a) It is ok to use `State b ()` - you can be busy with passing the state without producing effects.
--     When you do have some effect, you can add it to your computation.   
-- (b) A meaningful effect is not something you knwo from current state, otherwise it is just an inspection function.
--     It is usually something that relies of previous state and will be discarded when state changes.
--     Also State b (IO b) can be a logger.
-- (c) You can call State a 'state transformer' even before StateT, you are effectively 
--     working with a type that wraps a state transition function (t.f.), known from FSM and 
--     you can combine these two or t.f. into a new fucntions by pretending you did run them,
--     unpack the results and assemple into a new t.f. that sits and waits for am incoming initial 
--     state to be able to run.
-- (d) When you have many functions thet affect the state args -> s -> s better pack them 
--     as State (s -> ((), s)). So our architecture is [Event] -> State Radio () -> initialRadio -> Radio,
--     no effects are collected. If any events will be discarded the signa ture wil likely be 
--     [Event] -> StateT Radio (Either String) ()

-- Things that do not yet click for me:
--  Why is StateT it is sufficent to use (Either a) not (Either a b)
-- See newtype StateT s m a = StateT { runStateT :: s -> m (a,s) }


-- Excercises:

-- [x] Desugar the do notation and explain why it works in sequenceEvents
-- Note sequence operator for State discards effect and combines computation 
--  (>>) :: State s a -> State s b -> State s b
--  m >> k = State $ \s ->
--    let (_, s') = runState m s
--    in runState k s'
-- [ ] Add event (Change Int), MaxVolume, Silent
-- [ ] Assume only the radio that is on will change volume, otherwise discard the event 
-- [x] Accept list of events
-- [ ] Add Fail event and accumulate in Either [Event] in StateT
-- [ ] Accumulate portions of Event that did not go through as failed events
-- [ ] produce [Beep] as event outcome `a`
-- [ ] Collect outcomes - how many beeps there per list of events (will use mapM instead of MapM)
-- [ ] Use Writer for error log
-- [ ] Add deep fail event that will halt further transormations
-- [ ] Make list of error messages, add data type for errors eg [Error String Event]  
-- [ ] Simplify the list of Events before processing - eg cancel Up, Down  within 0..9 range.

import Control.Monad.State

-- Radio appliance state: Bool (on/off) and Int (volume)
data Radio = Radio Bool Int deriving (Show, Eq)

-- Events to modify the radio state
data Event = Push | Up | Down deriving Show

-- Accept function that modifies the state based on an event
-- note that: modify f = state (\s -> ((), f s))
accept :: Event -> State Radio ()
accept Push = modify toggleRadio
accept Up = modify (changeVolume 1) 
accept Down = modify (changeVolume (-1))

-- Function to sequence many events
acceptMany :: [Event] -> State Radio ()
acceptMany = mapM_ accept -- discard effects

-- Switch radio on and off
toggleRadio :: Radio -> Radio
toggleRadio (Radio on volume) = Radio (not on) volume

-- Assume max volume is 10
maxVolume :: Int
maxVolume = 10 

-- Change volumne by N notches
changeVolume :: Int -> Radio -> Radio
changeVolume n (Radio on volume) = Radio on volume'
    where 
        volume' = inRange (volume + n)
        inRange x = min (max x 0) maxVolume

-- Function to sequence events using do notation
 :: State Radio ()
sequenceEvents = do
  accept Push
  accept Up
  accept Up
  accept Down
  accept Push
  accept Up

sequenceMoreEvents :: State Radio ()
sequenceMoreEvents = acceptMany [Push, Up, Up, Down]

-- Example usage with do notation
main :: IO ()
main = do
  let initial = Radio False 5 -- Radio is off, volume is 5.
  let seq = sequenceEvents >> sequenceMoreEvents
  -- two pushes 
  let finalState = execState (accept Push >> accept Push) >> seq initial
  print finalState -- Radio is on, voiume is 8.
