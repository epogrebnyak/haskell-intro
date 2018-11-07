
import Control.Monad.State
import Control.Monad.Except

doWork :: State Int String
doWork = do
  str1 <- doWork1
  str2 <- doWork1
  pure (str1 ++"," ++ str2)

doWork1 :: State Int String
doWork1 = do
  s <- get
  put (s + 1)
  return (show s)

doWorkT :: ExceptT String (State Int) String
doWorkT = do
  --s <- lift get
  -- = ExceptT . liftM Right
  s <- get
  lift $ put (s + 1)
  throwE (show s)

-- ReaderT Env (State Int) String
-- StateT Int (Reader Env) String

-- RedisT
