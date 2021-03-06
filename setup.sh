#!/bin/bash

./clean.sh >/dev/null 2>&1

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

OS=""
case "$(uname -a)" in
  Darwin*)
    OS="macOS"
    ;;
  Linux*)
    OS="Linux"
    ;;
esac

# Homebrew
if [[ OS == "macOS" ]]; then
  ./homebrew-installer.sh
fi

# Python 3
case "$OS" in
  macOS)
    brew install python; brew postinstall python3 # See https://stackoverflow.com/questions/34573159/how-to-install-pip3-on-my-mac/47004414#comment81687642_34574269.
    ;;
  Linux)
    sudo apt install -y python3 python-dev python-pip python3-dev python3-pip
    ;;
esac

# Neovim
case "$OS" in
  macOS)
    brew install neovim
    pip3 install --user neovim
    ;;
  Linux)
    sudo add-apt-repository ppa:neovim-ppa/stable
    sudo apt update
    sudo apt install -y neovim
    ;;
esac
mkdir -p ~/.config/nvim && ln -s "$DIR/init.vim" ~/.config/nvim/init.vim

mkdir -p ~/.vim/colors
ln -s "$DIR/monokai.vim" ~/.vim/colors/monokai.vim

# Vim
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

ln -s "$DIR/.vimrc" ~/.vimrc
mkdir -p ~/.vim && sh ./vim-dein-installer.sh ~/.vim/bundles
vim "+call dein#install()" "+call dein#update()" +qall!
vim -c ":UpdateRemotePlugins" +qall!

# Spacemacs
case "$OS" in
  macOS)
    brew tap d12frosted/emacs-plus; brew install emacs-plus
    ;;
  Linux)
    sudo apt install -y emacs

    wget -O SourceCodePro-Regular.ttf "https://github.com/adobe-fonts/source-code-pro/blob/release/TTF/SourceCodePro-Regular.ttf?raw=true"
    mkdir -p ~/.fonts
    mv SourceCodePro-Regular.ttf ~/.fonts
    sudo fc-cache

    sudo apt install -y mu4e
    ;;
esac

git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
cd ~/.emacs.d && git checkout develop && cd -
ln -s "$DIR/.spacemacs" ~/.spacemacs
ln -s "$DIR/spacemacsPrivate" ~/.emacs.d/private

# Git
ln -s "$DIR/.gitconfig" ~/.gitconfig

# VS Code
if [[ OS == "macOS" ]]; then
  mkdir -p ~/Library/Application\ Support/Code/User && ln -s "$DIR/vscode.json" ~/Library/Application\ Support/Code/User/settings.json
fi

# tmux
case "$OS" in
  macOS)
    brew install tmux
    ;;
  Linux)
    sudo apt install -y tmux
    ;;
esac
ln -s "$DIR/.tmux.conf" ~/.tmux.conf

# Zsh
case "$OS" in
  macOS)
    brew install zsh zsh-completions
    ;;
  Linux)
    sudo apt install -y zsh
    ;;
esac

# See https://apple.stackexchange.com/a/302093/165765.
case "$OS" in
  macOS)
    defaults write com.apple.dock workspaces-auto-swoosh -boolean NO
    killall Dock
    ;;
esac

sudo apt install -y fonts-powerline
sh -c ./oh-my-zsh-installer.sh
ln -s "$DIR/.zshrc" ~/.zshrc
ln -s "$DIR/.zprofile" ~/.zprofile
rm -rf ~/.oh-my-zsh/custom && ln -s "$DIR/zsh-theme" ~/.oh-my-zsh/custom
chsh -s /usr/bin/zsh

mkdir -p ~/.oh-my-zsh/custom/plugins
cd ~/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting
cd -

source ~/.zshrc

# Haskell
case "$OS" in
  macOS)
    brew install haskell-stack
    ;;
  Linux)
    sudo apt install -y haskell-stack
    ;;
esac
stack upgrade --binary-only

# Personal wiki
git clone https://gitlab.com/jgrosso/personal-wiki.git ~/org-wiki
case "$OS" in
  macOS)
    ln -S "$DIR/backup-org-wiki.sh" ~/backup-org-wiki.sh
    ln -S "$DIR/com.joshuagrosso.backupOrgWiki.plist" ~/Library/LaunchAgents/com.joshuagrosso.backupOrgWiki.plist
    launchctl load ~/Library/LaunchAgents/com.joshuagrosso.backupOrgWiki.plist
    launchctl start com.joshuagrosso.backupOrgWiki
    ;;
esac
