#!/bin/sh

rm ~/.zshrc
rm ~/.zprofile

./homebrew-uninstaller.sh

rm ~/.config/nvim/init.vim
rm ~/.vimrc
rm ~/.vim/bundles

rm -rf ~/.emacs.d
rm ~/.spacemacs

rm ~/.gitconfig

rm ~/Library/Application\ Support/Code/User/settings.json

rm ~/.tmux.conf
