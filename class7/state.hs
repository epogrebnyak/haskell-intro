
import Control.Monad.Trans
import Control.Monad.Trans.State
import Control.Monad.Trans.Except

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
  s <- ExceptT . fmap Right $ get
  lift $ put (s + 1)
  throwE (show s)
