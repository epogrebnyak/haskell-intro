# provision an instance with at least 2GB memory, maybe from AWS command line
sudo apt-get update
sudo apt-get install haskell-platform
cabal update
cabal install aeson
cabal install http-client
cabal install http-client-tls
cabal install http-conduit
cabal install req --force-reinstalls
mkdir ~/github
git clone https://github.com/epogrebnyak/haskell-intro.git ~/github/haskell-intro
