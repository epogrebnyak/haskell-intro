# provision an instance with at least 2GB memory, AWS commandline
sudo apt-get update
sudo apt-get install haskell-platform
cabal update
cabal install aeson
mkdir ~/github
git clone https://github.com/epogrebnyak/haskell-intro.git ~/github/haskell-intro
# make an AMI/template for this installation
