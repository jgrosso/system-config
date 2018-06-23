#!/bin/bash

./clean.sh >/dev/null 2>&1

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Zsh
ln -s "$DIR/.zshrc" ~/.zshrc
ln -s "$DIR/.zprofile" ~/.zprofile
source ~/.zshrc

# Homebrew
./homebrew-installer.sh

# Neovim
brew install neovim
mkdir -p ~/.config/nvim
ln -s "$DIR/init.vim" ~/.config/nvim/init.vim

# Vim
ln -s "$DIR/.vimrc" ~/.vimrc
sh ./vim-dein-installer.sh ~/.vim/bundles
vim "+call dein#install()" "+call dein#update()" +qall!

# Spacemacs
brew tap d12frosted/emacs-plus && brew install emacs-plus
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
cd ~/.emacs.d && git checkout develop && cd -
ln -s "$DIR/.spacemacs" ~/.spacemacs

# Git
ln -s "$DIR/.gitconfig" ~/.gitconfig

# VS Code
ln -s "$DIR/vscode.json" ~/Library/Application\ Support/Code/User/settings.json

# tmux
brew install tmux
ln -s "$DIR/.tmux.conf" ~/.tmux.conf
