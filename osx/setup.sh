defaults write com.apple.dock autohide-delay -float 0; killall Dock;
defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder;

cp ../.vimrc ~/.vimrc
cp ../.zshrc ~/.zshrc

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Neovim
brew tap neovim/neovim
brew install --HEAD neovim

ln -s ~/.vimrc ~/.nvimrc
ln -s ~/.vim ~/.nvim

# Install plug

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
