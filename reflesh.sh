#!/bin/sh
mkdir $HOME/.config
ln -sf $(pwd)/.ctags $HOME
ln -sf $(pwd)/tmux/.tmux.conf $HOME
ln -sf $(pwd)/vim/vimrc $HOME/.vim
ln -sf $(pwd)/vim $HOME/.config/vim 
ln -sf $(pwd)/git $HOME/.config/git 
ln -sf $(pwd)/fish $HOME/.config/fish
