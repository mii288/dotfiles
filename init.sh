#!/bin/sh

# ログ出力
alert() {
    echo -e "\e[33m>> ${1}\e[m"
}

if [ -e /etc/centos-release ]; then
    # CentOS
    sudo yum -y update

    if ! type "zsh" > /dev/null 2>&1; then
        alert "zshインストール"
        sudo yum -y install zsh
    fi

    if ! type "tmux" > /dev/null 2>&1; then
        alert "tmuxインストール"
        sudo yum -y install libevent-devel ncurses-devel automake gcc
        git clone https://github.com/tmux/tmux.git
        cd tmux
        sh autogen.sh
        ./configure && make
        sudo make install
        cd ../
        rm -Rf ./tmux

        # Tmux Plugin Managerのインストール
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    fi

    if ! type "ag" > /dev/null 2>&1; then
        alert "agインストール"
        sudo yum install -y the_silver_searcher
    fi

    # Vim
    if type "vim" > /dev/null 2>&1; then
        alert "vim初期設定"
        curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
        sh ./installer.sh ~/.vim/bundles
        rm -Rf ./installer.sh
    fi
fi

# Zsh
if type "zsh" > /dev/null 2>&1; then
    alert "zsh初期設定"
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
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
