#!/bin/sh

rm ~/.zshrc
rm -rf ~/.oh-my-zsh
rm ~/.zprofile

./homebrew-uninstaller.sh

rm ~/.config/nvim/init.vim
rm ~/.vimrc
rm ~/.vim/bundles

rm -rf ~/.emacs.d
rm ~/.spacemacs

rm -rf ~/org-wiki

rm ~/.gitconfig

rm ~/Library/Application\ Support/Code/User/settings.json

rm ~/.tmux.conf
