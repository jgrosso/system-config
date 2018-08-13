#!/bin/bash

./clean.sh >/dev/null 2>&1

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Zsh
ln -s "$DIR/.zshrc" ~/.zshrc
ln -s "$DIR/.zprofile" ~/.zprofile
source ~/.zshrc

# Homebrew
./homebrew-installer.sh

# Python 3
brew install python; brew postinstall python3 # See https://stackoverflow.com/questions/34573159/how-to-install-pip3-on-my-mac/47004414#comment81687642_34574269.

# Neovim
brew install neovim
pip3 install --user neovim
mkdir -p ~/.config/nvim && ln -s "$DIR/init.vim" ~/.config/nvim/init.vim

# Vim
brew install fzf
/usr/local/opt/fzf/install

ln -s "$DIR/.vimrc" ~/.vimrc
mkdir -p ~/.vim && sh ./vim-dein-installer.sh ~/.vim/bundles
vim "+call dein#install()" "+call dein#update()" +qall!

# Spacemacs
brew tap d12frosted/emacs-plus && brew install emacs-plus
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
cd ~/.emacs.d && git checkout develop && cd -
ln -s "$DIR/.spacemacs" ~/.spacemacs

# Git
ln -s "$DIR/.gitconfig" ~/.gitconfig

# VS Code
mkdir -p ~/Library/Application\ Support/Code/User && ln -s "$DIR/vscode.json" ~/Library/Application\ Support/Code/User/settings.json

# tmux
brew install tmux
ln -s "$DIR/.tmux.conf" ~/.tmux.conf
