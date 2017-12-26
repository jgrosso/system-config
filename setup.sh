#!/bin/bash

./clean.sh

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ln -s "$DIR/.vimrc" ~/.vimrc

ln -s "$DIR/.zshrc" ~/.zshrc
ln -s "$DIR/zsh-theme" ~/.oh-my-zsh/custom

ln -s "$DIR/.emacs.d/init.el" ~/.emacs.d/init.el
ln -s "$DIR/.spacemacs" ~/.spacemacs

ln -s "$DIR/.gitconfig" ~/.gitconfig
