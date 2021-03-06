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

rm ~/.gitconfig

rm ~/Library/Application\ Support/Code/User/settings.json

rm ~/.tmux.conf

rm -rf ~/org-wiki

rm ~/Library/LaunchAgents/com.joshuagrosso.backupOrgWiki.plist
rm ~/backup-org-wiki.sh
