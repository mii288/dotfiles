#!/bin/sh

# ログ出力
alert() {
    echo -e "\e[33m>> ${1}\e[m"
}

if [ -e /etc/centos-release ]; then
    # CentOS
    sudo yum -y update

    if ! type "brew" > /dev/null 2>&1; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
        test -d ~/.linuxbrew && PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"
        test -d /home/linuxbrew/.linuxbrew && PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
        test -r ~/.bash_profile && echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.bash_profile
        echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.profile
    fi

    if ! type "fish" > /dev/null 2>&1; then
        alert "fishインストール"
        sudo yum -y install fish
    fi

    if ! type "tmux" > /dev/null 2>&1; then
        brew install tmux

        # Tmux Plugin Managerのインストール
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    fi

    if ! type "ag" > /dev/null 2>&1; then
        alert "agインストール"
        sudo yum install -y the_silver_searcher
    fi

    if ! type "ctags" > /dev/null 2>&1; then
        alert "ctagsインストール"
        sudo yum install -y ctags
    fi
fi

# Zsh
if type "fish" > /dev/null 2>&1; then
    alert "fish初期設定"
    brew tap fisherman/tap
    brew install fish fisherman

    if test -r ~/.config/fish/config.fish > /dev/null 2>&1; then
        "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.config/fish/config.fish
    else
        "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >~/.config/fish/config.fish
    fi
fi

# Vim
if type "vim" > /dev/null 2>&1; then
    alert "vim初期設定"
    brew install vim
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
