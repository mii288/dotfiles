#!/bin/sh
zsh
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
sh ./install.sh
sh ./reflesh.sh
chsh -s /usr/local/bin/zsh
