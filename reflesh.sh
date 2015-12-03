#!/bin/sh
ln -sf ~/dotfiles/.bashrc              $HOME
ln -sf ~/dotfiles/.ctags               $HOME
ln -sf ~/dotfiles/.git-completion.bash $HOME
ln -sf ~/dotfiles/.git-prompt.sh       $HOME
ln -sf ~/dotfiles/.gitconfig           $HOME
ln -sf ~/dotfiles/.gitignore           $HOME
ln -sf ~/dotfiles/.tmux.conf           $HOME
ln -sf ~/dotfiles/.vimrc               $HOME

ln -si ~/dotfiles/zlogout              $HOME/.zlogout
ln -si ~/dotfiles/zpreztorc            $HOME/.zpreztorc
ln -si ~/dotfiles/zprofile             $HOME/.zprofile
ln -si ~/dotfiles/zshenv               $HOME/.zshenv
ln -si ~/dotfiles/zshrc                $HOME/.zshrc
