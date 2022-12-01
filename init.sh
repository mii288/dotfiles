#!/bin/sh

# ログ出力
alert() {
    echo -e "\e[33m>> ${1}\e[m"
}

brew bundle

# シンボリックリンクの作成
sh ./reflesh.sh

# 再起動
exec $SHELL -l

# fish
fish
fisher update

alert "dotfilesの初期設定が完了しました！"
