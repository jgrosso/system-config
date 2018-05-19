#!/bin/bash

./clean.sh >/dev/null 2>&1

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Neovim
mkdir -p ~/.config/nvim
ln -s "$DIR/init.vim" ~/.config/nvim/init.vim

# Vim
ln -s "$DIR/.vimrc" ~/.vimrc

# Zsh
ln -s "$DIR/.zshrc" ~/.zshrc

# Spacemacs
mkdir -p ~/.emacs.d
ln -s "$DIR/.emacs.d/init.el" ~/.emacs.d/init.el
ln -s "$DIR/.spacemacs" ~/.spacemacs

# Git
ln -s "$DIR/.gitconfig" ~/.gitconfig
