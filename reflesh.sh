#!/bin/h
mkdir -p $HOME/.config/nvim

ln -sfn $(pwd)/.ctags $HOME
ln -sfn $(pwd)/tmux/.tmux.conf $HOME
ln -sfn $(pwd)/vim/vimrc $HOME/.config/nvim/init.vim
ln -sfn $(pwd)/vim/vimrc $HOME/.vimrc
ln -sfn $(pwd)/vim $HOME/.config/vim
ln -sfn $(pwd)/git $HOME/.config/git
ln -sfn $(pwd)/fish $HOME/.config/fish
