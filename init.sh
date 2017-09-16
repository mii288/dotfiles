#!/bin/sh

# ログ出力
alert() {
    echo -e "\e[33m>> ${1}\e[m"
}

if [ -e /etc/centos-release ]; then
    # CentOS
    sudo yum -y update

    alert "zshインストール"
    sudo yum -y install zsh
    sudo sh -c "echo '/usr/bin/zsh' >> /etc/shells"
    chsh -s /usr/bin/zsh

    alert "tmuxインストール"
    sudo yum -y install libevent-devel ncurses-devel automake gcc
    git clone https://github.com/tmux/tmux.git
    cd tmux
    sh autogen.sh
    ./configure && make
    sudo make install
    cd ../
    rm -Rf ./tmux

    alert "agインストール"
    sudo yum install -y the_silver_searcher
fi

# Zsh
if [ -x "`which zsh`" ]; then
    alert "zsh初期設定"
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi

# Vim
if [ -x "`which vim`" ]; then
    alert "vim初期設定"
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    sh ./installer.sh ~/.vim/bundles
    rm -Rf ./installer.sh
fi

# Git
alert "Git初期設定"
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > .git-completion.bash
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.bash > .git-prompt.bash

# シンボリックリンクの作成
sh ./reflesh.sh

# 再起動
exec $SHELL -l

alert "dotfilesの初期設定が完了しました！"
