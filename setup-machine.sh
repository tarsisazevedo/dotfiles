sudo pip install virtualenvwrapper

mkdir -p projetos/{pessoal,globo,freela}
cd projetos/pessoal/
git clone https://github.com/tarsisazevedo/dotfiles.git
cd dotfiles/
ln -s /Users/tarsis/projetos/pessoal/dotfiles/.gitignore_global ~/
ln -s /Users/tarsis/projetos/pessoal/dotfiles/.bash_profile ~/
ln -s /Users/tarsis/projetos/pessoal/dotfiles/.gitconfig ~/
ln -s /Users/tarsis/projetos/pessoal/dotfiles/.vimrc ~/

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew upgrade git
brew install macvim
brew linkapps macvim
brew tap tsuru/homebrew-tsuru
brew install tsuru
tsuru target-add default tsuru.globoi.com -s
tsuru key-add local ~/.ssh/id_rsa.pub
brew install redis
ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
brew install go
go get -v code.google.com/p/rog-go/exp/cmd/godef
go install -v code.google.com/p/rog-go/exp/cmd/godef
