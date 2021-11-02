#!/bin/sh

# ログ出力
alert() {
    echo -e "\e[33m>> ${1}\e[m"
}

# シンボリックリンクの作成
sh ./reflesh.sh

# 再起動
exec $SHELL -l

alert "dotfilesの初期設定が完了しました！"
