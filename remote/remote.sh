# provision an instance with at least 2GB memory, maybe from AWS command line
# in the instance:
sudo apt-get update
sudo apt-get install haskell-platform
# global installations for cabal are not good, but this is a try
cabal update
cabal install aeson
cabal install http-client
cabal install http-client-tls
cabal install http-conduit
cabal install req --force-reinstalls
sudo apt-get install libcurl4-gnutls-dev
cabal install curl
cabal install download-curl
# download and use the excercise repo
mkdir ~/github
git clone https://github.com/epogrebnyak/haskell-intro.git ~/github/haskell-intro
# cache git password
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'
git config --global user.name "epogrebnyak"
