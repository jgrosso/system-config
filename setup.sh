#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -s "$DIR/.vimrc" ~/.vimrc
ln -s "$DIR/.zshrc" ~/.zshrc
ln -s "$DIR/zsh-theme" ~/.oh-my-zsh/custom
ln -s "$DIR/.emacs.d" ~/.emacs.d
ln -s "$DIR/.gitconfig" ~/.gitconfig
