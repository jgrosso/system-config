#!/bin/bash

./clean.sh >/dev/null 2>&1

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Zsh
ln -s "$DIR/.zshrc" ~/.zshrc
ln -s "$DIR/.zprofile" ~/.zprofile
source ~/.zshrc

# Neovim
mkdir -p ~/.config/nvim
ln -s "$DIR/init.vim" ~/.config/nvim/init.vim

# Vim
ln -s "$DIR/.vimrc" ~/.vimrc

# Spacemacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
cd ~/.emacs.d && git checkout develop && cd -
ln -s "$DIR/.spacemacs" ~/.spacemacs

# Git
ln -s "$DIR/.gitconfig" ~/.gitconfig

# VS Code
ln -s "$DIR/vscode.json" ~/Library/Application\ Support/Code/User/settings.json

# tmux
ln -s "$DIR/.tmux.conf" ~/.tmux.conf
